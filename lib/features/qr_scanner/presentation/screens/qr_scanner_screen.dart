import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../bloc/qr_scanner_bloc.dart';
import '../widgets/qr_result_sheet_widget.dart';
import '../widgets/scan_overlay_painter_widget.dart';

class QrScannerScreen extends StatefulWidget {
  const QrScannerScreen({super.key});

  @override
  State<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen>
    with TickerProviderStateMixin {
  late final AnimationController _scanLineController;
  late final MobileScannerController _cameraController;
  bool _resultShown = false;

  static const _accent = Color(0xFF00E5FF);
  static const _bg = Color(0xFF0A0A0A);

  @override
  void initState() {
    super.initState();

    _cameraController = MobileScannerController(
      detectionSpeed: DetectionSpeed.normal,
      facing: CameraFacing.back,
    );

    _scanLineController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    )..repeat();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<QrScannerBloc>().add(const QrScannerStarted());
      }
    });
  }

  @override
  void dispose() {
    _scanLineController.dispose();
    _cameraController.dispose();
    super.dispose();
  }

  void _onDetect(BarcodeCapture capture) {
    final barcode = capture.barcodes.firstOrNull;
    if (barcode?.rawValue == null) return;
    context.read<QrScannerBloc>().add(QrCodeDetected(barcode!.rawValue!));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<QrScannerBloc, QrScannerState>(
      listener: (context, state) {
        if (state is QrScannerSuccess && !_resultShown) {
          _resultShown = true;
          _cameraController.stop();
          QrResultSheet.show(
            context,
            result: state.result,
            onScanAgain: () {
              _resultShown = false;
              _cameraController.start();
              context.read<QrScannerBloc>().add(const QrScannerReset());
            },
          );
        }
        if (state is QrScannerReady) {
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _BottomControls(
              torchOn: state.torchOn,
              onTorchTap: () {
                _cameraController
                    .toggleTorch(); // ← เข้าถึงได้เพราะอยู่ใน State
                context
                    .read<QrScannerBloc>()
                    .add(const QrScannerTorchToggled());
              },
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: _bg,
        body: BlocBuilder<QrScannerBloc, QrScannerState>(
          builder: (context, state) {
            return Stack(
              children: [
                // ── Camera layer ──────────────────────────────────────────
                if (state is QrScannerReady ||
                    state is QrScannerProcessing ||
                    state is QrScannerSuccess)
                  Positioned.fill(
                    child: MobileScanner(
                      controller: _cameraController,
                      onDetect: _onDetect,
                    ),
                  ),

                // ── Overlay ───────────────────────────────────────────────
                Positioned.fill(
                  child: AnimatedBuilder(
                    animation: _scanLineController,
                    builder: (_, __) => CustomPaint(
                      painter: ScanOverlayPainter(
                        cutoutSize: 260,
                        animationValue: _scanLineController.value,
                        borderColor: state is QrScannerProcessing
                            ? Colors.white
                            : _accent,
                      ),
                    ),
                  ),
                ),

                // ── Top bar ───────────────────────────────────────────────
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: _TopBar(state: state),
                ),

                // ── Status label ──────────────────────────────────────────
                Positioned(
                  bottom: 180,
                  left: 0,
                  right: 0,
                  child: _StatusLabel(state: state),
                ),

                // ── Bottom controls ───────────────────────────────────────
                if (state is QrScannerReady)
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: _BottomControls(
                      torchOn: state.torchOn,
                      onTorchTap: () => context
                          .read<QrScannerBloc>()
                          .add(const QrScannerTorchToggled()),
                    ),
                  ),

                // ── Permission denied ─────────────────────────────────────
                if (state is QrScannerPermissionDenied)
                  Positioned.fill(
                    child: _PermissionView(
                      onAllow: () => context
                          .read<QrScannerBloc>()
                          .add(const QrPermissionRequested()),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}

// ─── Top bar ─────────────────────────────────────────────────────────────────

class _TopBar extends StatelessWidget {
  final QrScannerState state;
  const _TopBar({required this.state});

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.of(context).padding.top;
    return Container(
      padding: EdgeInsets.fromLTRB(20, top + 12, 20, 12),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.maybePop(context),
            child: const SizedBox(
              width: 40,
              height: 40,
              child:
                  Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 18),
            ),
          ),
          const Spacer(),
          const Text(
            'SCAN',
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w700,
              letterSpacing: 3,
            ),
          ),
          const Spacer(),
          const SizedBox(width: 40),
        ],
      ),
    );
  }
}

// ─── Status label ─────────────────────────────────────────────────────────────

class _StatusLabel extends StatelessWidget {
  final QrScannerState state;
  const _StatusLabel({required this.state});

  @override
  Widget build(BuildContext context) {
    final (label, color) = switch (state) {
      QrScannerReady() => (
          'Position QR code in frame',
          const Color(0xFF555555)
        ),
      QrScannerProcessing() => ('PROCESSING...', const Color(0xFFFFFFFF)),
      QrScannerPermissionChecking() => (
          'Checking camera...',
          const Color(0xFF555555)
        ),
      _ => ('', Colors.transparent),
    };

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child: Text(
        label,
        key: ValueKey(label),
        textAlign: TextAlign.center,
        style: TextStyle(
          color: color,
          fontSize: 12,
          letterSpacing: 1.2,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

// ─── Bottom controls ──────────────────────────────────────────────────────────

class _BottomControls extends StatelessWidget {
  final bool torchOn;
  final VoidCallback onTorchTap;
  const _BottomControls({required this.torchOn, required this.onTorchTap});

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).padding.bottom;
    return Container(
      padding: EdgeInsets.fromLTRB(32, 24, 32, 24 + bottom),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _IconControl(
              icon: torchOn ? Icons.flash_on : Icons.flash_off,
              label: torchOn ? 'FLASH ON' : 'FLASH OFF',
              active: torchOn,
              onTap: onTorchTap),
        ],
      ),
    );
  }
}

class _IconControl extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool active;
  final VoidCallback onTap;
  const _IconControl({
    required this.icon,
    required this.label,
    required this.active,
    required this.onTap,
  });

  static const _accent = Color(0xFF00E5FF);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: active ? _accent.withOpacity(0.12) : Colors.transparent,
              border: Border.all(
                color: active ? _accent : const Color(0xFF2A2A2A),
                width: 1,
              ),
            ),
            child: Icon(icon,
                color: active ? _accent : const Color(0xFF555555), size: 22),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              color: active ? _accent : const Color(0xFF444444),
              fontSize: 10,
              letterSpacing: 1.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Permission view ──────────────────────────────────────────────────────────

class _PermissionView extends StatelessWidget {
  final VoidCallback onAllow;
  const _PermissionView({required this.onAllow});

  static const _accent = Color(0xFF00E5FF);
  static const _bg = Color(0xFF0A0A0A);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _bg,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF2A2A2A), width: 1),
            ),
            child: const Icon(Icons.camera_alt_outlined,
                color: Color(0xFF444444), size: 32),
          ),
          const SizedBox(height: 28),
          const Text(
            'CAMERA ACCESS REQUIRED',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w700,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Allow camera access to scan\nQR codes and barcodes.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF555555),
              fontSize: 13,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 40),
          GestureDetector(
            onTap: onAllow,
            child: Container(
              height: 48,
              width: double.infinity,
              alignment: Alignment.center,
              color: _accent,
              child: const Text(
                'ALLOW CAMERA',
                style: TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
