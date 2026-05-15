import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../domain/entities/qr_result.dart';

class QrResultSheet extends StatelessWidget {
  final QrResult result;
  final VoidCallback onScanAgain;

  const QrResultSheet({
    super.key,
    required this.result,
    required this.onScanAgain,
  });

  static Future<void> show(
    BuildContext context, {
    required QrResult result,
    required VoidCallback onScanAgain,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => QrResultSheet(result: result, onScanAgain: onScanAgain),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF111111),
        border: Border(top: BorderSide(color: Color(0xFF2A2A2A), width: 1)),
      ),
      padding: EdgeInsets.fromLTRB(
        24,
        24,
        24,
        24 + MediaQuery.of(context).padding.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Container(
                width: 6,
                height: 6,
                color: const Color(0xFF00E5FF),
              ),
              const SizedBox(width: 8),
              Text(
                _formatLabel(result.format),
                style: const TextStyle(
                  color: Color(0xFF00E5FF),
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                ),
              ),
              const Spacer(),
              Text(
                _formatTime(result.scannedAt),
                style: const TextStyle(
                  color: Color(0xFF555555),
                  fontSize: 11,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),
          const Divider(color: Color(0xFF1E1E1E), height: 1),
          const SizedBox(height: 16),

          // Raw value
          Text(
            result.rawValue,
            style: const TextStyle(
              color: Color(0xFFE8E8E8),
              fontSize: 15,
              height: 1.5,
              fontFamily: 'monospace',
            ),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),

          const SizedBox(height: 24),

          // Actions
          Row(
            children: [
              Expanded(
                child: _ActionButton(
                  label: 'COPY',
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: result.rawValue));
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Copied'),
                        duration: Duration(seconds: 1),
                        backgroundColor: Color(0xFF1A1A1A),
                      ),
                    );
                    onScanAgain();
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _ActionButton(
                  label: 'SCAN AGAIN',
                  primary: true,
                  onTap: () {
                    Navigator.pop(context);
                    onScanAgain();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatLabel(QrFormat format) {
    switch (format) {
      case QrFormat.qrCode:
        return 'QR CODE';
      case QrFormat.barcode:
        return 'BARCODE';
      case QrFormat.dataMatrix:
        return 'DATA MATRIX';
      case QrFormat.aztec:
        return 'AZTEC';
      default:
        return 'UNKNOWN FORMAT';
    }
  }

  String _formatTime(DateTime dt) {
    final h = dt.hour.toString().padLeft(2, '0');
    final m = dt.minute.toString().padLeft(2, '0');
    final s = dt.second.toString().padLeft(2, '0');
    return '$h:$m:$s';
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool primary;

  const _ActionButton({
    required this.label,
    required this.onTap,
    this.primary = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: primary ? const Color(0xFF00E5FF) : Colors.transparent,
          border: Border.all(
            color: primary ? const Color(0xFF00E5FF) : const Color(0xFF2A2A2A),
            width: 1,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: primary ? const Color(0xFF000000) : const Color(0xFF888888),
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.5,
          ),
        ),
      ),
    );
  }
}