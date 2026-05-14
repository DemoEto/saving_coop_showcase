import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_th.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('th'),
  ];

  /// No description provided for @coopName.
  ///
  /// In en, this message translates to:
  /// **'EGAT Saving and Credit Cooperative Limited'**
  String get coopName;

  /// No description provided for @hello.
  ///
  /// In en, this message translates to:
  /// **'Hello'**
  String get hello;

  /// No description provided for @morning.
  ///
  /// In en, this message translates to:
  /// **'Good morning'**
  String get morning;

  /// No description provided for @afternoon.
  ///
  /// In en, this message translates to:
  /// **'Good afternoon'**
  String get afternoon;

  /// No description provided for @afternoon2.
  ///
  /// In en, this message translates to:
  /// **'Good afternoon'**
  String get afternoon2;

  /// No description provided for @evening.
  ///
  /// In en, this message translates to:
  /// **'Good evening'**
  String get evening;

  /// No description provided for @evening2.
  ///
  /// In en, this message translates to:
  /// **'Good evening'**
  String get evening2;

  /// No description provided for @night.
  ///
  /// In en, this message translates to:
  /// **'Good night'**
  String get night;

  /// No description provided for @signin.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signin;

  /// No description provided for @signout.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get signout;

  /// No description provided for @changeaccount.
  ///
  /// In en, this message translates to:
  /// **'Change Account'**
  String get changeaccount;

  /// No description provided for @setting.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get setting;

  /// No description provided for @userSetting.
  ///
  /// In en, this message translates to:
  /// **'User Settings'**
  String get userSetting;

  /// No description provided for @accountSetting.
  ///
  /// In en, this message translates to:
  /// **'Account Settings'**
  String get accountSetting;

  /// No description provided for @applicationSetting.
  ///
  /// In en, this message translates to:
  /// **'Application Settings'**
  String get applicationSetting;

  /// No description provided for @otherSetting.
  ///
  /// In en, this message translates to:
  /// **'Other Settings'**
  String get otherSetting;

  /// No description provided for @thai.
  ///
  /// In en, this message translates to:
  /// **'Thai'**
  String get thai;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @small.
  ///
  /// In en, this message translates to:
  /// **'Small'**
  String get small;

  /// No description provided for @normal.
  ///
  /// In en, this message translates to:
  /// **'Normal'**
  String get normal;

  /// No description provided for @medium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get medium;

  /// No description provided for @large.
  ///
  /// In en, this message translates to:
  /// **'Large'**
  String get large;

  /// No description provided for @fontSize.
  ///
  /// In en, this message translates to:
  /// **'Font Size'**
  String get fontSize;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @failed.
  ///
  /// In en, this message translates to:
  /// **'Failed'**
  String get failed;

  /// No description provided for @dataNotFound.
  ///
  /// In en, this message translates to:
  /// **'Data not found'**
  String get dataNotFound;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @okay.
  ///
  /// In en, this message translates to:
  /// **'Okay'**
  String get okay;

  /// No description provided for @amount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get amount;

  /// No description provided for @baht.
  ///
  /// In en, this message translates to:
  /// **'Baht'**
  String get baht;

  /// No description provided for @contract.
  ///
  /// In en, this message translates to:
  /// **'Contract'**
  String get contract;

  /// No description provided for @contractNo.
  ///
  /// In en, this message translates to:
  /// **'Contract no'**
  String get contractNo;

  /// No description provided for @loanContract.
  ///
  /// In en, this message translates to:
  /// **'Loan contract'**
  String get loanContract;

  /// No description provided for @receipt.
  ///
  /// In en, this message translates to:
  /// **'Receipt'**
  String get receipt;

  /// No description provided for @extraReceipt.
  ///
  /// In en, this message translates to:
  /// **'Extra receipt'**
  String get extraReceipt;

  /// No description provided for @receiptNumber.
  ///
  /// In en, this message translates to:
  /// **'Receipt no'**
  String get receiptNumber;

  /// No description provided for @receiptDate.
  ///
  /// In en, this message translates to:
  /// **'Receipt date'**
  String get receiptDate;

  /// No description provided for @receiptType.
  ///
  /// In en, this message translates to:
  /// **'Receipt type'**
  String get receiptType;

  /// No description provided for @viewReceipt.
  ///
  /// In en, this message translates to:
  /// **'View receipt'**
  String get viewReceipt;

  /// No description provided for @youDoGuarantee.
  ///
  /// In en, this message translates to:
  /// **'You do guarantee'**
  String get youDoGuarantee;

  /// No description provided for @whoDoGuarantee.
  ///
  /// In en, this message translates to:
  /// **'Who do guarantee'**
  String get whoDoGuarantee;

  /// No description provided for @totalDeposits.
  ///
  /// In en, this message translates to:
  /// **'Total deposits'**
  String get totalDeposits;

  /// No description provided for @totalDepositsBalanceAllAccounts.
  ///
  /// In en, this message translates to:
  /// **'Total deposits balance all accounts'**
  String get totalDepositsBalanceAllAccounts;

  /// No description provided for @guaranteeBalance.
  ///
  /// In en, this message translates to:
  /// **'Guarantee balance'**
  String get guaranteeBalance;

  /// No description provided for @guaranteeMaximum.
  ///
  /// In en, this message translates to:
  /// **'Guarantee maximum'**
  String get guaranteeMaximum;

  /// No description provided for @totalLoan.
  ///
  /// In en, this message translates to:
  /// **'Total loan'**
  String get totalLoan;

  /// No description provided for @totalLoanBalanceAllContract.
  ///
  /// In en, this message translates to:
  /// **'Total loan balance all contract'**
  String get totalLoanBalanceAllContract;

  /// No description provided for @balance.
  ///
  /// In en, this message translates to:
  /// **'Balance'**
  String get balance;

  /// No description provided for @viewDeposits.
  ///
  /// In en, this message translates to:
  /// **'View Deposits'**
  String get viewDeposits;

  /// No description provided for @viewLoan.
  ///
  /// In en, this message translates to:
  /// **'View Loan'**
  String get viewLoan;

  /// No description provided for @loanAccount.
  ///
  /// In en, this message translates to:
  /// **'Loan account'**
  String get loanAccount;

  /// No description provided for @deptAccount.
  ///
  /// In en, this message translates to:
  /// **'Deposit account'**
  String get deptAccount;

  /// No description provided for @savingsAccountNo.
  ///
  /// In en, this message translates to:
  /// **'Savings account no'**
  String get savingsAccountNo;

  /// No description provided for @statementLatest.
  ///
  /// In en, this message translates to:
  /// **'Last active account'**
  String get statementLatest;

  /// No description provided for @changeLimitBalance.
  ///
  /// In en, this message translates to:
  /// **'Change limit balance'**
  String get changeLimitBalance;

  /// No description provided for @memberNo.
  ///
  /// In en, this message translates to:
  /// **'Member no'**
  String get memberNo;

  /// No description provided for @memberNo2.
  ///
  /// In en, this message translates to:
  /// **'Member no'**
  String get memberNo2;

  /// No description provided for @memberNo3.
  ///
  /// In en, this message translates to:
  /// **'Member no'**
  String get memberNo3;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password'**
  String get forgotPassword;

  /// No description provided for @incompleteInfo.
  ///
  /// In en, this message translates to:
  /// **'Incomplete information'**
  String get incompleteInfo;

  /// No description provided for @faq.
  ///
  /// In en, this message translates to:
  /// **'FAQ'**
  String get faq;

  /// No description provided for @help.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get help;

  /// No description provided for @contactCoop.
  ///
  /// In en, this message translates to:
  /// **'Contact cooperative'**
  String get contactCoop;

  /// No description provided for @foundProblem.
  ///
  /// In en, this message translates to:
  /// **'Found problem'**
  String get foundProblem;

  /// No description provided for @availableLimit.
  ///
  /// In en, this message translates to:
  /// **'Available Limit'**
  String get availableLimit;

  /// No description provided for @guarantor.
  ///
  /// In en, this message translates to:
  /// **'Guarantor'**
  String get guarantor;

  /// No description provided for @memberNoGuarantor.
  ///
  /// In en, this message translates to:
  /// **'Guarantor member no'**
  String get memberNoGuarantor;

  /// No description provided for @guaranteeAmt.
  ///
  /// In en, this message translates to:
  /// **'Guarantee amount'**
  String get guaranteeAmt;

  /// No description provided for @guaranteeBalanceAmt.
  ///
  /// In en, this message translates to:
  /// **'Guarantee balance'**
  String get guaranteeBalanceAmt;

  /// No description provided for @fee.
  ///
  /// In en, this message translates to:
  /// **'Fee'**
  String get fee;

  /// No description provided for @bankFees.
  ///
  /// In en, this message translates to:
  /// **'Bank fees'**
  String get bankFees;

  /// No description provided for @amountOfMoney.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get amountOfMoney;

  /// No description provided for @memo.
  ///
  /// In en, this message translates to:
  /// **'Memo'**
  String get memo;

  /// No description provided for @addMemo.
  ///
  /// In en, this message translates to:
  /// **'Add memo'**
  String get addMemo;

  /// No description provided for @referenceNumber.
  ///
  /// In en, this message translates to:
  /// **'Reference no'**
  String get referenceNumber;

  /// No description provided for @transactionDate.
  ///
  /// In en, this message translates to:
  /// **'Transaction date'**
  String get transactionDate;

  /// No description provided for @penaltyFeeFromCoop.
  ///
  /// In en, this message translates to:
  /// **'Penalty fee from coop'**
  String get penaltyFeeFromCoop;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @reConnect.
  ///
  /// In en, this message translates to:
  /// **'Reconnect'**
  String get reConnect;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get tryAgain;

  /// No description provided for @readAll.
  ///
  /// In en, this message translates to:
  /// **'Read all'**
  String get readAll;

  /// No description provided for @deleteAll.
  ///
  /// In en, this message translates to:
  /// **'Delete all'**
  String get deleteAll;

  /// No description provided for @deleteNotify.
  ///
  /// In en, this message translates to:
  /// **'Delete Notification'**
  String get deleteNotify;

  /// No description provided for @news.
  ///
  /// In en, this message translates to:
  /// **'News'**
  String get news;

  /// No description provided for @transaction.
  ///
  /// In en, this message translates to:
  /// **'Transaction'**
  String get transaction;

  /// No description provided for @notification.
  ///
  /// In en, this message translates to:
  /// **'Notification'**
  String get notification;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @readed.
  ///
  /// In en, this message translates to:
  /// **'Readed'**
  String get readed;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @complete.
  ///
  /// In en, this message translates to:
  /// **'Complete'**
  String get complete;

  /// No description provided for @adjust.
  ///
  /// In en, this message translates to:
  /// **'Adjust'**
  String get adjust;

  /// No description provided for @transactionLimits.
  ///
  /// In en, this message translates to:
  /// **'Transaction limits'**
  String get transactionLimits;

  /// No description provided for @referencNumber.
  ///
  /// In en, this message translates to:
  /// **'Referenc number'**
  String get referencNumber;

  /// No description provided for @reSend.
  ///
  /// In en, this message translates to:
  /// **'Re send'**
  String get reSend;

  /// No description provided for @filter.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filter;

  /// No description provided for @accountName.
  ///
  /// In en, this message translates to:
  /// **'Account name'**
  String get accountName;

  /// No description provided for @unknownItemType.
  ///
  /// In en, this message translates to:
  /// **'Unknown item type'**
  String get unknownItemType;

  /// No description provided for @totalBalanceInAccount.
  ///
  /// In en, this message translates to:
  /// **'Total balance in account'**
  String get totalBalanceInAccount;

  /// No description provided for @icon.
  ///
  /// In en, this message translates to:
  /// **'Icon'**
  String get icon;

  /// No description provided for @items.
  ///
  /// In en, this message translates to:
  /// **'Items'**
  String get items;

  /// No description provided for @paymentList.
  ///
  /// In en, this message translates to:
  /// **'Payment list'**
  String get paymentList;

  /// No description provided for @totalPayment.
  ///
  /// In en, this message translates to:
  /// **'Total payment'**
  String get totalPayment;

  /// No description provided for @receiveMoneyMethod.
  ///
  /// In en, this message translates to:
  /// **'Receive money method'**
  String get receiveMoneyMethod;

  /// No description provided for @dividend.
  ///
  /// In en, this message translates to:
  /// **'Dividend'**
  String get dividend;

  /// No description provided for @averageReturn.
  ///
  /// In en, this message translates to:
  /// **'Average return'**
  String get averageReturn;

  /// No description provided for @message.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get message;

  /// No description provided for @statement.
  ///
  /// In en, this message translates to:
  /// **'Statement'**
  String get statement;

  /// No description provided for @requestStatement.
  ///
  /// In en, this message translates to:
  /// **'Request Statement'**
  String get requestStatement;

  /// No description provided for @billing.
  ///
  /// In en, this message translates to:
  /// **'Billing'**
  String get billing;

  /// No description provided for @monthlyBilling.
  ///
  /// In en, this message translates to:
  /// **'Monthly billing'**
  String get monthlyBilling;

  /// No description provided for @uploadImage.
  ///
  /// In en, this message translates to:
  /// **'Upload image'**
  String get uploadImage;

  /// No description provided for @takeAPhoto.
  ///
  /// In en, this message translates to:
  /// **'Take a photo'**
  String get takeAPhoto;

  /// No description provided for @chooseFromGallery.
  ///
  /// In en, this message translates to:
  /// **'Choose from gallery'**
  String get chooseFromGallery;

  /// No description provided for @importFromAlbum.
  ///
  /// In en, this message translates to:
  /// **'Import from album'**
  String get importFromAlbum;

  /// No description provided for @restoreDefault.
  ///
  /// In en, this message translates to:
  /// **'Restore default'**
  String get restoreDefault;

  /// No description provided for @resizeImage.
  ///
  /// In en, this message translates to:
  /// **'Resize image'**
  String get resizeImage;

  /// No description provided for @changeProfilePicture.
  ///
  /// In en, this message translates to:
  /// **'Change profile picture'**
  String get changeProfilePicture;

  /// No description provided for @generalInfo.
  ///
  /// In en, this message translates to:
  /// **'General info'**
  String get generalInfo;

  /// No description provided for @contactInfo.
  ///
  /// In en, this message translates to:
  /// **'Contact info'**
  String get contactInfo;

  /// No description provided for @beneficiaryLetter.
  ///
  /// In en, this message translates to:
  /// **'Beneficiary letter'**
  String get beneficiaryLetter;

  /// No description provided for @beneficiary.
  ///
  /// In en, this message translates to:
  /// **'Beneficiary'**
  String get beneficiary;

  /// No description provided for @memberSignature.
  ///
  /// In en, this message translates to:
  /// **'Member signature'**
  String get memberSignature;

  /// No description provided for @birthday.
  ///
  /// In en, this message translates to:
  /// **'Birthday'**
  String get birthday;

  /// No description provided for @age.
  ///
  /// In en, this message translates to:
  /// **'Age'**
  String get age;

  /// No description provided for @memberAge.
  ///
  /// In en, this message translates to:
  /// **'Member age'**
  String get memberAge;

  /// No description provided for @dateOfMembership.
  ///
  /// In en, this message translates to:
  /// **'Date of membership'**
  String get dateOfMembership;

  /// No description provided for @position.
  ///
  /// In en, this message translates to:
  /// **'Position'**
  String get position;

  /// No description provided for @affiliation.
  ///
  /// In en, this message translates to:
  /// **'Affiliation'**
  String get affiliation;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @currentAddress.
  ///
  /// In en, this message translates to:
  /// **'Current address'**
  String get currentAddress;

  /// No description provided for @addressReceiveDocument.
  ///
  /// In en, this message translates to:
  /// **'Address receive document'**
  String get addressReceiveDocument;

  /// No description provided for @addressHouseRegistration.
  ///
  /// In en, this message translates to:
  /// **'Address house registration'**
  String get addressHouseRegistration;

  /// No description provided for @updateAddressInfo.
  ///
  /// In en, this message translates to:
  /// **'Update address information'**
  String get updateAddressInfo;

  /// No description provided for @accountImage.
  ///
  /// In en, this message translates to:
  /// **'Account image'**
  String get accountImage;

  /// No description provided for @coopAccount.
  ///
  /// In en, this message translates to:
  /// **'Coop account'**
  String get coopAccount;

  /// No description provided for @bankAccount.
  ///
  /// In en, this message translates to:
  /// **'Bank account'**
  String get bankAccount;

  /// No description provided for @addAccount.
  ///
  /// In en, this message translates to:
  /// **'Add account'**
  String get addAccount;

  /// No description provided for @identificationNumber.
  ///
  /// In en, this message translates to:
  /// **'Identification number'**
  String get identificationNumber;

  /// No description provided for @identificationNumber4Last.
  ///
  /// In en, this message translates to:
  /// **'Last 4 digits of ID card number'**
  String get identificationNumber4Last;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phoneNumber;

  /// No description provided for @addData.
  ///
  /// In en, this message translates to:
  /// **'Add data'**
  String get addData;

  /// No description provided for @editData.
  ///
  /// In en, this message translates to:
  /// **'Edit data'**
  String get editData;

  /// No description provided for @deleteData.
  ///
  /// In en, this message translates to:
  /// **'Delete data'**
  String get deleteData;

  /// No description provided for @bindAccount.
  ///
  /// In en, this message translates to:
  /// **'Bind account'**
  String get bindAccount;

  /// No description provided for @shareValue.
  ///
  /// In en, this message translates to:
  /// **'Share value'**
  String get shareValue;

  /// No description provided for @currentShare.
  ///
  /// In en, this message translates to:
  /// **'Current share'**
  String get currentShare;

  /// No description provided for @shareStock.
  ///
  /// In en, this message translates to:
  /// **'Share stock'**
  String get shareStock;

  /// No description provided for @accountNumber.
  ///
  /// In en, this message translates to:
  /// **'Account no'**
  String get accountNumber;

  /// No description provided for @bankAccountNumber.
  ///
  /// In en, this message translates to:
  /// **'Bank account no'**
  String get bankAccountNumber;

  /// No description provided for @phoneNumberRegisteredWithBank.
  ///
  /// In en, this message translates to:
  /// **'Phone number registered with bank'**
  String get phoneNumberRegisteredWithBank;

  /// No description provided for @bindWithAccount.
  ///
  /// In en, this message translates to:
  /// **'Bind with account'**
  String get bindWithAccount;

  /// No description provided for @cancelBindAccount.
  ///
  /// In en, this message translates to:
  /// **'Cancel bind account'**
  String get cancelBindAccount;

  /// No description provided for @transactionHistory.
  ///
  /// In en, this message translates to:
  /// **'Transaction history'**
  String get transactionHistory;

  /// No description provided for @enable.
  ///
  /// In en, this message translates to:
  /// **'Enable'**
  String get enable;

  /// No description provided for @enableAnd.
  ///
  /// In en, this message translates to:
  /// **'Enable {text}'**
  String enableAnd(Object text);

  /// No description provided for @disable.
  ///
  /// In en, this message translates to:
  /// **'Disable'**
  String get disable;

  /// No description provided for @disableAnd.
  ///
  /// In en, this message translates to:
  /// **'Disable {text}'**
  String disableAnd(Object text);

  /// No description provided for @notAccept.
  ///
  /// In en, this message translates to:
  /// **'Not accept'**
  String get notAccept;

  /// No description provided for @accept.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get accept;

  /// No description provided for @deny.
  ///
  /// In en, this message translates to:
  /// **'Deny'**
  String get deny;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @successTransaction.
  ///
  /// In en, this message translates to:
  /// **'Transaction complete'**
  String get successTransaction;

  /// No description provided for @unsuccessTransaction.
  ///
  /// In en, this message translates to:
  /// **'Transaction incomplete'**
  String get unsuccessTransaction;

  /// No description provided for @failedTransaction.
  ///
  /// In en, this message translates to:
  /// **'Transaction failed'**
  String get failedTransaction;

  /// No description provided for @to.
  ///
  /// In en, this message translates to:
  /// **'To'**
  String get to;

  /// No description provided for @from.
  ///
  /// In en, this message translates to:
  /// **'From'**
  String get from;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @interest.
  ///
  /// In en, this message translates to:
  /// **'Interest'**
  String get interest;

  /// No description provided for @period.
  ///
  /// In en, this message translates to:
  /// **'Period'**
  String get period;

  /// No description provided for @period2.
  ///
  /// In en, this message translates to:
  /// **'Period'**
  String get period2;

  /// No description provided for @periodAmount.
  ///
  /// In en, this message translates to:
  /// **'Period amount'**
  String get periodAmount;

  /// No description provided for @loanType.
  ///
  /// In en, this message translates to:
  /// **'Loan type'**
  String get loanType;

  /// No description provided for @periodPayment.
  ///
  /// In en, this message translates to:
  /// **'Pay per period'**
  String get periodPayment;

  /// No description provided for @startPayDate.
  ///
  /// In en, this message translates to:
  /// **'Start pay date'**
  String get startPayDate;

  /// No description provided for @payFormat.
  ///
  /// In en, this message translates to:
  /// **'Pay format'**
  String get payFormat;

  /// No description provided for @simulateTable.
  ///
  /// In en, this message translates to:
  /// **'Simulate table'**
  String get simulateTable;

  /// No description provided for @backToPreviousTable.
  ///
  /// In en, this message translates to:
  /// **'Back to previous table'**
  String get backToPreviousTable;

  /// No description provided for @principleFixed.
  ///
  /// In en, this message translates to:
  /// **'Principle fixed'**
  String get principleFixed;

  /// No description provided for @payFixed.
  ///
  /// In en, this message translates to:
  /// **'Pay fixed'**
  String get payFixed;

  /// No description provided for @destinationAccount.
  ///
  /// In en, this message translates to:
  /// **'Destination account'**
  String get destinationAccount;

  /// No description provided for @enterYourAnd.
  ///
  /// In en, this message translates to:
  /// **'Enter your {text}'**
  String enterYourAnd(Object text);

  /// No description provided for @enterYourPin.
  ///
  /// In en, this message translates to:
  /// **'Enter your PIN Code'**
  String get enterYourPin;

  /// No description provided for @yourPinWrong.
  ///
  /// In en, this message translates to:
  /// **'Invalid PIN Code'**
  String get yourPinWrong;

  /// No description provided for @pleaseTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Please try again'**
  String get pleaseTryAgain;

  /// No description provided for @setPinCode.
  ///
  /// In en, this message translates to:
  /// **'Set PIN Code'**
  String get setPinCode;

  /// No description provided for @confirmYourPin.
  ///
  /// In en, this message translates to:
  /// **'Confirm your PIN Code'**
  String get confirmYourPin;

  /// No description provided for @pinNotMatch.
  ///
  /// In en, this message translates to:
  /// **'PIN Code not match'**
  String get pinNotMatch;

  /// No description provided for @enterOldYourPin.
  ///
  /// In en, this message translates to:
  /// **'Enter old your PIN Code'**
  String get enterOldYourPin;

  /// No description provided for @resetPinCode.
  ///
  /// In en, this message translates to:
  /// **'Reset PIN Code'**
  String get resetPinCode;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset password'**
  String get resetPassword;

  /// No description provided for @confirmResetPin.
  ///
  /// In en, this message translates to:
  /// **'Reset your PIN Code?'**
  String get confirmResetPin;

  /// No description provided for @confirmForProceed.
  ///
  /// In en, this message translates to:
  /// **'Confirm for proceed'**
  String get confirmForProceed;

  /// No description provided for @favorite.
  ///
  /// In en, this message translates to:
  /// **'Favorite'**
  String get favorite;

  /// No description provided for @annual.
  ///
  /// In en, this message translates to:
  /// **'Annual'**
  String get annual;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// No description provided for @seeAll.
  ///
  /// In en, this message translates to:
  /// **'See all'**
  String get seeAll;

  /// No description provided for @relationsNews.
  ///
  /// In en, this message translates to:
  /// **'Relations news'**
  String get relationsNews;

  /// No description provided for @connectAgain.
  ///
  /// In en, this message translates to:
  /// **'Connect again'**
  String get connectAgain;

  /// No description provided for @signoutSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Sign out successfully'**
  String get signoutSuccessfully;

  /// No description provided for @registerSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Your register successfully'**
  String get registerSuccessfully;

  /// No description provided for @typeAndSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Your {type} {text} successfully'**
  String typeAndSuccessfully(Object text, Object type);

  /// No description provided for @registerComplete.
  ///
  /// In en, this message translates to:
  /// **'Register complete'**
  String get registerComplete;

  /// No description provided for @typeAndComplete.
  ///
  /// In en, this message translates to:
  /// **'{type} {text} complete'**
  String typeAndComplete(Object text, Object type);

  /// No description provided for @favoriteName.
  ///
  /// In en, this message translates to:
  /// **'Favorite name'**
  String get favoriteName;

  /// No description provided for @showAtHome.
  ///
  /// In en, this message translates to:
  /// **'Show at home'**
  String get showAtHome;

  /// No description provided for @accountForTransaction.
  ///
  /// In en, this message translates to:
  /// **'Account for transaction'**
  String get accountForTransaction;

  /// No description provided for @verify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get verify;

  /// No description provided for @verifyInformation.
  ///
  /// In en, this message translates to:
  /// **'Verify information'**
  String get verifyInformation;

  /// No description provided for @termsAndConditionsOfUse.
  ///
  /// In en, this message translates to:
  /// **'Terms and conditions of use'**
  String get termsAndConditionsOfUse;

  /// No description provided for @conditionsOfUse.
  ///
  /// In en, this message translates to:
  /// **'Conditions of use'**
  String get conditionsOfUse;

  /// No description provided for @adjustTransactionLimits.
  ///
  /// In en, this message translates to:
  /// **'Adjust transaction limits'**
  String get adjustTransactionLimits;

  /// No description provided for @adjustPreferredAmount.
  ///
  /// In en, this message translates to:
  /// **'Adjust your preferred amt.'**
  String get adjustPreferredAmount;

  /// No description provided for @confirmTransaction.
  ///
  /// In en, this message translates to:
  /// **'Confirm transaction'**
  String get confirmTransaction;

  /// No description provided for @cancelTransaction.
  ///
  /// In en, this message translates to:
  /// **'Cancel transaction'**
  String get cancelTransaction;

  /// No description provided for @pleaseEnterPassword.
  ///
  /// In en, this message translates to:
  /// **'Please enter password field'**
  String get pleaseEnterPassword;

  /// No description provided for @pleaseEnterMemberNo.
  ///
  /// In en, this message translates to:
  /// **'Please enter member no field'**
  String get pleaseEnterMemberNo;

  /// No description provided for @pleaseEnterMemberNoAndPassword.
  ///
  /// In en, this message translates to:
  /// **'Please enter member no and password field'**
  String get pleaseEnterMemberNoAndPassword;

  /// No description provided for @cannotAccessToServer.
  ///
  /// In en, this message translates to:
  /// **'Cannot access to server'**
  String get cannotAccessToServer;

  /// No description provided for @allowBeforeTransaction.
  ///
  /// In en, this message translates to:
  /// **'You must allow account before transaction'**
  String get allowBeforeTransaction;

  /// No description provided for @loginFailedLimtMessage.
  ///
  /// In en, this message translates to:
  /// **'This account will be locked if you enter the wrong password {count} more time'**
  String loginFailedLimtMessage(Object count);

  /// No description provided for @wantToSignOut.
  ///
  /// In en, this message translates to:
  /// **'Do you want to sign out?'**
  String get wantToSignOut;

  /// No description provided for @youNotLogged.
  ///
  /// In en, this message translates to:
  /// **'You are not logged in.'**
  String get youNotLogged;

  /// No description provided for @confirmReadAll.
  ///
  /// In en, this message translates to:
  /// **'mark all as read {type}?'**
  String confirmReadAll(Object type);

  /// No description provided for @confirmDeleteAll.
  ///
  /// In en, this message translates to:
  /// **'delete all {type}?'**
  String confirmDeleteAll(Object type);

  /// No description provided for @confirmDeleteNotify.
  ///
  /// In en, this message translates to:
  /// **'delete {text} ?'**
  String confirmDeleteNotify(Object text);

  /// No description provided for @confirmCancelTransaction.
  ///
  /// In en, this message translates to:
  /// **'Confirm cancel transaction?'**
  String get confirmCancelTransaction;

  /// No description provided for @confirmChangeAccount.
  ///
  /// In en, this message translates to:
  /// **'Do you want to change account?'**
  String get confirmChangeAccount;

  /// No description provided for @confirmOtp.
  ///
  /// In en, this message translates to:
  /// **'Verification OTP'**
  String get confirmOtp;

  /// No description provided for @otpSendTo.
  ///
  /// In en, this message translates to:
  /// **'OTP Send To'**
  String get otpSendTo;

  /// No description provided for @inSeconds.
  ///
  /// In en, this message translates to:
  /// **'in {time} seconds'**
  String inSeconds(Object time);

  /// No description provided for @previousOfMonth.
  ///
  /// In en, this message translates to:
  /// **'Previous {month} month'**
  String previousOfMonth(Object month);

  /// No description provided for @internetNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'Internet not available'**
  String get internetNotAvailable;

  /// No description provided for @closedForSystemMaintenance.
  ///
  /// In en, this message translates to:
  /// **'Closed for system maintenance'**
  String get closedForSystemMaintenance;

  /// No description provided for @newVersionIsAvailable.
  ///
  /// In en, this message translates to:
  /// **'New version is available'**
  String get newVersionIsAvailable;

  /// No description provided for @informationAt.
  ///
  /// In en, this message translates to:
  /// **'Info at {date}'**
  String informationAt(Object date);

  /// No description provided for @informationAtTime.
  ///
  /// In en, this message translates to:
  /// **'Info at {time}'**
  String informationAtTime(Object time);

  /// No description provided for @editMemo.
  ///
  /// In en, this message translates to:
  /// **'Edit memo'**
  String get editMemo;

  /// No description provided for @deleteMemo.
  ///
  /// In en, this message translates to:
  /// **'Delete memo'**
  String get deleteMemo;

  /// No description provided for @wantToDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete {text} ?'**
  String wantToDelete(Object text);

  /// No description provided for @wantToCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel {text} ?'**
  String wantToCancel(Object text);

  /// No description provided for @wantRestoreDefault.
  ///
  /// In en, this message translates to:
  /// **'Restore default {text} ?'**
  String wantRestoreDefault(Object text);

  /// No description provided for @addAccountForTransfer.
  ///
  /// In en, this message translates to:
  /// **'Add {type} for transactions'**
  String addAccountForTransfer(Object type);

  /// No description provided for @seleteAnd.
  ///
  /// In en, this message translates to:
  /// **'Selete {text}'**
  String seleteAnd(Object text);

  /// No description provided for @pleaseSeleteAnd.
  ///
  /// In en, this message translates to:
  /// **'Please selete {text}'**
  String pleaseSeleteAnd(Object text);

  /// No description provided for @pleaseFillAnd.
  ///
  /// In en, this message translates to:
  /// **'Please fill {text}'**
  String pleaseFillAnd(Object text);

  /// No description provided for @pleaseFillAndDigits.
  ///
  /// In en, this message translates to:
  /// **'Please fill {text} of {count} digits'**
  String pleaseFillAndDigits(Object count, Object text);

  /// No description provided for @pleaseFill2Value.
  ///
  /// In en, this message translates to:
  /// **'Please fill {text1} and {text2}'**
  String pleaseFill2Value(Object text1, Object text2);

  /// No description provided for @pleaseAnd.
  ///
  /// In en, this message translates to:
  /// **'Please {text}'**
  String pleaseAnd(Object text);

  /// No description provided for @specifyAnd.
  ///
  /// In en, this message translates to:
  /// **'Specify {text}'**
  String specifyAnd(Object text);

  /// No description provided for @dataNotFoundAnd.
  ///
  /// In en, this message translates to:
  /// **'{text} data not found'**
  String dataNotFoundAnd(Object text);

  /// No description provided for @notFoundAnd.
  ///
  /// In en, this message translates to:
  /// **'{text} not found'**
  String notFoundAnd(Object text);

  /// No description provided for @beneficiaryStatutoryHeir.
  ///
  /// In en, this message translates to:
  /// **'Beneficiary your will be statutory heir'**
  String get beneficiaryStatutoryHeir;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @addAnd.
  ///
  /// In en, this message translates to:
  /// **'add {text}'**
  String addAnd(Object text);

  /// No description provided for @editAnd.
  ///
  /// In en, this message translates to:
  /// **'edit {text}'**
  String editAnd(Object text);

  /// No description provided for @changeAnd.
  ///
  /// In en, this message translates to:
  /// **'change {text}'**
  String changeAnd(Object text);

  /// No description provided for @deleteAnd.
  ///
  /// In en, this message translates to:
  /// **'delete {text}'**
  String deleteAnd(Object text);

  /// No description provided for @signInWith.
  ///
  /// In en, this message translates to:
  /// **'Sign In with {type}'**
  String signInWith(Object type);

  /// No description provided for @useBiometricsForAccess.
  ///
  /// In en, this message translates to:
  /// **'use {type} for access {fullAppName}'**
  String useBiometricsForAccess(Object fullAppName, Object type);

  /// No description provided for @pinWillBeLocked.
  ///
  /// In en, this message translates to:
  /// **'PIN will be locked if your enter wrong {count} more time'**
  String pinWillBeLocked(Object count);

  /// No description provided for @youEnterWrongPinAgain.
  ///
  /// In en, this message translates to:
  /// **'You can enter the wrong PIN Code again {count} more times'**
  String youEnterWrongPinAgain(Object count);

  /// No description provided for @timePeriod.
  ///
  /// In en, this message translates to:
  /// **'Time period'**
  String get timePeriod;

  /// No description provided for @pleaseSpecifyTimePeriod.
  ///
  /// In en, this message translates to:
  /// **'Please specify time period'**
  String get pleaseSpecifyTimePeriod;

  /// No description provided for @resetValue.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get resetValue;

  /// No description provided for @totalDebtInAllContracts.
  ///
  /// In en, this message translates to:
  /// **'Total debt in all contracts'**
  String get totalDebtInAllContracts;

  /// No description provided for @loanApprovalAmt.
  ///
  /// In en, this message translates to:
  /// **'Loan Approval amt.'**
  String get loanApprovalAmt;

  /// No description provided for @depositBalance.
  ///
  /// In en, this message translates to:
  /// **'Deposit balance'**
  String get depositBalance;

  /// No description provided for @loanBalance.
  ///
  /// In en, this message translates to:
  /// **'Loan balance'**
  String get loanBalance;

  /// No description provided for @balanceBeginningOfYear.
  ///
  /// In en, this message translates to:
  /// **'Balance beginning of year'**
  String get balanceBeginningOfYear;

  /// No description provided for @shareMonthly.
  ///
  /// In en, this message translates to:
  /// **'Share monthly'**
  String get shareMonthly;

  /// No description provided for @startDate.
  ///
  /// In en, this message translates to:
  /// **'Start date'**
  String get startDate;

  /// No description provided for @endDate.
  ///
  /// In en, this message translates to:
  /// **'End date'**
  String get endDate;

  /// No description provided for @contractStartDate.
  ///
  /// In en, this message translates to:
  /// **'Contract start date'**
  String get contractStartDate;

  /// No description provided for @signingDate.
  ///
  /// In en, this message translates to:
  /// **'Signing date'**
  String get signingDate;

  /// No description provided for @signingAmt.
  ///
  /// In en, this message translates to:
  /// **'Signing amount'**
  String get signingAmt;

  /// No description provided for @rePay.
  ///
  /// In en, this message translates to:
  /// **'Repay'**
  String get rePay;

  /// No description provided for @principle.
  ///
  /// In en, this message translates to:
  /// **'Principle'**
  String get principle;

  /// No description provided for @guaranteeInfo.
  ///
  /// In en, this message translates to:
  /// **'Guarantee info.'**
  String get guaranteeInfo;

  /// No description provided for @loanContractDetails.
  ///
  /// In en, this message translates to:
  /// **'Loan Contract Details'**
  String get loanContractDetails;

  /// No description provided for @cancelAllowBeenAccount.
  ///
  /// In en, this message translates to:
  /// **'Cancel allow been account'**
  String get cancelAllowBeenAccount;

  /// No description provided for @confirmCancelTranAccount.
  ///
  /// In en, this message translates to:
  /// **'Confirm cancel account {account} for transaction?'**
  String confirmCancelTranAccount(Object account);

  /// No description provided for @changePassword.
  ///
  /// In en, this message translates to:
  /// **'Change password'**
  String get changePassword;

  /// No description provided for @currentPassword.
  ///
  /// In en, this message translates to:
  /// **'Current password'**
  String get currentPassword;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get newPassword;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get confirmPassword;

  /// No description provided for @confirmNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm new password'**
  String get confirmNewPassword;

  /// No description provided for @verifyPassword.
  ///
  /// In en, this message translates to:
  /// **'Verify password'**
  String get verifyPassword;

  /// No description provided for @setNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Set new password'**
  String get setNewPassword;

  /// No description provided for @showAnd.
  ///
  /// In en, this message translates to:
  /// **'Show {text}'**
  String showAnd(Object text);

  /// No description provided for @hideAnd.
  ///
  /// In en, this message translates to:
  /// **'Hide {text}'**
  String hideAnd(Object text);

  /// No description provided for @changePasswordSuccessful.
  ///
  /// In en, this message translates to:
  /// **'Change password successful'**
  String get changePasswordSuccessful;

  /// No description provided for @resetPasswordSuccessful.
  ///
  /// In en, this message translates to:
  /// **'Reset password successful'**
  String get resetPasswordSuccessful;

  /// No description provided for @yourChangePasswordComplete.
  ///
  /// In en, this message translates to:
  /// **'Change your password complete'**
  String get yourChangePasswordComplete;

  /// No description provided for @yourPasswordNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Your password not match'**
  String get yourPasswordNotMatch;

  /// No description provided for @pleaseEnterPasswordLeastCharacters.
  ///
  /// In en, this message translates to:
  /// **'Please enter a password of least {count} characters'**
  String pleaseEnterPasswordLeastCharacters(Object count);

  /// No description provided for @pleaseEnterPasswordMaximumCharacters.
  ///
  /// In en, this message translates to:
  /// **'Please enter a password maximum {count} characters'**
  String pleaseEnterPasswordMaximumCharacters(Object count);

  /// No description provided for @shareMenu.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get shareMenu;

  /// No description provided for @shareUnit.
  ///
  /// In en, this message translates to:
  /// **'Unit'**
  String get shareUnit;

  /// No description provided for @shareCapital.
  ///
  /// In en, this message translates to:
  /// **'Share capital'**
  String get shareCapital;

  /// No description provided for @currentShareCapital.
  ///
  /// In en, this message translates to:
  /// **'Current share capital'**
  String get currentShareCapital;

  /// No description provided for @saveSlip.
  ///
  /// In en, this message translates to:
  /// **'Save slip'**
  String get saveSlip;

  /// No description provided for @saveAndComplete.
  ///
  /// In en, this message translates to:
  /// **'Save {text} complete'**
  String saveAndComplete(Object text);

  /// No description provided for @updateAndComplete.
  ///
  /// In en, this message translates to:
  /// **'Update {text} complete'**
  String updateAndComplete(Object text);

  /// No description provided for @deleteAndComplete.
  ///
  /// In en, this message translates to:
  /// **'Delete {text} complete'**
  String deleteAndComplete(Object text);

  /// No description provided for @catnotSaveSlip.
  ///
  /// In en, this message translates to:
  /// **'Cat not save slip'**
  String get catnotSaveSlip;

  /// No description provided for @catnotSaveQRCode.
  ///
  /// In en, this message translates to:
  /// **'Cat not save QR Code'**
  String get catnotSaveQRCode;

  /// No description provided for @saveQRCodeSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Save QR Code successfully'**
  String get saveQRCodeSuccessfully;

  /// No description provided for @saveSlipSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Save slip successfully'**
  String get saveSlipSuccessfully;

  /// No description provided for @accountForTransactions.
  ///
  /// In en, this message translates to:
  /// **'Account for transactions'**
  String get accountForTransactions;

  /// No description provided for @notEnoughMoneyForTransaction.
  ///
  /// In en, this message translates to:
  /// **'Not enough money for transaction'**
  String get notEnoughMoneyForTransaction;

  /// No description provided for @chooseAccount.
  ///
  /// In en, this message translates to:
  /// **'Choose account'**
  String get chooseAccount;

  /// No description provided for @accountRecipient.
  ///
  /// In en, this message translates to:
  /// **'Account recipient'**
  String get accountRecipient;

  /// No description provided for @accNoRecipient.
  ///
  /// In en, this message translates to:
  /// **'Account no recipient'**
  String get accNoRecipient;

  /// No description provided for @accountDataNotFound.
  ///
  /// In en, this message translates to:
  /// **'Account data not found'**
  String get accountDataNotFound;

  /// No description provided for @thisAccountNotFoundTryAgain.
  ///
  /// In en, this message translates to:
  /// **'This account data not found. Try again'**
  String get thisAccountNotFoundTryAgain;

  /// No description provided for @feeDataNotFound.
  ///
  /// In en, this message translates to:
  /// **'Fee data not found'**
  String get feeDataNotFound;

  /// No description provided for @notice.
  ///
  /// In en, this message translates to:
  /// **'Notice'**
  String get notice;

  /// No description provided for @doYouWishToCancel.
  ///
  /// In en, this message translates to:
  /// **'Do you wish to cancel?'**
  String get doYouWishToCancel;

  /// No description provided for @transfer.
  ///
  /// In en, this message translates to:
  /// **'Transfer'**
  String get transfer;

  /// No description provided for @loanPayment.
  ///
  /// In en, this message translates to:
  /// **'Loan payment'**
  String get loanPayment;

  /// No description provided for @manage.
  ///
  /// In en, this message translates to:
  /// **'manage'**
  String get manage;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @theSessionHasExpired.
  ///
  /// In en, this message translates to:
  /// **'The session has expired.'**
  String get theSessionHasExpired;

  /// No description provided for @theSessionHasExpiredDoYouWant.
  ///
  /// In en, this message translates to:
  /// **'The session has expired. Do you want to continue using {appName}?'**
  String theSessionHasExpiredDoYouWant(Object appName);

  /// No description provided for @confirmInfo.
  ///
  /// In en, this message translates to:
  /// **'Confirm info'**
  String get confirmInfo;

  /// No description provided for @invalidEmailFormat.
  ///
  /// In en, this message translates to:
  /// **'Invalid email format'**
  String get invalidEmailFormat;

  /// No description provided for @pleaseEnterAtLeastOneUppercaseAndOneNumber.
  ///
  /// In en, this message translates to:
  /// **'Please enter password is uppercase, lowercase and number least one'**
  String get pleaseEnterAtLeastOneUppercaseAndOneNumber;

  /// No description provided for @passwordMustUseAtLeastOneUppercaseAndNumber.
  ///
  /// In en, this message translates to:
  /// **'Password must use uppercase, lowercase and number least one'**
  String get passwordMustUseAtLeastOneUppercaseAndNumber;

  /// No description provided for @pleaseEnterBaBaBaAtLeastOne.
  ///
  /// In en, this message translates to:
  /// **'Please enter password is {text} least one'**
  String pleaseEnterBaBaBaAtLeastOne(Object text);

  /// No description provided for @passwordMustUseBaBaBaAtLeastOne.
  ///
  /// In en, this message translates to:
  /// **'Password must use {text} least one'**
  String passwordMustUseBaBaBaAtLeastOne(Object text);

  /// No description provided for @lowercase.
  ///
  /// In en, this message translates to:
  /// **'Lowercase'**
  String get lowercase;

  /// No description provided for @uppercase.
  ///
  /// In en, this message translates to:
  /// **'Uppercase'**
  String get uppercase;

  /// No description provided for @number.
  ///
  /// In en, this message translates to:
  /// **'Number'**
  String get number;

  /// No description provided for @specialCharacters.
  ///
  /// In en, this message translates to:
  /// **'Special characters'**
  String get specialCharacters;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @example.
  ///
  /// In en, this message translates to:
  /// **'Example'**
  String get example;

  /// No description provided for @withdrawable.
  ///
  /// In en, this message translates to:
  /// **'Withdrawable'**
  String get withdrawable;

  /// No description provided for @inProgress.
  ///
  /// In en, this message translates to:
  /// **'In progress'**
  String get inProgress;

  /// No description provided for @doYouWantAnd.
  ///
  /// In en, this message translates to:
  /// **'Do you want {text}?'**
  String doYouWantAnd(Object text);

  /// No description provided for @viewBalanceAtHome.
  ///
  /// In en, this message translates to:
  /// **'View balance at home'**
  String get viewBalanceAtHome;

  /// No description provided for @welfareNo.
  ///
  /// In en, this message translates to:
  /// **'Welfare no'**
  String get welfareNo;

  /// No description provided for @welfareYear.
  ///
  /// In en, this message translates to:
  /// **'Welfare year'**
  String get welfareYear;

  /// No description provided for @welfareLimit.
  ///
  /// In en, this message translates to:
  /// **'Welfare limit'**
  String get welfareLimit;

  /// No description provided for @totalWelfare.
  ///
  /// In en, this message translates to:
  /// **'Total welfare'**
  String get totalWelfare;

  /// No description provided for @totalWelfareAllYear.
  ///
  /// In en, this message translates to:
  /// **'Total welfare all year'**
  String get totalWelfareAllYear;

  /// No description provided for @year.
  ///
  /// In en, this message translates to:
  /// **'Year'**
  String get year;

  /// No description provided for @month.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get month;

  /// No description provided for @day.
  ///
  /// In en, this message translates to:
  /// **'Day'**
  String get day;

  /// No description provided for @noAdditionalInformationWasFound.
  ///
  /// In en, this message translates to:
  /// **'No additional information was found'**
  String get noAdditionalInformationWasFound;

  /// No description provided for @relationship.
  ///
  /// In en, this message translates to:
  /// **'Relationship'**
  String get relationship;

  /// No description provided for @bindAccountInfo.
  ///
  /// In en, this message translates to:
  /// **'Bind account info'**
  String get bindAccountInfo;

  /// No description provided for @pleaseCheckAllInformation.
  ///
  /// In en, this message translates to:
  /// **'Please check all information'**
  String get pleaseCheckAllInformation;

  /// No description provided for @confirmDataForBindAccount.
  ///
  /// In en, this message translates to:
  /// **'Confirm data for bind account'**
  String get confirmDataForBindAccount;

  /// No description provided for @selectYourCoopAccountForTransaction.
  ///
  /// In en, this message translates to:
  /// **'Select your coop account for transaction'**
  String get selectYourCoopAccountForTransaction;

  /// No description provided for @selectYourCoopAccountForFees.
  ///
  /// In en, this message translates to:
  /// **'Select your coop account for fees'**
  String get selectYourCoopAccountForFees;

  /// No description provided for @coopAccountForFees.
  ///
  /// In en, this message translates to:
  /// **'Coop account for fees'**
  String get coopAccountForFees;

  /// No description provided for @changeFeesAccount.
  ///
  /// In en, this message translates to:
  /// **'Change fees account'**
  String get changeFeesAccount;

  /// No description provided for @bindYourCoopAccountTo.
  ///
  /// In en, this message translates to:
  /// **'Bind your coop account to'**
  String get bindYourCoopAccountTo;

  /// No description provided for @donotShowAgain.
  ///
  /// In en, this message translates to:
  /// **'Don\'t show again'**
  String get donotShowAgain;

  /// No description provided for @gotIt.
  ///
  /// In en, this message translates to:
  /// **'Got it'**
  String get gotIt;

  /// No description provided for @netAmount.
  ///
  /// In en, this message translates to:
  /// **'Net amount'**
  String get netAmount;

  /// No description provided for @youForcedLogoutPleaseLoginAgain.
  ///
  /// In en, this message translates to:
  /// **'You are forced to log out. Please login again'**
  String get youForcedLogoutPleaseLoginAgain;

  /// No description provided for @youForcedLogoutForPinCodeAttemptPleaseLoginAgain.
  ///
  /// In en, this message translates to:
  /// **'You are forced to log out because the PIN code is incorrect. Please login again'**
  String get youForcedLogoutForPinCodeAttemptPleaseLoginAgain;

  /// No description provided for @requestType.
  ///
  /// In en, this message translates to:
  /// **'Request type'**
  String get requestType;

  /// No description provided for @installmentPayment.
  ///
  /// In en, this message translates to:
  /// **'Installment payment'**
  String get installmentPayment;

  /// No description provided for @maximum.
  ///
  /// In en, this message translates to:
  /// **'Maximum'**
  String get maximum;

  /// No description provided for @minimum.
  ///
  /// In en, this message translates to:
  /// **'Minimum'**
  String get minimum;

  /// No description provided for @characters.
  ///
  /// In en, this message translates to:
  /// **'Characters'**
  String get characters;

  /// No description provided for @youNeedSetPasswordAtLeastCharacters.
  ///
  /// In en, this message translates to:
  /// **'You need to set a password at least {number} characters or more'**
  String youNeedSetPasswordAtLeastCharacters(Object number);

  /// No description provided for @youMustSetPasswordUpToCharacters.
  ///
  /// In en, this message translates to:
  /// **'You must set a password up to {number} characters'**
  String youMustSetPasswordUpToCharacters(Object number);

  /// No description provided for @and.
  ///
  /// In en, this message translates to:
  /// **'and'**
  String get and;

  /// No description provided for @simulatePaymentTable.
  ///
  /// In en, this message translates to:
  /// **'Simulate payment table'**
  String get simulatePaymentTable;

  /// No description provided for @pleaseChangePasswordForSecurity.
  ///
  /// In en, this message translates to:
  /// **'Please change your password for security'**
  String get pleaseChangePasswordForSecurity;

  /// No description provided for @passwordYouAreUsingTempPassword.
  ///
  /// In en, this message translates to:
  /// **'The password you are using is a temp password'**
  String get passwordYouAreUsingTempPassword;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading'**
  String get loading;

  /// No description provided for @plaeseWait.
  ///
  /// In en, this message translates to:
  /// **'Plaese wait'**
  String get plaeseWait;

  /// No description provided for @receivedDate.
  ///
  /// In en, this message translates to:
  /// **'Received date'**
  String get receivedDate;

  /// No description provided for @welfarePayDate.
  ///
  /// In en, this message translates to:
  /// **'Welfare pay date'**
  String get welfarePayDate;

  /// No description provided for @newsRecordingNotFound.
  ///
  /// In en, this message translates to:
  /// **'News recording data not found'**
  String get newsRecordingNotFound;

  /// No description provided for @todayNewsNotFound.
  ///
  /// In en, this message translates to:
  /// **'Today news not found'**
  String get todayNewsNotFound;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @recordedList.
  ///
  /// In en, this message translates to:
  /// **'Recorded list'**
  String get recordedList;

  /// No description provided for @cancelSave.
  ///
  /// In en, this message translates to:
  /// **'Cancel save'**
  String get cancelSave;

  /// No description provided for @activitie.
  ///
  /// In en, this message translates to:
  /// **'Activitie'**
  String get activitie;

  /// No description provided for @cooperativeActivities.
  ///
  /// In en, this message translates to:
  /// **'Cooperative activities'**
  String get cooperativeActivities;

  /// No description provided for @allActivities.
  ///
  /// In en, this message translates to:
  /// **'All activities'**
  String get allActivities;

  /// No description provided for @upcomingActivities.
  ///
  /// In en, this message translates to:
  /// **'Upcoming activities'**
  String get upcomingActivities;

  /// No description provided for @newsDetails.
  ///
  /// In en, this message translates to:
  /// **'News details'**
  String get newsDetails;

  /// No description provided for @activitiesDetails.
  ///
  /// In en, this message translates to:
  /// **'Activities details'**
  String get activitiesDetails;

  /// No description provided for @readMore.
  ///
  /// In en, this message translates to:
  /// **'Read more'**
  String get readMore;

  /// No description provided for @schedule.
  ///
  /// In en, this message translates to:
  /// **'Schedule'**
  String get schedule;

  /// No description provided for @notSpecified.
  ///
  /// In en, this message translates to:
  /// **'Not specified'**
  String get notSpecified;

  /// No description provided for @time.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get time;

  /// No description provided for @forgotPin.
  ///
  /// In en, this message translates to:
  /// **'Forgot PIN'**
  String get forgotPin;

  /// No description provided for @enableNotification.
  ///
  /// In en, this message translates to:
  /// **'Enable notification'**
  String get enableNotification;

  /// No description provided for @receiveNotifications.
  ///
  /// In en, this message translates to:
  /// **'Receive notifications'**
  String get receiveNotifications;

  /// No description provided for @receiveNotificationsAnd.
  ///
  /// In en, this message translates to:
  /// **'Receive {text} notifications'**
  String receiveNotificationsAnd(Object text);

  /// No description provided for @loginByEmail.
  ///
  /// In en, this message translates to:
  /// **'Login by email'**
  String get loginByEmail;

  /// No description provided for @youMustAllowAppToAccessNotifications.
  ///
  /// In en, this message translates to:
  /// **'You must allow \'{fullAppName}\' to access notifications'**
  String youMustAllowAppToAccessNotifications(Object fullAppName);

  /// No description provided for @theSystemSentTempPasswordToEmail.
  ///
  /// In en, this message translates to:
  /// **'The system has sent a temporary login password to email'**
  String get theSystemSentTempPasswordToEmail;

  /// No description provided for @theSystemSentTempPasswordToPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'The system has sent a temporary login password to phone number'**
  String get theSystemSentTempPasswordToPhoneNumber;

  /// No description provided for @pleaseCheckYourInbox.
  ///
  /// In en, this message translates to:
  /// **'Please check your inbox'**
  String get pleaseCheckYourInbox;

  /// No description provided for @pleaseCheckYourSmsMessage.
  ///
  /// In en, this message translates to:
  /// **'Please check your SMS Message'**
  String get pleaseCheckYourSmsMessage;

  /// No description provided for @sendRequest.
  ///
  /// In en, this message translates to:
  /// **'Send a request'**
  String get sendRequest;

  /// No description provided for @latestMonth.
  ///
  /// In en, this message translates to:
  /// **'Latest month'**
  String get latestMonth;

  /// No description provided for @requestStatementAccountSuccessful.
  ///
  /// In en, this message translates to:
  /// **'Request statement account {account} successful'**
  String requestStatementAccountSuccessful(Object account);

  /// No description provided for @requestWithholdingTaxCertificateSuccessful.
  ///
  /// In en, this message translates to:
  /// **'Request withholding tax certificate successful'**
  String get requestWithholdingTaxCertificateSuccessful;

  /// No description provided for @paymentAmount.
  ///
  /// In en, this message translates to:
  /// **'Payment amount'**
  String get paymentAmount;

  /// No description provided for @seeDetails.
  ///
  /// In en, this message translates to:
  /// **'See details'**
  String get seeDetails;

  /// No description provided for @billingAmount.
  ///
  /// In en, this message translates to:
  /// **'Billing amount'**
  String get billingAmount;

  /// No description provided for @viewBill.
  ///
  /// In en, this message translates to:
  /// **'View bill'**
  String get viewBill;

  /// No description provided for @mobilePhoneNumberForContact.
  ///
  /// In en, this message translates to:
  /// **'Mobile phone number for contact'**
  String get mobilePhoneNumberForContact;

  /// No description provided for @mobilePhoneNumForReceivingOTP.
  ///
  /// In en, this message translates to:
  /// **'Mobile phone number for receiving OTP'**
  String get mobilePhoneNumForReceivingOTP;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// No description provided for @unableContactServerAtThisTimeTryAgainLater.
  ///
  /// In en, this message translates to:
  /// **'Unable to contact the server at this time, please try again later'**
  String get unableContactServerAtThisTimeTryAgainLater;

  /// No description provided for @unableConnectInternetPleaseCheckYourCarrierNetwork.
  ///
  /// In en, this message translates to:
  /// **'Unable to connect to the internet Please check your carrier network. If the internet is ready, the system will automatically reconnect'**
  String get unableConnectInternetPleaseCheckYourCarrierNetwork;

  /// No description provided for @weAreImprovingTheSystemToDevelopApplicationsToWorkBetter.
  ///
  /// In en, this message translates to:
  /// **'We are improving the system to develop applications to work better. We will be back soon If you have an urgent matter, please contact the cooperative'**
  String get weAreImprovingTheSystemToDevelopApplicationsToWorkBetter;

  /// No description provided for @weUpdateApplicationToMakeItWorkBetterForYou.
  ///
  /// In en, this message translates to:
  /// **'We update the application to make it work better for you. Download the latest version to use new features'**
  String get weUpdateApplicationToMakeItWorkBetterForYou;

  /// No description provided for @comeBackLater.
  ///
  /// In en, this message translates to:
  /// **'Come back later'**
  String get comeBackLater;

  /// No description provided for @scanToCheck.
  ///
  /// In en, this message translates to:
  /// **'Scan to check'**
  String get scanToCheck;

  /// No description provided for @successful.
  ///
  /// In en, this message translates to:
  /// **'{text} successful'**
  String successful(Object text);

  /// No description provided for @unsuccessful.
  ///
  /// In en, this message translates to:
  /// **'{text} unsuccessful'**
  String unsuccessful(Object text);

  /// No description provided for @ifYouWishToSaveSlipYouMustAllowApplicationToAccessStorage.
  ///
  /// In en, this message translates to:
  /// **'If you wish to save a slip, you must allow the application to access the storage'**
  String get ifYouWishToSaveSlipYouMustAllowApplicationToAccessStorage;

  /// No description provided for @doYouWantToAdjustLimit.
  ///
  /// In en, this message translates to:
  /// **'Do you want to adjust the \'{type}\' limit to {money} baht?'**
  String doYouWantToAdjustLimit(Object money, Object type);

  /// No description provided for @pincodeChangedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'PIN Code changed successfully'**
  String get pincodeChangedSuccessfully;

  /// No description provided for @youHaveSuccessfullyChangedYourPincode.
  ///
  /// In en, this message translates to:
  /// **'You have successfully changed your PIN Code'**
  String get youHaveSuccessfullyChangedYourPincode;

  /// No description provided for @thereIsNewerVersionUpdatedNow.
  ///
  /// In en, this message translates to:
  /// **'There is a newer version updated now'**
  String get thereIsNewerVersionUpdatedNow;

  /// No description provided for @cooperativesPayGiveMembers.
  ///
  /// In en, this message translates to:
  /// **'Coop. pay give members'**
  String get cooperativesPayGiveMembers;

  /// No description provided for @insurancePremium.
  ///
  /// In en, this message translates to:
  /// **'Insurance premium'**
  String get insurancePremium;

  /// No description provided for @policyStartDate.
  ///
  /// In en, this message translates to:
  /// **'Policy start date'**
  String get policyStartDate;

  /// No description provided for @unableToLoadFile.
  ///
  /// In en, this message translates to:
  /// **'Unable to load file'**
  String get unableToLoadFile;

  /// No description provided for @welfareRequestsSuccessful.
  ///
  /// In en, this message translates to:
  /// **'Welfare requests successful'**
  String get welfareRequestsSuccessful;

  /// No description provided for @youHaveSuccessfullyRequestedWelfare.
  ///
  /// In en, this message translates to:
  /// **'You have successfully requested welfare'**
  String get youHaveSuccessfullyRequestedWelfare;

  /// No description provided for @confirmPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Confirm phone number'**
  String get confirmPhoneNumber;

  /// No description provided for @phoneNumberRegisteredWithCoop.
  ///
  /// In en, this message translates to:
  /// **'Phone number registered with coop.'**
  String get phoneNumberRegisteredWithCoop;

  /// No description provided for @invalidAnd.
  ///
  /// In en, this message translates to:
  /// **'Invalid {text}'**
  String invalidAnd(Object text);

  /// No description provided for @phoneNumberDoesNotMatchWithCooperativeIfYouChangePhonePleaseContactCoop.
  ///
  /// In en, this message translates to:
  /// **'Phone number does not match information with cooperative. If you change phone number please contact cooperative'**
  String
  get phoneNumberDoesNotMatchWithCooperativeIfYouChangePhonePleaseContactCoop;

  /// No description provided for @rejected.
  ///
  /// In en, this message translates to:
  /// **'Rejected'**
  String get rejected;

  /// No description provided for @theProcessRejectedIncorrectPIN.
  ///
  /// In en, this message translates to:
  /// **'The process was rejected due to incorrect PIN entered'**
  String get theProcessRejectedIncorrectPIN;

  /// No description provided for @multiSeleted.
  ///
  /// In en, this message translates to:
  /// **'Multi seleted'**
  String get multiSeleted;

  /// No description provided for @confirmAddAccount.
  ///
  /// In en, this message translates to:
  /// **'Confirm add account'**
  String get confirmAddAccount;

  /// No description provided for @doYouWantToAddForTransfer.
  ///
  /// In en, this message translates to:
  /// **'Do you want to {text} for transaction?'**
  String doYouWantToAddForTransfer(Object text);

  /// No description provided for @canBeUsed.
  ///
  /// In en, this message translates to:
  /// **'Can be used'**
  String get canBeUsed;

  /// No description provided for @unsafeDevice.
  ///
  /// In en, this message translates to:
  /// **'Unsafe device'**
  String get unsafeDevice;

  /// No description provided for @rootDetectedOnYourDevice.
  ///
  /// In en, this message translates to:
  /// **'root/jailbreak detected on your device for safety of using application, please use the device without root/jailbreak'**
  String get rootDetectedOnYourDevice;

  /// No description provided for @salary.
  ///
  /// In en, this message translates to:
  /// **'Salary'**
  String get salary;

  /// No description provided for @maxLoanRights.
  ///
  /// In en, this message translates to:
  /// **'Max loan rights'**
  String get maxLoanRights;

  /// No description provided for @amountOfRequestLoan.
  ///
  /// In en, this message translates to:
  /// **'Amount of request loan'**
  String get amountOfRequestLoan;

  /// No description provided for @deductExistingDebtAndInterest.
  ///
  /// In en, this message translates to:
  /// **'Deduct exist debt and internet'**
  String get deductExistingDebtAndInterest;

  /// No description provided for @deductExistingDebt.
  ///
  /// In en, this message translates to:
  /// **'Deduct exist debt'**
  String get deductExistingDebt;

  /// No description provided for @amountToBeReceived.
  ///
  /// In en, this message translates to:
  /// **'Amount to be received'**
  String get amountToBeReceived;

  /// No description provided for @amountRequestedThisMonth.
  ///
  /// In en, this message translates to:
  /// **'Amount requested this month'**
  String get amountRequestedThisMonth;

  /// No description provided for @maximumWithdrawalLimit.
  ///
  /// In en, this message translates to:
  /// **'Maximum withdrawal limit'**
  String get maximumWithdrawalLimit;

  /// No description provided for @receiveMoneyFrom.
  ///
  /// In en, this message translates to:
  /// **'Receive money from'**
  String get receiveMoneyFrom;

  /// No description provided for @thisDevice.
  ///
  /// In en, this message translates to:
  /// **'This device'**
  String get thisDevice;

  /// No description provided for @loggedIn.
  ///
  /// In en, this message translates to:
  /// **'Logged in'**
  String get loggedIn;

  /// No description provided for @thisDeviceCannotBeDeleted.
  ///
  /// In en, this message translates to:
  /// **'This device cannot be deleted'**
  String get thisDeviceCannotBeDeleted;

  /// No description provided for @deleteDevice.
  ///
  /// In en, this message translates to:
  /// **'Delete device'**
  String get deleteDevice;

  /// No description provided for @confirmDeviceRemoval.
  ///
  /// In en, this message translates to:
  /// **'Confirm device removal'**
  String get confirmDeviceRemoval;

  /// No description provided for @approvalPayDate.
  ///
  /// In en, this message translates to:
  /// **'Approval pay date'**
  String get approvalPayDate;

  /// No description provided for @approvalDate.
  ///
  /// In en, this message translates to:
  /// **'Approval date'**
  String get approvalDate;

  /// No description provided for @interestPayment.
  ///
  /// In en, this message translates to:
  /// **'Interest payment'**
  String get interestPayment;

  /// No description provided for @principalPayment.
  ///
  /// In en, this message translates to:
  /// **'Principal payment'**
  String get principalPayment;

  /// No description provided for @loanEstimateBalance.
  ///
  /// In en, this message translates to:
  /// **'Loan estimate balance'**
  String get loanEstimateBalance;

  /// No description provided for @haveToIncreaseShare.
  ///
  /// In en, this message translates to:
  /// **'Have to increase share'**
  String get haveToIncreaseShare;

  /// No description provided for @requestWelfare.
  ///
  /// In en, this message translates to:
  /// **'Request welfare'**
  String get requestWelfare;

  /// No description provided for @welfareRequestStatus.
  ///
  /// In en, this message translates to:
  /// **'Welfare request status'**
  String get welfareRequestStatus;

  /// No description provided for @offsettingExistingLoans.
  ///
  /// In en, this message translates to:
  /// **'Offsetting existing loans'**
  String get offsettingExistingLoans;

  /// No description provided for @estimatesNetReceipt.
  ///
  /// In en, this message translates to:
  /// **'Estimates net receipt'**
  String get estimatesNetReceipt;

  /// No description provided for @note.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get note;

  /// No description provided for @remark.
  ///
  /// In en, this message translates to:
  /// **'Remark'**
  String get remark;

  /// No description provided for @accountReceive.
  ///
  /// In en, this message translates to:
  /// **'Account receive'**
  String get accountReceive;

  /// No description provided for @coopAccountReceive.
  ///
  /// In en, this message translates to:
  /// **'Coop account receive'**
  String get coopAccountReceive;

  /// No description provided for @coopAccountReceiveLoan.
  ///
  /// In en, this message translates to:
  /// **'Coop account receive loan'**
  String get coopAccountReceiveLoan;

  /// No description provided for @requestNumber.
  ///
  /// In en, this message translates to:
  /// **'Request number'**
  String get requestNumber;

  /// No description provided for @requestNo.
  ///
  /// In en, this message translates to:
  /// **'Request no'**
  String get requestNo;

  /// No description provided for @loanRequestNumber.
  ///
  /// In en, this message translates to:
  /// **'Loan request number'**
  String get loanRequestNumber;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @theInsured.
  ///
  /// In en, this message translates to:
  /// **'The insured'**
  String get theInsured;

  /// No description provided for @borrower.
  ///
  /// In en, this message translates to:
  /// **'Borrower'**
  String get borrower;

  /// No description provided for @billNumber.
  ///
  /// In en, this message translates to:
  /// **'Bill number'**
  String get billNumber;

  /// No description provided for @billDate.
  ///
  /// In en, this message translates to:
  /// **'Bill date'**
  String get billDate;

  /// No description provided for @enterPincodeToConfirmProceed.
  ///
  /// In en, this message translates to:
  /// **'Enter PIN Code to confirm proceed'**
  String get enterPincodeToConfirmProceed;

  /// No description provided for @deposit.
  ///
  /// In en, this message translates to:
  /// **'Deposit'**
  String get deposit;

  /// No description provided for @loan.
  ///
  /// In en, this message translates to:
  /// **'Loan'**
  String get loan;

  /// No description provided for @thereAreDepositAccounts.
  ///
  /// In en, this message translates to:
  /// **'There are {count} deposit accounts'**
  String thereAreDepositAccounts(Object count);

  /// No description provided for @thereAreLoanContract.
  ///
  /// In en, this message translates to:
  /// **'There are {count} loan contract'**
  String thereAreLoanContract(Object count);

  /// No description provided for @other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get other;

  /// No description provided for @goToTheApprovalPage.
  ///
  /// In en, this message translates to:
  /// **'Go to the approval page'**
  String get goToTheApprovalPage;

  /// No description provided for @proportion.
  ///
  /// In en, this message translates to:
  /// **'Proportion'**
  String get proportion;

  /// No description provided for @approve.
  ///
  /// In en, this message translates to:
  /// **'Approve'**
  String get approve;

  /// No description provided for @requester.
  ///
  /// In en, this message translates to:
  /// **'Requester'**
  String get requester;

  /// No description provided for @dateRequested.
  ///
  /// In en, this message translates to:
  /// **'Date requested'**
  String get dateRequested;

  /// No description provided for @approveDate.
  ///
  /// In en, this message translates to:
  /// **'Approve date'**
  String get approveDate;

  /// No description provided for @rejectDate.
  ///
  /// In en, this message translates to:
  /// **'reject date'**
  String get rejectDate;

  /// No description provided for @approveRequest.
  ///
  /// In en, this message translates to:
  /// **'Approve request'**
  String get approveRequest;

  /// No description provided for @rejectRequest.
  ///
  /// In en, this message translates to:
  /// **'Reject request'**
  String get rejectRequest;

  /// No description provided for @youHaveApproved.
  ///
  /// In en, this message translates to:
  /// **'You have approved'**
  String get youHaveApproved;

  /// No description provided for @pendingApproval.
  ///
  /// In en, this message translates to:
  /// **'Pending approval'**
  String get pendingApproval;

  /// No description provided for @approvalHistory.
  ///
  /// In en, this message translates to:
  /// **'Approval history'**
  String get approvalHistory;

  /// No description provided for @doYouWantToApproveRequestAmountOfBaht.
  ///
  /// In en, this message translates to:
  /// **'Do you want to approve the request for {account} amount of {amount} baht?'**
  String doYouWantToApproveRequestAmountOfBaht(Object account, Object amount);

  /// No description provided for @doYouWantToRejectRequestAmountOfBaht.
  ///
  /// In en, this message translates to:
  /// **'Do you want to reject the request for {account} amount of {amount} baht?'**
  String doYouWantToRejectRequestAmountOfBaht(Object account, Object amount);

  /// No description provided for @doYouWantToCancelRequestForDocNo.
  ///
  /// In en, this message translates to:
  /// **'Do you want to cancel the request for Document number {docNo}?'**
  String doYouWantToCancelRequestForDocNo(Object docNo);

  /// No description provided for @youHaveApprovedRequestSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'You have approved the request for {account} amount of {amount} baht successfully'**
  String youHaveApprovedRequestSuccessfully(Object account, Object amount);

  /// No description provided for @youHaveRejectedRequestSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'You have rejected the request for {account} amount of {amount} baht successfully'**
  String youHaveRejectedRequestSuccessfully(Object account, Object amount);

  /// No description provided for @youWantApproveRequestSuccessfullyBy.
  ///
  /// In en, this message translates to:
  /// **'You have approved the {reqNo} request of {name} successfully'**
  String youWantApproveRequestSuccessfullyBy(Object name, Object reqNo);

  /// No description provided for @youWantRejectRequestSuccessfullyBy.
  ///
  /// In en, this message translates to:
  /// **'You have rejected the {reqNo} request of {name} successfully'**
  String youWantRejectRequestSuccessfullyBy(Object name, Object reqNo);

  /// No description provided for @doYouWantToApproveTheRequestOf.
  ///
  /// In en, this message translates to:
  /// **'Do you want to approve the {reqNo} request of {name}?'**
  String doYouWantToApproveTheRequestOf(Object name, Object reqNo);

  /// No description provided for @doYouWantToRejectTheRequestOf.
  ///
  /// In en, this message translates to:
  /// **'Do you want to reject the {reqNo} request of {name}?'**
  String doYouWantToRejectTheRequestOf(Object name, Object reqNo);

  /// No description provided for @evidenceForRequests.
  ///
  /// In en, this message translates to:
  /// **'Evidence for requests'**
  String get evidenceForRequests;

  /// No description provided for @copyOfCitizenCard.
  ///
  /// In en, this message translates to:
  /// **'Copy of citizen card'**
  String get copyOfCitizenCard;

  /// No description provided for @copyOfTheBorrowerGuarantorCard.
  ///
  /// In en, this message translates to:
  /// **'Copy of the borrower/guarantor card'**
  String get copyOfTheBorrowerGuarantorCard;

  /// No description provided for @copyOfHouseRegistration.
  ///
  /// In en, this message translates to:
  /// **'Copy of house registration'**
  String get copyOfHouseRegistration;

  /// No description provided for @salarySlip.
  ///
  /// In en, this message translates to:
  /// **'Salary slip'**
  String get salarySlip;

  /// No description provided for @theImageIsTooLarge.
  ///
  /// In en, this message translates to:
  /// **'The image is too large'**
  String get theImageIsTooLarge;

  /// No description provided for @calculatePeriodPayment.
  ///
  /// In en, this message translates to:
  /// **'Calculate period payment'**
  String get calculatePeriodPayment;

  /// No description provided for @submitRequest.
  ///
  /// In en, this message translates to:
  /// **'Submit a request'**
  String get submitRequest;

  /// No description provided for @theRequestIsComplete.
  ///
  /// In en, this message translates to:
  /// **'The request is complete'**
  String get theRequestIsComplete;

  /// No description provided for @youHaveSubmittedLoanRequestSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'You have submitted a loan request type \'{type}\' successfully. Your request Doc no. {docNo}'**
  String youHaveSubmittedLoanRequestSuccessfully(Object docNo, Object type);

  /// No description provided for @loanMustNotExceed.
  ///
  /// In en, this message translates to:
  /// **'Loan must not exceed'**
  String get loanMustNotExceed;

  /// No description provided for @currentPeriod.
  ///
  /// In en, this message translates to:
  /// **'Current period'**
  String get currentPeriod;

  /// No description provided for @lastPeriod.
  ///
  /// In en, this message translates to:
  /// **'Last period'**
  String get lastPeriod;

  /// No description provided for @paymentPattern.
  ///
  /// In en, this message translates to:
  /// **'Payment pattern'**
  String get paymentPattern;

  /// No description provided for @amountMustBeAnInteger.
  ///
  /// In en, this message translates to:
  /// **'Amount must be an integer'**
  String get amountMustBeAnInteger;

  /// No description provided for @amountGreaterThanTheMaximumLoanRight.
  ///
  /// In en, this message translates to:
  /// **'Amount greater than the maximum loan right'**
  String get amountGreaterThanTheMaximumLoanRight;

  /// No description provided for @amountHigherThanTheMaximumAmount.
  ///
  /// In en, this message translates to:
  /// **'Amount higher than the maximum amount'**
  String get amountHigherThanTheMaximumAmount;

  /// No description provided for @amountLessThanTheMinimum.
  ///
  /// In en, this message translates to:
  /// **'Amount less than the minimum'**
  String get amountLessThanTheMinimum;

  /// No description provided for @periodGreaterThanTheMaximum.
  ///
  /// In en, this message translates to:
  /// **'Period greater than the maximum'**
  String get periodGreaterThanTheMaximum;

  /// No description provided for @periodLessThanTheMinimum.
  ///
  /// In en, this message translates to:
  /// **'Period less than the minimum'**
  String get periodLessThanTheMinimum;

  /// No description provided for @creditBalance.
  ///
  /// In en, this message translates to:
  /// **'Credit balance'**
  String get creditBalance;

  /// No description provided for @cumulativeInterest.
  ///
  /// In en, this message translates to:
  /// **'Cumulative interest'**
  String get cumulativeInterest;

  /// No description provided for @interestBalance.
  ///
  /// In en, this message translates to:
  /// **'Interest balance'**
  String get interestBalance;

  /// No description provided for @averagePurchase.
  ///
  /// In en, this message translates to:
  /// **'Average purchase'**
  String get averagePurchase;

  /// No description provided for @guaranteeDeposit.
  ///
  /// In en, this message translates to:
  /// **'Guarantee deposit'**
  String get guaranteeDeposit;

  /// No description provided for @guaranteeAssets.
  ///
  /// In en, this message translates to:
  /// **'Guarantee assets'**
  String get guaranteeAssets;

  /// No description provided for @updateMemberInfoComplete.
  ///
  /// In en, this message translates to:
  /// **'Update member info complete'**
  String get updateMemberInfoComplete;

  /// No description provided for @youWantUpdateMemberInfoSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'You want update member info successfully'**
  String get youWantUpdateMemberInfoSuccessfully;

  /// No description provided for @requestLoan.
  ///
  /// In en, this message translates to:
  /// **'Request a loan'**
  String get requestLoan;

  /// No description provided for @thisTypeOfFileIsNotSupported.
  ///
  /// In en, this message translates to:
  /// **'This type of file is not supported'**
  String get thisTypeOfFileIsNotSupported;

  /// No description provided for @onlySupportsJpgPngFileTypes.
  ///
  /// In en, this message translates to:
  /// **'Only supports jpg, jpeg, png file types'**
  String get onlySupportsJpgPngFileTypes;

  /// No description provided for @onlySupportsFileTypes.
  ///
  /// In en, this message translates to:
  /// **'Only supports {type} file types'**
  String onlySupportsFileTypes(Object type);

  /// No description provided for @cannotAccessCamera.
  ///
  /// In en, this message translates to:
  /// **'Cannot access camera'**
  String get cannotAccessCamera;

  /// No description provided for @cannotAccountStorage.
  ///
  /// In en, this message translates to:
  /// **'Cannot account storage'**
  String get cannotAccountStorage;

  /// No description provided for @ifYouWishToScanQrYouMustAllowApplicationToAccessCamera.
  ///
  /// In en, this message translates to:
  /// **'If you wish to scan the QR code, you must allow the application to access camera'**
  String get ifYouWishToScanQrYouMustAllowApplicationToAccessCamera;

  /// No description provided for @ifYouWishToScanQrYouMustAllowApplicationToAccessStorage.
  ///
  /// In en, this message translates to:
  /// **'If you wish to scan the QR code, you must allow the application to access storage'**
  String get ifYouWishToScanQrYouMustAllowApplicationToAccessStorage;

  /// No description provided for @goToKplus.
  ///
  /// In en, this message translates to:
  /// **'Go to K-PLUS'**
  String get goToKplus;

  /// No description provided for @goToScbeasy.
  ///
  /// In en, this message translates to:
  /// **'Go to SCB EASY'**
  String get goToScbeasy;

  /// No description provided for @goToKrungthaiNext.
  ///
  /// In en, this message translates to:
  /// **'Go to Krungthai NEXT'**
  String get goToKrungthaiNext;

  /// No description provided for @backToApp.
  ///
  /// In en, this message translates to:
  /// **'Back to {app}'**
  String backToApp(Object app);

  /// No description provided for @cannotGoToAppPleaseCheckYourDeviceHasInstalled.
  ///
  /// In en, this message translates to:
  /// **'Can\'t go to {app} Please check your device has installed {app} and it\'s the latest version?'**
  String cannotGoToAppPleaseCheckYourDeviceHasInstalled(Object app);

  /// No description provided for @documentNumber.
  ///
  /// In en, this message translates to:
  /// **'Document number'**
  String get documentNumber;

  /// No description provided for @docNo.
  ///
  /// In en, this message translates to:
  /// **'Doc No.'**
  String get docNo;

  /// No description provided for @details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details;

  /// No description provided for @descriptions.
  ///
  /// In en, this message translates to:
  /// **'Descriptions'**
  String get descriptions;

  /// No description provided for @moreDetails.
  ///
  /// In en, this message translates to:
  /// **'More details'**
  String get moreDetails;

  /// No description provided for @requestStatus.
  ///
  /// In en, this message translates to:
  /// **'Request status'**
  String get requestStatus;

  /// No description provided for @cancelRequest.
  ///
  /// In en, this message translates to:
  /// **'Cancel request'**
  String get cancelRequest;

  /// No description provided for @cancelLoanRequest.
  ///
  /// In en, this message translates to:
  /// **'Cancel for loan request'**
  String get cancelLoanRequest;

  /// No description provided for @waitForAccept.
  ///
  /// In en, this message translates to:
  /// **'Wait for accept'**
  String get waitForAccept;

  /// No description provided for @disapproved.
  ///
  /// In en, this message translates to:
  /// **'Disapproved'**
  String get disapproved;

  /// No description provided for @approved.
  ///
  /// In en, this message translates to:
  /// **'Approved'**
  String get approved;

  /// No description provided for @acceptForCheckRight.
  ///
  /// In en, this message translates to:
  /// **'Accept for check right'**
  String get acceptForCheckRight;

  /// No description provided for @statusAnd.
  ///
  /// In en, this message translates to:
  /// **'Status {text}'**
  String statusAnd(Object text);

  /// No description provided for @cancelFilter.
  ///
  /// In en, this message translates to:
  /// **'Cancel filter'**
  String get cancelFilter;

  /// No description provided for @haveReadAndAcceptTheTermsOfLoanRequest.
  ///
  /// In en, this message translates to:
  /// **'I have read and accept the terms of loan request'**
  String get haveReadAndAcceptTheTermsOfLoanRequest;

  /// No description provided for @termsAndConditionsOfLoanRequest.
  ///
  /// In en, this message translates to:
  /// **'Terms and conditions of loan request'**
  String get termsAndConditionsOfLoanRequest;

  /// No description provided for @paymentChannel.
  ///
  /// In en, this message translates to:
  /// **'Payment channel'**
  String get paymentChannel;

  /// No description provided for @totalBalance.
  ///
  /// In en, this message translates to:
  /// **'Total balance'**
  String get totalBalance;

  /// No description provided for @thisServiceIsCurrentlyUnavailablePleaseTryAgainLater.
  ///
  /// In en, this message translates to:
  /// **'This service is currently unavailable. Please try again later'**
  String get thisServiceIsCurrentlyUnavailablePleaseTryAgainLater;

  /// No description provided for @documentLoadingFailed.
  ///
  /// In en, this message translates to:
  /// **'Document loading failed'**
  String get documentLoadingFailed;

  /// No description provided for @documentNotFound.
  ///
  /// In en, this message translates to:
  /// **'Document not found'**
  String get documentNotFound;

  /// No description provided for @canceled.
  ///
  /// In en, this message translates to:
  /// **'Canceled'**
  String get canceled;

  /// No description provided for @viewRequest.
  ///
  /// In en, this message translates to:
  /// **'View request'**
  String get viewRequest;

  /// No description provided for @cannotFindCoopAccountForTransactionsPleaseAddAccountForTransactionBeforeBindingBankAccount.
  ///
  /// In en, this message translates to:
  /// **'Cannot find a cooperative account for transactions. Please add an account for transaction before binding bank account'**
  String
  get cannotFindCoopAccountForTransactionsPleaseAddAccountForTransactionBeforeBindingBankAccount;

  /// No description provided for @goToCoopAccount.
  ///
  /// In en, this message translates to:
  /// **'Go to coop account'**
  String get goToCoopAccount;

  /// No description provided for @createQRcode.
  ///
  /// In en, this message translates to:
  /// **'Create a QR code'**
  String get createQRcode;

  /// No description provided for @transactionsType.
  ///
  /// In en, this message translates to:
  /// **'Transactions type'**
  String get transactionsType;

  /// No description provided for @theMinimumTransactionAmountIsBahtPerUnit.
  ///
  /// In en, this message translates to:
  /// **'The minimum transaction amount is {amount} baht per unit'**
  String theMinimumTransactionAmountIsBahtPerUnit(Object amount);

  /// No description provided for @calculateNewLoanRights.
  ///
  /// In en, this message translates to:
  /// **'Calculate new loan rights'**
  String get calculateNewLoanRights;

  /// No description provided for @minimumTransactionBaht.
  ///
  /// In en, this message translates to:
  /// **'Minimum transaction {amount} baht'**
  String minimumTransactionBaht(Object amount);

  /// No description provided for @transactionCannotExceedBaht.
  ///
  /// In en, this message translates to:
  /// **'The transaction cannot exceed {amount} baht'**
  String transactionCannotExceedBaht(Object amount);

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @haveReadAndAgreeToTheTermsOfService.
  ///
  /// In en, this message translates to:
  /// **'I have read and agree to the terms of service'**
  String get haveReadAndAgreeToTheTermsOfService;

  /// No description provided for @bankAccountNumberThatCanBeTransacted.
  ///
  /// In en, this message translates to:
  /// **'Bank account number that can be transacted'**
  String get bankAccountNumberThatCanBeTransacted;

  /// No description provided for @newUsersEnterTheirCitizenId.
  ///
  /// In en, this message translates to:
  /// **'New users enter their Citizen ID'**
  String get newUsersEnterTheirCitizenId;

  /// No description provided for @receiveDividendMethod.
  ///
  /// In en, this message translates to:
  /// **'Receive dividend method'**
  String get receiveDividendMethod;

  /// No description provided for @youHaveBindPromptPaySuccessfully.
  ///
  /// In en, this message translates to:
  /// **'You have bind PromptPay successfully'**
  String get youHaveBindPromptPaySuccessfully;

  /// No description provided for @youHaveBindPromptPayAccount.
  ///
  /// In en, this message translates to:
  /// **'You have bind PromptPay account'**
  String get youHaveBindPromptPayAccount;

  /// No description provided for @successfully.
  ///
  /// In en, this message translates to:
  /// **'Successfully'**
  String get successfully;

  /// No description provided for @treatmentCost.
  ///
  /// In en, this message translates to:
  /// **'Treatment cost'**
  String get treatmentCost;

  /// No description provided for @totalBilledAmount.
  ///
  /// In en, this message translates to:
  /// **'Total billed amount'**
  String get totalBilledAmount;

  /// No description provided for @protectionStartDate.
  ///
  /// In en, this message translates to:
  /// **'Protection start date'**
  String get protectionStartDate;

  /// No description provided for @protectionEndDate.
  ///
  /// In en, this message translates to:
  /// **'Protection end date'**
  String get protectionEndDate;

  /// No description provided for @protectionLimit.
  ///
  /// In en, this message translates to:
  /// **'Protection limit'**
  String get protectionLimit;

  /// No description provided for @receiveMoneyStatus.
  ///
  /// In en, this message translates to:
  /// **'Receive money status'**
  String get receiveMoneyStatus;

  /// No description provided for @receivedMoney.
  ///
  /// In en, this message translates to:
  /// **'Received money'**
  String get receivedMoney;

  /// No description provided for @notReceivedMoney.
  ///
  /// In en, this message translates to:
  /// **'Not received money'**
  String get notReceivedMoney;

  /// No description provided for @payDate.
  ///
  /// In en, this message translates to:
  /// **'Pay date'**
  String get payDate;

  /// No description provided for @payDate2.
  ///
  /// In en, this message translates to:
  /// **'Pay date'**
  String get payDate2;

  /// No description provided for @cremationNo.
  ///
  /// In en, this message translates to:
  /// **'Cremation No'**
  String get cremationNo;

  /// No description provided for @payer.
  ///
  /// In en, this message translates to:
  /// **'Payer'**
  String get payer;

  /// No description provided for @pollingPlace.
  ///
  /// In en, this message translates to:
  /// **'Polling place'**
  String get pollingPlace;

  /// No description provided for @welfareRecipient.
  ///
  /// In en, this message translates to:
  /// **'Welfare recipient'**
  String get welfareRecipient;

  /// No description provided for @bindAccountSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Bind account successfully'**
  String get bindAccountSuccessfully;

  /// No description provided for @postalCode.
  ///
  /// In en, this message translates to:
  /// **'Postal Code'**
  String get postalCode;

  /// No description provided for @province.
  ///
  /// In en, this message translates to:
  /// **'Province'**
  String get province;

  /// No description provided for @districtArea.
  ///
  /// In en, this message translates to:
  /// **'District/Area'**
  String get districtArea;

  /// No description provided for @subDistrictSubArea.
  ///
  /// In en, this message translates to:
  /// **'Sub-district/Sub-area'**
  String get subDistrictSubArea;

  /// No description provided for @road.
  ///
  /// In en, this message translates to:
  /// **'Road'**
  String get road;

  /// No description provided for @village.
  ///
  /// In en, this message translates to:
  /// **'Village'**
  String get village;

  /// No description provided for @numbers.
  ///
  /// In en, this message translates to:
  /// **'Number'**
  String get numbers;

  /// No description provided for @moo.
  ///
  /// In en, this message translates to:
  /// **'Moo'**
  String get moo;

  /// No description provided for @soi.
  ///
  /// In en, this message translates to:
  /// **'Soi'**
  String get soi;

  /// No description provided for @payper.
  ///
  /// In en, this message translates to:
  /// **'Pay'**
  String get payper;

  /// No description provided for @conditionsForWelfare.
  ///
  /// In en, this message translates to:
  /// **'Conditions for welfare'**
  String get conditionsForWelfare;

  /// No description provided for @welfareInfo.
  ///
  /// In en, this message translates to:
  /// **'Welfare info'**
  String get welfareInfo;

  /// No description provided for @interestReceivedAccount.
  ///
  /// In en, this message translates to:
  /// **'Interest received account'**
  String get interestReceivedAccount;

  /// No description provided for @howToCalculateDividends.
  ///
  /// In en, this message translates to:
  /// **'How to calculate Dividends - Average return'**
  String get howToCalculateDividends;

  /// No description provided for @loanRightsBalance.
  ///
  /// In en, this message translates to:
  /// **'Loan rights balance'**
  String get loanRightsBalance;

  /// No description provided for @balanceConfirm.
  ///
  /// In en, this message translates to:
  /// **'Balance confirm'**
  String get balanceConfirm;

  /// No description provided for @docBalanceConfirm.
  ///
  /// In en, this message translates to:
  /// **'Document balance confirm'**
  String get docBalanceConfirm;

  /// No description provided for @answerDocBalanceConfirm.
  ///
  /// In en, this message translates to:
  /// **'Answer document balance confirm'**
  String get answerDocBalanceConfirm;

  /// No description provided for @correct.
  ///
  /// In en, this message translates to:
  /// **'Correct'**
  String get correct;

  /// No description provided for @notCorrect.
  ///
  /// In en, this message translates to:
  /// **'Not correct'**
  String get notCorrect;

  /// No description provided for @youHaveSuccessfullyConfirmedBalance.
  ///
  /// In en, this message translates to:
  /// **'You have successfully confirmed the balance'**
  String get youHaveSuccessfullyConfirmedBalance;

  /// No description provided for @youHaveSuccessfullyConfirmedBalanceIfYouWantToModifyBalancePleaseContactCooperative.
  ///
  /// In en, this message translates to:
  /// **'You have successfully confirmed the balance on {date} If you want to modify the balance confirmation, please contact the cooperative'**
  String
  youHaveSuccessfullyConfirmedBalanceIfYouWantToModifyBalancePleaseContactCooperative(
    Object date,
  );

  /// No description provided for @objective.
  ///
  /// In en, this message translates to:
  /// **'Objective'**
  String get objective;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @bankbook.
  ///
  /// In en, this message translates to:
  /// **'Bank book'**
  String get bankbook;

  /// No description provided for @bookcoop.
  ///
  /// In en, this message translates to:
  /// **'Cooperative book'**
  String get bookcoop;

  /// No description provided for @bank.
  ///
  /// In en, this message translates to:
  /// **'Bank'**
  String get bank;

  /// No description provided for @honorarium.
  ///
  /// In en, this message translates to:
  /// **'Honorarium'**
  String get honorarium;

  /// No description provided for @receiveNetDividends.
  ///
  /// In en, this message translates to:
  /// **'Receive net dividends'**
  String get receiveNetDividends;

  /// No description provided for @welfareFund.
  ///
  /// In en, this message translates to:
  /// **'Welfare fund'**
  String get welfareFund;

  /// No description provided for @dividendRate.
  ///
  /// In en, this message translates to:
  /// **'Dividend rate'**
  String get dividendRate;

  /// No description provided for @averageReturnRate.
  ///
  /// In en, this message translates to:
  /// **'Average return rate'**
  String get averageReturnRate;

  /// No description provided for @createSchedule.
  ///
  /// In en, this message translates to:
  /// **'Create schedule'**
  String get createSchedule;

  /// No description provided for @cancelSchedule.
  ///
  /// In en, this message translates to:
  /// **'Cancel schedule'**
  String get cancelSchedule;

  /// No description provided for @sourceAccount.
  ///
  /// In en, this message translates to:
  /// **'Source account'**
  String get sourceAccount;

  /// No description provided for @chooseSourceAccount.
  ///
  /// In en, this message translates to:
  /// **'Choose source account'**
  String get chooseSourceAccount;

  /// No description provided for @activeItems.
  ///
  /// In en, this message translates to:
  /// **'Active items'**
  String get activeItems;

  /// No description provided for @expiredItems.
  ///
  /// In en, this message translates to:
  /// **'Expired items'**
  String get expiredItems;

  /// No description provided for @buyShares.
  ///
  /// In en, this message translates to:
  /// **'Buy shares'**
  String get buyShares;

  /// No description provided for @withholdingTaxCertificate.
  ///
  /// In en, this message translates to:
  /// **'Withholding tax certificate'**
  String get withholdingTaxCertificate;

  /// No description provided for @youWantToRequestWithholdingTaxCertificate.
  ///
  /// In en, this message translates to:
  /// **'You want to request Certificate of withholding tax?'**
  String get youWantToRequestWithholdingTaxCertificate;

  /// No description provided for @requestWithholdingTaxCertificateSuccessfulSendEmail.
  ///
  /// In en, this message translates to:
  /// **'Request a successful withholding tax certificate The document has been sent to the email \"{email}\"'**
  String requestWithholdingTaxCertificateSuccessfulSendEmail(Object email);

  /// No description provided for @memberInfo.
  ///
  /// In en, this message translates to:
  /// **'Member Info'**
  String get memberInfo;

  /// No description provided for @expiresDate.
  ///
  /// In en, this message translates to:
  /// **'Expires date'**
  String get expiresDate;

  /// No description provided for @destination.
  ///
  /// In en, this message translates to:
  /// **'Destination'**
  String get destination;

  /// No description provided for @latestUpdate.
  ///
  /// In en, this message translates to:
  /// **'Latest update'**
  String get latestUpdate;

  /// No description provided for @manageFavorites.
  ///
  /// In en, this message translates to:
  /// **'Manage favorites'**
  String get manageFavorites;

  /// No description provided for @thisFavoriteAlreadyThere.
  ///
  /// In en, this message translates to:
  /// **'This favorite is already there'**
  String get thisFavoriteAlreadyThere;

  /// No description provided for @once.
  ///
  /// In en, this message translates to:
  /// **'Once'**
  String get once;

  /// No description provided for @weekly.
  ///
  /// In en, this message translates to:
  /// **'Weekly'**
  String get weekly;

  /// No description provided for @monthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get monthly;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @chooseDate.
  ///
  /// In en, this message translates to:
  /// **'Choose date'**
  String get chooseDate;

  /// No description provided for @chooseMonthly.
  ///
  /// In en, this message translates to:
  /// **'Choose monthly'**
  String get chooseMonthly;

  /// No description provided for @dateoftheMonth.
  ///
  /// In en, this message translates to:
  /// **'The {text} of every month'**
  String dateoftheMonth(Object text);

  /// No description provided for @every.
  ///
  /// In en, this message translates to:
  /// **'Every'**
  String get every;

  /// No description provided for @chooseAnd.
  ///
  /// In en, this message translates to:
  /// **'Choose {text}'**
  String chooseAnd(Object text);

  /// No description provided for @nextEffectiveDate.
  ///
  /// In en, this message translates to:
  /// **'Next effective date'**
  String get nextEffectiveDate;

  /// No description provided for @scheduledDate.
  ///
  /// In en, this message translates to:
  /// **'Scheduled date'**
  String get scheduledDate;

  /// No description provided for @waitingTransaction.
  ///
  /// In en, this message translates to:
  /// **'Waiting for transaction'**
  String get waitingTransaction;

  /// No description provided for @transactionCompleted.
  ///
  /// In en, this message translates to:
  /// **'Transaction completed'**
  String get transactionCompleted;

  /// No description provided for @cancelScheduled.
  ///
  /// In en, this message translates to:
  /// **'Cancel scheduled'**
  String get cancelScheduled;

  /// No description provided for @transactionFailed.
  ///
  /// In en, this message translates to:
  /// **'Transaction failed'**
  String get transactionFailed;

  /// No description provided for @forMonthsDoNotHaveScheduledDateWillChangedToLastDayOfThatMonth.
  ///
  /// In en, this message translates to:
  /// **'For the months this do not have the 29th, 30th, and 31th, the scheduled date will be changed to the last day of that month'**
  String get forMonthsDoNotHaveScheduledDateWillChangedToLastDayOfThatMonth;

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get start;

  /// No description provided for @end.
  ///
  /// In en, this message translates to:
  /// **'End'**
  String get end;

  /// No description provided for @scheduled.
  ///
  /// In en, this message translates to:
  /// **'Scheduled'**
  String get scheduled;

  /// No description provided for @depositType.
  ///
  /// In en, this message translates to:
  /// **'Deposit type'**
  String get depositType;

  /// No description provided for @feesAreSubjectToChangeInTheFuture.
  ///
  /// In en, this message translates to:
  /// **'Fees are subject to change in the future'**
  String get feesAreSubjectToChangeInTheFuture;

  /// No description provided for @invalidQRcodeFormat.
  ///
  /// In en, this message translates to:
  /// **'Invalid QR code format'**
  String get invalidQRcodeFormat;

  /// No description provided for @withdrawDeposits.
  ///
  /// In en, this message translates to:
  /// **'Withdraw deposits'**
  String get withdrawDeposits;

  /// No description provided for @depositToAccount.
  ///
  /// In en, this message translates to:
  /// **'Deposit to account'**
  String get depositToAccount;

  /// No description provided for @transferInCoop.
  ///
  /// In en, this message translates to:
  /// **'Transfer in coop'**
  String get transferInCoop;

  /// No description provided for @remainingSalary.
  ///
  /// In en, this message translates to:
  /// **'Remaining salary'**
  String get remainingSalary;

  /// No description provided for @bankbookScan.
  ///
  /// In en, this message translates to:
  /// **'Bankbook scan'**
  String get bankbookScan;

  /// No description provided for @attachBankbookScan.
  ///
  /// In en, this message translates to:
  /// **'Attach Bankbook scan'**
  String get attachBankbookScan;

  /// No description provided for @yourAccountBindingWasSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Your {bank} account binding was successfully'**
  String yourAccountBindingWasSuccessfully(Object bank);

  /// No description provided for @yourAccountBindingIsPendingVerification.
  ///
  /// In en, this message translates to:
  /// **'Your {bank} account binding is pending verification'**
  String yourAccountBindingIsPendingVerification(Object bank);

  /// No description provided for @bindAccountPendingVerification.
  ///
  /// In en, this message translates to:
  /// **'Bind account pending verification'**
  String get bindAccountPendingVerification;

  /// No description provided for @contractStatus.
  ///
  /// In en, this message translates to:
  /// **'Contract status'**
  String get contractStatus;

  /// No description provided for @allContract.
  ///
  /// In en, this message translates to:
  /// **'all contract'**
  String get allContract;

  /// No description provided for @sharesWithFSCT.
  ///
  /// In en, this message translates to:
  /// **'Shares with FSCT'**
  String get sharesWithFSCT;

  /// No description provided for @holdStandardStock.
  ///
  /// In en, this message translates to:
  /// **'Hold standard stock'**
  String get holdStandardStock;

  /// No description provided for @excessLack.
  ///
  /// In en, this message translates to:
  /// **'Excess / lack'**
  String get excessLack;

  /// No description provided for @shareStatus.
  ///
  /// In en, this message translates to:
  /// **'Share status'**
  String get shareStatus;

  /// No description provided for @numberOfShares.
  ///
  /// In en, this message translates to:
  /// **'Number of shares'**
  String get numberOfShares;

  /// No description provided for @shareAmount.
  ///
  /// In en, this message translates to:
  /// **'Share amount'**
  String get shareAmount;

  /// No description provided for @currentShareValue.
  ///
  /// In en, this message translates to:
  /// **'Current share value'**
  String get currentShareValue;

  /// No description provided for @shareCertificateDate.
  ///
  /// In en, this message translates to:
  /// **'Share certificate date'**
  String get shareCertificateDate;

  /// No description provided for @shareCertificateNo.
  ///
  /// In en, this message translates to:
  /// **'Share certificate no'**
  String get shareCertificateNo;

  /// No description provided for @serialNo.
  ///
  /// In en, this message translates to:
  /// **'Serial no'**
  String get serialNo;

  /// No description provided for @shareNumberStart.
  ///
  /// In en, this message translates to:
  /// **'Share number Start'**
  String get shareNumberStart;

  /// No description provided for @shareNumberEnd.
  ///
  /// In en, this message translates to:
  /// **'Share number End'**
  String get shareNumberEnd;

  /// No description provided for @dateOfMembershipFSCT.
  ///
  /// In en, this message translates to:
  /// **'Date of membership FSCT'**
  String get dateOfMembershipFSCT;

  /// No description provided for @coopRegDate.
  ///
  /// In en, this message translates to:
  /// **'Coop reg. date'**
  String get coopRegDate;

  /// No description provided for @coopRegNo.
  ///
  /// In en, this message translates to:
  /// **'Coop reg. no'**
  String get coopRegNo;

  /// No description provided for @coopID13.
  ///
  /// In en, this message translates to:
  /// **'Coope ID'**
  String get coopID13;

  /// No description provided for @taxId.
  ///
  /// In en, this message translates to:
  /// **'Tax ID'**
  String get taxId;

  /// No description provided for @fiscalYearEnd.
  ///
  /// In en, this message translates to:
  /// **'Fiscal year end'**
  String get fiscalYearEnd;

  /// No description provided for @atDateOnEveryYear.
  ///
  /// In en, this message translates to:
  /// **'At {date} of every year'**
  String atDateOnEveryYear(Object date);

  /// No description provided for @faxNumber.
  ///
  /// In en, this message translates to:
  /// **'Fax number'**
  String get faxNumber;

  /// No description provided for @website.
  ///
  /// In en, this message translates to:
  /// **'Website'**
  String get website;

  /// No description provided for @managementInformation.
  ///
  /// In en, this message translates to:
  /// **'Management information'**
  String get managementInformation;

  /// No description provided for @chairmanOfTheBoard.
  ///
  /// In en, this message translates to:
  /// **'Chairman of the board'**
  String get chairmanOfTheBoard;

  /// No description provided for @board.
  ///
  /// In en, this message translates to:
  /// **'Board'**
  String get board;

  /// No description provided for @businessAuditor.
  ///
  /// In en, this message translates to:
  /// **'Business auditor'**
  String get businessAuditor;

  /// No description provided for @manager.
  ///
  /// In en, this message translates to:
  /// **'Manager'**
  String get manager;

  /// No description provided for @cooperativeOfficer.
  ///
  /// In en, this message translates to:
  /// **'Cooperative officer'**
  String get cooperativeOfficer;

  /// No description provided for @numberOfMembers.
  ///
  /// In en, this message translates to:
  /// **'Number of members'**
  String get numberOfMembers;

  /// No description provided for @people.
  ///
  /// In en, this message translates to:
  /// **'People'**
  String get people;

  /// No description provided for @depositNo.
  ///
  /// In en, this message translates to:
  /// **'Deposit no'**
  String get depositNo;

  /// No description provided for @interestAtDue.
  ///
  /// In en, this message translates to:
  /// **'Interest at due'**
  String get interestAtDue;

  /// No description provided for @fDRDate.
  ///
  /// In en, this message translates to:
  /// **'FDR.date'**
  String get fDRDate;

  /// No description provided for @interestRate.
  ///
  /// In en, this message translates to:
  /// **'Interest rate'**
  String get interestRate;

  /// No description provided for @duration.
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get duration;

  /// No description provided for @dueDate.
  ///
  /// In en, this message translates to:
  /// **'Due date'**
  String get dueDate;

  /// No description provided for @accruedInterest.
  ///
  /// In en, this message translates to:
  /// **'Accrued interest'**
  String get accruedInterest;

  /// No description provided for @lastInterestPayment.
  ///
  /// In en, this message translates to:
  /// **'Last interest payment'**
  String get lastInterestPayment;

  /// No description provided for @pNDate.
  ///
  /// In en, this message translates to:
  /// **'P/N Date'**
  String get pNDate;

  /// No description provided for @ticketNo.
  ///
  /// In en, this message translates to:
  /// **'Ticket no'**
  String get ticketNo;

  /// No description provided for @promissoryNoteNumber.
  ///
  /// In en, this message translates to:
  /// **'Promissory note number'**
  String get promissoryNoteNumber;

  /// No description provided for @totalBalanceTicket.
  ///
  /// In en, this message translates to:
  /// **'Total balance ticket'**
  String get totalBalanceTicket;

  /// No description provided for @saveShareCapital.
  ///
  /// In en, this message translates to:
  /// **'Save share capital'**
  String get saveShareCapital;

  /// No description provided for @youWantToEdit.
  ///
  /// In en, this message translates to:
  /// **'You want to edit {edit} ?'**
  String youWantToEdit(Object edit);

  /// No description provided for @youWantToEditTo.
  ///
  /// In en, this message translates to:
  /// **'You want to edit {edit} to {to} ?'**
  String youWantToEditTo(Object edit, Object to);

  /// No description provided for @youWantUpdateTo.
  ///
  /// In en, this message translates to:
  /// **'You want update {name} to {to}?'**
  String youWantUpdateTo(Object name, Object to);

  /// No description provided for @youWantToAddDocument.
  ///
  /// In en, this message translates to:
  /// **'You want to add document {type}?'**
  String youWantToAddDocument(Object type);

  /// No description provided for @shareCapitalOfAllMembers.
  ///
  /// In en, this message translates to:
  /// **'Share capital of all members'**
  String get shareCapitalOfAllMembers;

  /// No description provided for @cooperativeInformation.
  ///
  /// In en, this message translates to:
  /// **'Cooperative information'**
  String get cooperativeInformation;

  /// No description provided for @attachment.
  ///
  /// In en, this message translates to:
  /// **'Attachment'**
  String get attachment;

  /// No description provided for @addAttachment.
  ///
  /// In en, this message translates to:
  /// **'Add attachment'**
  String get addAttachment;

  /// No description provided for @generalInfoCoop.
  ///
  /// In en, this message translates to:
  /// **'General cooperative info'**
  String get generalInfoCoop;

  /// No description provided for @cooperativeAffairs.
  ///
  /// In en, this message translates to:
  /// **'Cooperative affairs'**
  String get cooperativeAffairs;

  /// No description provided for @cooperativeManagementInfo.
  ///
  /// In en, this message translates to:
  /// **'Cooperative management info'**
  String get cooperativeManagementInfo;

  /// No description provided for @documentName.
  ///
  /// In en, this message translates to:
  /// **'Document name'**
  String get documentName;

  /// No description provided for @lastUpdate.
  ///
  /// In en, this message translates to:
  /// **'Last update'**
  String get lastUpdate;

  /// No description provided for @totalItem.
  ///
  /// In en, this message translates to:
  /// **'Total {item} item'**
  String totalItem(Object item);

  /// No description provided for @chooseFileType.
  ///
  /// In en, this message translates to:
  /// **'Choose file type'**
  String get chooseFileType;

  /// No description provided for @allDocuments.
  ///
  /// In en, this message translates to:
  /// **'All documents'**
  String get allDocuments;

  /// No description provided for @selectTheDocumentFileYouWantToUpload.
  ///
  /// In en, this message translates to:
  /// **'Select the document file you want to upload'**
  String get selectTheDocumentFileYouWantToUpload;

  /// No description provided for @documentsToBeUploaded.
  ///
  /// In en, this message translates to:
  /// **'Documents to be uploaded'**
  String get documentsToBeUploaded;

  /// No description provided for @upload.
  ///
  /// In en, this message translates to:
  /// **'Upload'**
  String get upload;

  /// No description provided for @funeralExpenses.
  ///
  /// In en, this message translates to:
  /// **'Funeral expenses'**
  String get funeralExpenses;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @nameSurname.
  ///
  /// In en, this message translates to:
  /// **'Name - Surname'**
  String get nameSurname;

  /// No description provided for @guarantee.
  ///
  /// In en, this message translates to:
  /// **'Guarantee'**
  String get guarantee;

  /// No description provided for @loanCollateral.
  ///
  /// In en, this message translates to:
  /// **'Loan collateral'**
  String get loanCollateral;

  /// No description provided for @penalty.
  ///
  /// In en, this message translates to:
  /// **'Penalty'**
  String get penalty;

  /// No description provided for @penaltyAmt.
  ///
  /// In en, this message translates to:
  /// **'Penalty'**
  String get penaltyAmt;

  /// No description provided for @fiscalYear.
  ///
  /// In en, this message translates to:
  /// **'Fiscal year'**
  String get fiscalYear;

  /// No description provided for @loanPaymentsAndOffsettingReports.
  ///
  /// In en, this message translates to:
  /// **'Loan payments and offsetting reports'**
  String get loanPaymentsAndOffsettingReports;

  /// No description provided for @depositReports.
  ///
  /// In en, this message translates to:
  /// **'Deposit reports'**
  String get depositReports;

  /// No description provided for @depositTicketReports.
  ///
  /// In en, this message translates to:
  /// **'Deposit ticket reports'**
  String get depositTicketReports;

  /// No description provided for @reports.
  ///
  /// In en, this message translates to:
  /// **'Reports'**
  String get reports;

  /// No description provided for @allowance.
  ///
  /// In en, this message translates to:
  /// **'Allowance'**
  String get allowance;

  /// No description provided for @fundHolderName.
  ///
  /// In en, this message translates to:
  /// **'Fund holder name'**
  String get fundHolderName;

  /// No description provided for @fundNumber.
  ///
  /// In en, this message translates to:
  /// **'Fund number'**
  String get fundNumber;

  /// No description provided for @fundList.
  ///
  /// In en, this message translates to:
  /// **'Fund list'**
  String get fundList;

  /// No description provided for @fundReceipt.
  ///
  /// In en, this message translates to:
  /// **'Fund receipt'**
  String get fundReceipt;

  /// No description provided for @registerToOnlineElection.
  ///
  /// In en, this message translates to:
  /// **'Register to online election'**
  String get registerToOnlineElection;

  /// No description provided for @fillOutData.
  ///
  /// In en, this message translates to:
  /// **'Fill out data'**
  String get fillOutData;

  /// No description provided for @requirement.
  ///
  /// In en, this message translates to:
  /// **'Requirement'**
  String get requirement;

  /// No description provided for @submitARequest.
  ///
  /// In en, this message translates to:
  /// **'Submit a request'**
  String get submitARequest;

  /// No description provided for @onlineElection.
  ///
  /// In en, this message translates to:
  /// **'Online election'**
  String get onlineElection;

  /// No description provided for @onlineElectionSystem.
  ///
  /// In en, this message translates to:
  /// **'Online election system'**
  String get onlineElectionSystem;

  /// No description provided for @exitOfTheOnlineElectionSystem.
  ///
  /// In en, this message translates to:
  /// **'Exit of the online election system'**
  String get exitOfTheOnlineElectionSystem;

  /// No description provided for @youWantToExitOfTheOnlineElectionSystem.
  ///
  /// In en, this message translates to:
  /// **'You want to exit of the online election system?'**
  String get youWantToExitOfTheOnlineElectionSystem;

  /// No description provided for @inCaseOfForgotPassword.
  ///
  /// In en, this message translates to:
  /// **'In case of forget password'**
  String get inCaseOfForgotPassword;

  /// No description provided for @doNotWantToVote.
  ///
  /// In en, this message translates to:
  /// **'Don\'t want to vote'**
  String get doNotWantToVote;

  /// No description provided for @nodot.
  ///
  /// In en, this message translates to:
  /// **'No.'**
  String get nodot;

  /// No description provided for @fromAnnualPerformance.
  ///
  /// In en, this message translates to:
  /// **'From annual performance'**
  String get fromAnnualPerformance;

  /// No description provided for @forgotYourPasswordToAccessTheOnlineElectionSystem.
  ///
  /// In en, this message translates to:
  /// **'Forgot your password to access the online election system'**
  String get forgotYourPasswordToAccessTheOnlineElectionSystem;

  /// No description provided for @requestNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Request new password'**
  String get requestNewPassword;

  /// No description provided for @theSystemWillSendAPasswordToAccessTheElectionSystemViaSMSOnYourPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'The system will send a password to access the online election system via SMS on your phone number'**
  String
  get theSystemWillSendAPasswordToAccessTheElectionSystemViaSMSOnYourPhoneNumber;

  /// No description provided for @theSystemHasAlreadySentAPasswordToAccessTheOnlineElectionSystemViaSMSOnYourPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'The system has already sent a password to access the online election system via SMS on your phone number'**
  String
  get theSystemHasAlreadySentAPasswordToAccessTheOnlineElectionSystemViaSMSOnYourPhoneNumber;

  /// No description provided for @successfullyCompleted.
  ///
  /// In en, this message translates to:
  /// **'Successfully completed'**
  String get successfullyCompleted;

  /// No description provided for @yourOnlineElection.
  ///
  /// In en, this message translates to:
  /// **'Your online election'**
  String get yourOnlineElection;

  /// No description provided for @theSystemHasSuccessfullySavedYourElection.
  ///
  /// In en, this message translates to:
  /// **'The system has successfully saved your election'**
  String get theSystemHasSuccessfullySavedYourElection;

  /// No description provided for @theSystemHasSuccessfullySavedElectionOnlineOf.
  ///
  /// In en, this message translates to:
  /// **'The system has successfully saved election online of'**
  String get theSystemHasSuccessfullySavedElectionOnlineOf;

  /// No description provided for @onlineBallot.
  ///
  /// In en, this message translates to:
  /// **'Online ballot'**
  String get onlineBallot;

  /// No description provided for @pleaseCheckYourNumberSelectionBeforePressingConfirmBecauseYouCanotGoBackAndEditYourElection.
  ///
  /// In en, this message translates to:
  /// **'Please check your number selection before pressing confirm because you can\'t go back and edit your election'**
  String
  get pleaseCheckYourNumberSelectionBeforePressingConfirmBecauseYouCanotGoBackAndEditYourElection;

  /// No description provided for @ifYouDoNotWantToVoteYouCanPressTheButtonDonotWantToVote.
  ///
  /// In en, this message translates to:
  /// **'If you don\'t want to vote, you can choose. Don\'t want to vote'**
  String get ifYouDoNotWantToVoteYouCanPressTheButtonDonotWantToVote;

  /// No description provided for @pleaseEnterThePasswordSentBySMSToYourPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Please enter the password sent by SMS to your phone number'**
  String get pleaseEnterThePasswordSentBySMSToYourPhoneNumber;

  /// No description provided for @youDoNotWantToVote.
  ///
  /// In en, this message translates to:
  /// **'You do not want to vote?'**
  String get youDoNotWantToVote;

  /// No description provided for @wouldYouLikeToVerifyYourElectionOnline.
  ///
  /// In en, this message translates to:
  /// **'Would you like to verify your election online?'**
  String get wouldYouLikeToVerifyYourElectionOnline;

  /// No description provided for @informTheRequestInTheElection.
  ///
  /// In en, this message translates to:
  /// **'Inform the request in the election'**
  String get informTheRequestInTheElection;

  /// No description provided for @onlineVoterInformation.
  ///
  /// In en, this message translates to:
  /// **'Online voter information'**
  String get onlineVoterInformation;

  /// No description provided for @petitionType.
  ///
  /// In en, this message translates to:
  /// **'Petition type'**
  String get petitionType;

  /// No description provided for @petitionStatus.
  ///
  /// In en, this message translates to:
  /// **'Petition status'**
  String get petitionStatus;

  /// No description provided for @petitionNo.
  ///
  /// In en, this message translates to:
  /// **'Petition no'**
  String get petitionNo;

  /// No description provided for @petitionDate.
  ///
  /// In en, this message translates to:
  /// **'Petition date'**
  String get petitionDate;

  /// No description provided for @viewPetition.
  ///
  /// In en, this message translates to:
  /// **'View petition'**
  String get viewPetition;

  /// No description provided for @cancelPetition.
  ///
  /// In en, this message translates to:
  /// **'Cancel petition'**
  String get cancelPetition;

  /// No description provided for @clarifyDetails.
  ///
  /// In en, this message translates to:
  /// **'Clarify details'**
  String get clarifyDetails;

  /// No description provided for @effectiveDate.
  ///
  /// In en, this message translates to:
  /// **'Effective date'**
  String get effectiveDate;

  /// No description provided for @submitAPetition.
  ///
  /// In en, this message translates to:
  /// **'Submit a petition'**
  String get submitAPetition;

  /// No description provided for @submittedAPetitionSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Submitted a petition successfully'**
  String get submittedAPetitionSuccessfully;

  /// No description provided for @youHaveSubmittedPetitionSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'You have submitted a petition {type} successfully.'**
  String youHaveSubmittedPetitionSuccessfully(Object type);

  /// No description provided for @departments.
  ///
  /// In en, this message translates to:
  /// **'Departments'**
  String get departments;

  /// No description provided for @company.
  ///
  /// In en, this message translates to:
  /// **'Company'**
  String get company;

  /// No description provided for @agree.
  ///
  /// In en, this message translates to:
  /// **'Agree'**
  String get agree;

  /// No description provided for @doNotAgree.
  ///
  /// In en, this message translates to:
  /// **'Do not agree'**
  String get doNotAgree;

  /// No description provided for @regulation.
  ///
  /// In en, this message translates to:
  /// **'Regulation'**
  String get regulation;

  /// No description provided for @requestForConsent.
  ///
  /// In en, this message translates to:
  /// **'Request for consent'**
  String get requestForConsent;

  /// No description provided for @otpIsInvalidPleaseCheckOtpAndReferenceNumberThatMatch.
  ///
  /// In en, this message translates to:
  /// **'OTP is invalid please check OTP and reference number that match'**
  String get otpIsInvalidPleaseCheckOtpAndReferenceNumberThatMatch;

  /// No description provided for @periodReport.
  ///
  /// In en, this message translates to:
  /// **'Period report'**
  String get periodReport;

  /// No description provided for @chooseVerificationFormat.
  ///
  /// In en, this message translates to:
  /// **'Choose a verification format'**
  String get chooseVerificationFormat;

  /// No description provided for @chooseMethodToGetPassword.
  ///
  /// In en, this message translates to:
  /// **'Choose a method to get password'**
  String get chooseMethodToGetPassword;

  /// No description provided for @viaEmail.
  ///
  /// In en, this message translates to:
  /// **'via email'**
  String get viaEmail;

  /// No description provided for @viaSMS.
  ///
  /// In en, this message translates to:
  /// **'via SMS'**
  String get viaSMS;

  /// No description provided for @rules.
  ///
  /// In en, this message translates to:
  /// **'Rules'**
  String get rules;

  /// No description provided for @securityVerification.
  ///
  /// In en, this message translates to:
  /// **'Security verification'**
  String get securityVerification;

  /// No description provided for @verificationCodeWillBeSentToPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Verification code will be sent to phone number'**
  String get verificationCodeWillBeSentToPhoneNumber;

  /// No description provided for @verificationCodeWillBeSentToEmail.
  ///
  /// In en, this message translates to:
  /// **'Verification code will be sent to e-mail'**
  String get verificationCodeWillBeSentToEmail;

  /// No description provided for @verificationCodeIncorrect.
  ///
  /// In en, this message translates to:
  /// **'Verification code incorrect'**
  String get verificationCodeIncorrect;

  /// No description provided for @successfullyWithdrawnConsent.
  ///
  /// In en, this message translates to:
  /// **'Successfully withdrawn consent'**
  String get successfullyWithdrawnConsent;

  /// No description provided for @youHaveSuccessfullyWithdrawYourConsent.
  ///
  /// In en, this message translates to:
  /// **'You have successfully withdraw your consent'**
  String get youHaveSuccessfullyWithdrawYourConsent;

  /// No description provided for @haveReadAndAgreeToTheTermsOfElectionOnline.
  ///
  /// In en, this message translates to:
  /// **'I have read and agree to the terms of election online'**
  String get haveReadAndAgreeToTheTermsOfElectionOnline;

  /// No description provided for @numberNo.
  ///
  /// In en, this message translates to:
  /// **'Number'**
  String get numberNo;

  /// No description provided for @otherExpenses.
  ///
  /// In en, this message translates to:
  /// **'Other expenses'**
  String get otherExpenses;

  /// No description provided for @allExpenses.
  ///
  /// In en, this message translates to:
  /// **'All expenses'**
  String get allExpenses;

  /// No description provided for @sumAccruedInterest.
  ///
  /// In en, this message translates to:
  /// **'Sum accrued interest'**
  String get sumAccruedInterest;

  /// No description provided for @sir.
  ///
  /// In en, this message translates to:
  /// **'Sir'**
  String get sir;

  /// No description provided for @suggestion.
  ///
  /// In en, this message translates to:
  /// **'Suggestion'**
  String get suggestion;

  /// No description provided for @operatingCapital.
  ///
  /// In en, this message translates to:
  /// **'Operating capital'**
  String get operatingCapital;

  /// No description provided for @cooperativeOperatingCapital.
  ///
  /// In en, this message translates to:
  /// **'Cooperative operating capital'**
  String get cooperativeOperatingCapital;

  /// No description provided for @saveCooperativeOperatingCapital.
  ///
  /// In en, this message translates to:
  /// **'Save cooperative operating capital'**
  String get saveCooperativeOperatingCapital;

  /// No description provided for @informationUpdatedAsOf.
  ///
  /// In en, this message translates to:
  /// **'Information updated as of'**
  String get informationUpdatedAsOf;

  /// No description provided for @viewInfo.
  ///
  /// In en, this message translates to:
  /// **'View info'**
  String get viewInfo;

  /// No description provided for @editRequest.
  ///
  /// In en, this message translates to:
  /// **'Edit request'**
  String get editRequest;

  /// No description provided for @attachDocuments.
  ///
  /// In en, this message translates to:
  /// **'Attach documents'**
  String get attachDocuments;

  /// No description provided for @uploadTransferSlip.
  ///
  /// In en, this message translates to:
  /// **'Upload transfer slip'**
  String get uploadTransferSlip;

  /// No description provided for @amountOpenAccount.
  ///
  /// In en, this message translates to:
  /// **'Amount open account'**
  String get amountOpenAccount;

  /// No description provided for @youHaveSubmittedRequestSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'You have submitted a request successfully. Your request Doc no. {docNo}'**
  String youHaveSubmittedRequestSuccessfully(Object docNo);

  /// No description provided for @transferAccount.
  ///
  /// In en, this message translates to:
  /// **'Transfer account'**
  String get transferAccount;

  /// No description provided for @accountForTransferToOpenAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Account for transfer to open an account'**
  String get accountForTransferToOpenAnAccount;

  /// No description provided for @pendingRequests.
  ///
  /// In en, this message translates to:
  /// **'Pending requests'**
  String get pendingRequests;

  /// No description provided for @openAccount.
  ///
  /// In en, this message translates to:
  /// **'Open account'**
  String get openAccount;

  /// No description provided for @updateMemberInfo.
  ///
  /// In en, this message translates to:
  /// **'Update member info'**
  String get updateMemberInfo;

  /// No description provided for @theTransactionCouldNotBePerformedDueToSomeError.
  ///
  /// In en, this message translates to:
  /// **'The transaction could not be performed due to some error'**
  String get theTransactionCouldNotBePerformedDueToSomeError;

  /// No description provided for @association.
  ///
  /// In en, this message translates to:
  /// **'Association'**
  String get association;

  /// No description provided for @receiveDocuments.
  ///
  /// In en, this message translates to:
  /// **'Receive documents'**
  String get receiveDocuments;

  /// No description provided for @sendDocuments.
  ///
  /// In en, this message translates to:
  /// **'Send documents'**
  String get sendDocuments;

  /// No description provided for @uploadDocuments.
  ///
  /// In en, this message translates to:
  /// **'Upload documents'**
  String get uploadDocuments;

  /// No description provided for @documentUploadedHistory.
  ///
  /// In en, this message translates to:
  /// **'Document uploaded history'**
  String get documentUploadedHistory;

  /// No description provided for @uploadDocumentsSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Upload documents successfully'**
  String get uploadDocumentsSuccessfully;

  /// No description provided for @yourUploadedDocumentsSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'{name} uploaded successfully'**
  String yourUploadedDocumentsSuccessfully(Object name);

  /// No description provided for @addItem.
  ///
  /// In en, this message translates to:
  /// **'Add item'**
  String get addItem;

  /// No description provided for @editItem.
  ///
  /// In en, this message translates to:
  /// **'Edit item'**
  String get editItem;

  /// No description provided for @financialServicesFromCooperative.
  ///
  /// In en, this message translates to:
  /// **'Financial services from cooperative'**
  String get financialServicesFromCooperative;

  /// No description provided for @moreNewsFromCooperative.
  ///
  /// In en, this message translates to:
  /// **'More news from cooperative'**
  String get moreNewsFromCooperative;

  /// No description provided for @dateOfRejection.
  ///
  /// In en, this message translates to:
  /// **'Date of rejection'**
  String get dateOfRejection;

  /// No description provided for @addAtLeastDestinationAccounts.
  ///
  /// In en, this message translates to:
  /// **'Add at least {count} destination accounts'**
  String addAtLeastDestinationAccounts(Object count);

  /// No description provided for @occupation.
  ///
  /// In en, this message translates to:
  /// **'Occupation'**
  String get occupation;

  /// No description provided for @serviceCharge.
  ///
  /// In en, this message translates to:
  /// **'Service charge'**
  String get serviceCharge;

  /// No description provided for @costAppraisal.
  ///
  /// In en, this message translates to:
  /// **'Cost appraisal'**
  String get costAppraisal;

  /// No description provided for @addFile.
  ///
  /// In en, this message translates to:
  /// **'Add file'**
  String get addFile;

  /// No description provided for @pdfDocument.
  ///
  /// In en, this message translates to:
  /// **'PDF document'**
  String get pdfDocument;

  /// No description provided for @files.
  ///
  /// In en, this message translates to:
  /// **'Files'**
  String get files;

  /// No description provided for @addFilesAtLeastItems.
  ///
  /// In en, this message translates to:
  /// **'Add files {name} at least {count} items'**
  String addFilesAtLeastItems(Object count, Object name);

  /// No description provided for @addFilesUptoItems.
  ///
  /// In en, this message translates to:
  /// **'Add files {name} upto {count} items'**
  String addFilesUptoItems(Object count, Object name);

  /// No description provided for @peaceBeUponYou.
  ///
  /// In en, this message translates to:
  /// **'Peace be upon you'**
  String get peaceBeUponYou;

  /// No description provided for @referencAssociate.
  ///
  /// In en, this message translates to:
  /// **'Referenc associate'**
  String get referencAssociate;

  /// No description provided for @mustBeLettersOrSomeing.
  ///
  /// In en, this message translates to:
  /// **'Must be letters, numbers or _ - * \' \" # & () @ only'**
  String get mustBeLettersOrSomeing;

  /// No description provided for @periodBalance.
  ///
  /// In en, this message translates to:
  /// **'Period balance'**
  String get periodBalance;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @termsAndConditions.
  ///
  /// In en, this message translates to:
  /// **'Terms and Conditions'**
  String get termsAndConditions;

  /// No description provided for @shareholding.
  ///
  /// In en, this message translates to:
  /// **'Shareholding'**
  String get shareholding;

  /// No description provided for @dataProtection.
  ///
  /// In en, this message translates to:
  /// **'Data protection'**
  String get dataProtection;

  /// No description provided for @guaranteeApproval.
  ///
  /// In en, this message translates to:
  /// **'Guarantee approval'**
  String get guaranteeApproval;

  /// No description provided for @rejectGuarantee.
  ///
  /// In en, this message translates to:
  /// **'Reject guarantee'**
  String get rejectGuarantee;

  /// No description provided for @display.
  ///
  /// In en, this message translates to:
  /// **'Display'**
  String get display;

  /// No description provided for @showBalance.
  ///
  /// In en, this message translates to:
  /// **'Show balance'**
  String get showBalance;

  /// No description provided for @atmCard.
  ///
  /// In en, this message translates to:
  /// **'ATM Card'**
  String get atmCard;

  /// No description provided for @availableAmount.
  ///
  /// In en, this message translates to:
  /// **'Available amount'**
  String get availableAmount;

  /// No description provided for @suspendCard.
  ///
  /// In en, this message translates to:
  /// **'Suspend card'**
  String get suspendCard;

  /// No description provided for @creditCardAtm.
  ///
  /// In en, this message translates to:
  /// **'Credit card/ATM card'**
  String get creditCardAtm;

  /// No description provided for @suspendAtmCard.
  ///
  /// In en, this message translates to:
  /// **'Suspend ATM card'**
  String get suspendAtmCard;

  /// No description provided for @suspendCreditCardAtm.
  ///
  /// In en, this message translates to:
  /// **'Suspend credit card/ATM card'**
  String get suspendCreditCardAtm;

  /// No description provided for @ifYouSuspendThisCardYouWillNotBeAbleToUseItAgain.
  ///
  /// In en, this message translates to:
  /// **'If you suspend this card, you will not be able to use it again'**
  String get ifYouSuspendThisCardYouWillNotBeAbleToUseItAgain;

  /// No description provided for @atmCardHasBeenSuspendedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'ATM card has been suspended successfully'**
  String get atmCardHasBeenSuspendedSuccessfully;

  /// No description provided for @creditCardAtmCardHasBeenSuspendedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Credit card/ATM card has been suspended successfully'**
  String get creditCardAtmCardHasBeenSuspendedSuccessfully;

  /// No description provided for @cardName.
  ///
  /// In en, this message translates to:
  /// **'Card name'**
  String get cardName;

  /// No description provided for @cardNumber.
  ///
  /// In en, this message translates to:
  /// **'Card number'**
  String get cardNumber;

  /// No description provided for @thisCardHasBeenSuspendedYouCanNoLongerMakeTransactionsWithThisCard.
  ///
  /// In en, this message translates to:
  /// **'This card has been suspended. You can no longer make transactions with this card'**
  String get thisCardHasBeenSuspendedYouCanNoLongerMakeTransactionsWithThisCard;

  /// No description provided for @atmCardNotFound.
  ///
  /// In en, this message translates to:
  /// **'ATM card not found'**
  String get atmCardNotFound;

  /// No description provided for @creditCardAtmCardNotFound.
  ///
  /// In en, this message translates to:
  /// **'Credit card/ATM card not found'**
  String get creditCardAtmCardNotFound;

  /// No description provided for @registrationNo.
  ///
  /// In en, this message translates to:
  /// **'Registration no'**
  String get registrationNo;

  /// No description provided for @calculate.
  ///
  /// In en, this message translates to:
  /// **'Calculate'**
  String get calculate;

  /// No description provided for @continues.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continues;

  /// No description provided for @doYouWantToDeleteTheAppAccount.
  ///
  /// In en, this message translates to:
  /// **'Do you want to delete the app account?'**
  String get doYouWantToDeleteTheAppAccount;

  /// No description provided for @youWillNotBeAbleToBrowseOrPerformAnyTransactionsThroughTheAppAfterDeletingTheAppAccount.
  ///
  /// In en, this message translates to:
  /// **'You will not be able to browse or perform any transactions through the app after deleting the app account'**
  String
  get youWillNotBeAbleToBrowseOrPerformAnyTransactionsThroughTheAppAfterDeletingTheAppAccount;

  /// No description provided for @appAccountDeleted.
  ///
  /// In en, this message translates to:
  /// **'App account deleted'**
  String get appAccountDeleted;

  /// No description provided for @youWillNoLongerBeAbleToBrowseOrPerformAnyTransactionsThroughTheApp.
  ///
  /// In en, this message translates to:
  /// **'You will no longer be able to browse or perform any transactions through the app'**
  String get youWillNoLongerBeAbleToBrowseOrPerformAnyTransactionsThroughTheApp;

  /// No description provided for @canSelectUpToFilesAtTime.
  ///
  /// In en, this message translates to:
  /// **'Can select up to {count} files at a time'**
  String canSelectUpToFilesAtTime(Object count);

  /// No description provided for @theTransactionCouldNotBePerformedBecauseYourEmailInformationCouldNotBeFound.
  ///
  /// In en, this message translates to:
  /// **'The transaction could not be performed because your email information could not be found'**
  String
  get theTransactionCouldNotBePerformedBecauseYourEmailInformationCouldNotBeFound;

  /// No description provided for @totalPrincipal.
  ///
  /// In en, this message translates to:
  /// **'Total principal'**
  String get totalPrincipal;

  /// No description provided for @totalInterest.
  ///
  /// In en, this message translates to:
  /// **'Total interest'**
  String get totalInterest;

  /// No description provided for @memberName.
  ///
  /// In en, this message translates to:
  /// **'Member name'**
  String get memberName;

  /// No description provided for @guarantorName.
  ///
  /// In en, this message translates to:
  /// **'Guarantor name'**
  String get guarantorName;

  /// No description provided for @guarantorInformation.
  ///
  /// In en, this message translates to:
  /// **'Guarantor information'**
  String get guarantorInformation;

  /// No description provided for @pleaseSelectOne.
  ///
  /// In en, this message translates to:
  /// **'Please select one'**
  String get pleaseSelectOne;

  /// No description provided for @transactionChannel.
  ///
  /// In en, this message translates to:
  /// **'Transaction channel'**
  String get transactionChannel;

  /// No description provided for @bankTransaction.
  ///
  /// In en, this message translates to:
  /// **'Bank transaction'**
  String get bankTransaction;

  /// No description provided for @coopTransaction.
  ///
  /// In en, this message translates to:
  /// **'Coop transaction'**
  String get coopTransaction;

  /// No description provided for @iHaveReadAndAcceptTheTermsAndConditions.
  ///
  /// In en, this message translates to:
  /// **'I have read and accept the terms and conditions'**
  String get iHaveReadAndAcceptTheTermsAndConditions;

  /// No description provided for @dayMonthYearOfBirth.
  ///
  /// In en, this message translates to:
  /// **'Day month year of birth'**
  String get dayMonthYearOfBirth;

  /// No description provided for @retireeInformation.
  ///
  /// In en, this message translates to:
  /// **'Retiree information'**
  String get retireeInformation;

  /// No description provided for @personalInformation.
  ///
  /// In en, this message translates to:
  /// **'Personal information'**
  String get personalInformation;

  /// No description provided for @accountInformation.
  ///
  /// In en, this message translates to:
  /// **'Account information'**
  String get accountInformation;

  /// No description provided for @accountType.
  ///
  /// In en, this message translates to:
  /// **'Account type'**
  String get accountType;

  /// No description provided for @earningInterest.
  ///
  /// In en, this message translates to:
  /// **'Earning interest'**
  String get earningInterest;

  /// No description provided for @iHaveStudiedAndUnderstoodTheDetailsAndConditionsBeforeDecidingToOpenAnAccount.
  ///
  /// In en, this message translates to:
  /// **'I have studied and understood the details and conditions before deciding to open an account'**
  String
  get iHaveStudiedAndUnderstoodTheDetailsAndConditionsBeforeDecidingToOpenAnAccount;

  /// No description provided for @condition.
  ///
  /// In en, this message translates to:
  /// **'Condition'**
  String get condition;

  /// No description provided for @openAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Open an account'**
  String get openAnAccount;

  /// No description provided for @spouseName.
  ///
  /// In en, this message translates to:
  /// **'Spouse\'s name'**
  String get spouseName;

  /// No description provided for @coordinationCenter.
  ///
  /// In en, this message translates to:
  /// **'Coordination center'**
  String get coordinationCenter;

  /// No description provided for @coopMemberNo.
  ///
  /// In en, this message translates to:
  /// **'Coop member no'**
  String get coopMemberNo;

  /// No description provided for @funeralManager.
  ///
  /// In en, this message translates to:
  /// **'Funeral manager'**
  String get funeralManager;

  /// No description provided for @fundRegistrationNumber.
  ///
  /// In en, this message translates to:
  /// **'Fund registration number'**
  String get fundRegistrationNumber;

  /// No description provided for @roundTheFund.
  ///
  /// In en, this message translates to:
  /// **'Round the fund'**
  String get roundTheFund;

  /// No description provided for @fundStatus.
  ///
  /// In en, this message translates to:
  /// **'Fund status'**
  String get fundStatus;

  /// No description provided for @fundProtectionDate.
  ///
  /// In en, this message translates to:
  /// **'Fund Protection Date'**
  String get fundProtectionDate;

  /// No description provided for @listOfDeceased.
  ///
  /// In en, this message translates to:
  /// **'List of deceased'**
  String get listOfDeceased;

  /// No description provided for @profitMargin.
  ///
  /// In en, this message translates to:
  /// **'Profit margin'**
  String get profitMargin;

  /// No description provided for @balanceBeginning.
  ///
  /// In en, this message translates to:
  /// **'Balance beginning'**
  String get balanceBeginning;

  /// No description provided for @annualRenewal.
  ///
  /// In en, this message translates to:
  /// **'Annual renewal'**
  String get annualRenewal;

  /// No description provided for @advanceAllowance.
  ///
  /// In en, this message translates to:
  /// **'Advance allowance'**
  String get advanceAllowance;

  /// No description provided for @amountUsed.
  ///
  /// In en, this message translates to:
  /// **'Amount used'**
  String get amountUsed;

  /// No description provided for @informationAsOf.
  ///
  /// In en, this message translates to:
  /// **'Information as of'**
  String get informationAsOf;

  /// No description provided for @deviceDoesNotSupportScanningQRcodes.
  ///
  /// In en, this message translates to:
  /// **'Device does not support scanning QR codes'**
  String get deviceDoesNotSupportScanningQRcodes;

  /// No description provided for @registered.
  ///
  /// In en, this message translates to:
  /// **'Registered'**
  String get registered;

  /// No description provided for @associateMember.
  ///
  /// In en, this message translates to:
  /// **'Associate member'**
  String get associateMember;

  /// No description provided for @againLater.
  ///
  /// In en, this message translates to:
  /// **'Again later'**
  String get againLater;

  /// No description provided for @againLater2.
  ///
  /// In en, this message translates to:
  /// **'Again later'**
  String get againLater2;

  /// No description provided for @pleaseCheckTheInformation.
  ///
  /// In en, this message translates to:
  /// **'Please check the information'**
  String get pleaseCheckTheInformation;

  /// No description provided for @inCaseThePhoneNumberIsIncorrectPleaseContactTheCooperativeInPerson.
  ///
  /// In en, this message translates to:
  /// **'In case the phone number is incorrect, please contact the cooperative in person'**
  String get inCaseThePhoneNumberIsIncorrectPleaseContactTheCooperativeInPerson;

  /// No description provided for @appVersionIsAvailable.
  ///
  /// In en, this message translates to:
  /// **'App version {version} is available'**
  String appVersionIsAvailable(Object version);

  /// No description provided for @interestAtTheMoment.
  ///
  /// In en, this message translates to:
  /// **'Interest at the moment'**
  String get interestAtTheMoment;

  /// No description provided for @unavailable.
  ///
  /// In en, this message translates to:
  /// **'Unavailable'**
  String get unavailable;

  /// No description provided for @sumInsured.
  ///
  /// In en, this message translates to:
  /// **'Sum insured'**
  String get sumInsured;

  /// No description provided for @positionMoney.
  ///
  /// In en, this message translates to:
  /// **'Position money'**
  String get positionMoney;

  /// No description provided for @loanInterestCertificate.
  ///
  /// In en, this message translates to:
  /// **'Loan interest certificate'**
  String get loanInterestCertificate;

  /// No description provided for @youWantToRequestLoanInterestCertificate.
  ///
  /// In en, this message translates to:
  /// **'You want to request Loan interest certificate?'**
  String get youWantToRequestLoanInterestCertificate;

  /// No description provided for @requestLoanInterestCertificateSuccessfulSendEmail.
  ///
  /// In en, this message translates to:
  /// **'Request a successful loan interest certificate The document has been sent to the email \"{email}\"'**
  String requestLoanInterestCertificateSuccessfulSendEmail(Object email);

  /// No description provided for @menuSched.
  ///
  /// In en, this message translates to:
  /// **'Schedule List'**
  String get menuSched;

  /// No description provided for @menuManage.
  ///
  /// In en, this message translates to:
  /// **'Manage account'**
  String get menuManage;

  /// No description provided for @menuTransferMyself.
  ///
  /// In en, this message translates to:
  /// **'Transfer myself'**
  String get menuTransferMyself;

  /// No description provided for @menuQr.
  ///
  /// In en, this message translates to:
  /// **'Scan QR Code'**
  String get menuQr;

  /// No description provided for @menuBalanceConfirm.
  ///
  /// In en, this message translates to:
  /// **'Balance Confirm'**
  String get menuBalanceConfirm;

  /// No description provided for @menuShare.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get menuShare;

  /// No description provided for @menuGuarantees.
  ///
  /// In en, this message translates to:
  /// **'Guarantees'**
  String get menuGuarantees;

  /// No description provided for @menuDocBalance.
  ///
  /// In en, this message translates to:
  /// **'Document Balance Confirm'**
  String get menuDocBalance;

  /// No description provided for @menuKeepMonthly.
  ///
  /// In en, this message translates to:
  /// **'Keep Monthly'**
  String get menuKeepMonthly;

  /// No description provided for @menuDividend.
  ///
  /// In en, this message translates to:
  /// **'Dividend'**
  String get menuDividend;

  /// No description provided for @menuNews.
  ///
  /// In en, this message translates to:
  /// **'News'**
  String get menuNews;

  /// No description provided for @menuLoanCredit.
  ///
  /// In en, this message translates to:
  /// **'Loan estimate'**
  String get menuLoanCredit;

  /// No description provided for @menuLoanRequest.
  ///
  /// In en, this message translates to:
  /// **'Form request loan online'**
  String get menuLoanRequest;

  /// No description provided for @menuSimulatePayment.
  ///
  /// In en, this message translates to:
  /// **'Simulate payment'**
  String get menuSimulatePayment;

  /// No description provided for @menuSlips.
  ///
  /// In en, this message translates to:
  /// **'Slips'**
  String get menuSlips;

  /// No description provided for @menuSlipExtra.
  ///
  /// In en, this message translates to:
  /// **'Extra payment receipt'**
  String get menuSlipExtra;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @general.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get general;

  /// No description provided for @pleaseSelectDestinationAccount.
  ///
  /// In en, this message translates to:
  /// **'Please select destination account'**
  String get pleaseSelectDestinationAccount;

  /// No description provided for @depositAccount.
  ///
  /// In en, this message translates to:
  /// **'Deposit Account'**
  String get depositAccount;

  /// No description provided for @trackLoanRequest.
  ///
  /// In en, this message translates to:
  /// **'Track Loan Request Online'**
  String get trackLoanRequest;

  /// No description provided for @balanceTHB.
  ///
  /// In en, this message translates to:
  /// **'Balance (THB)'**
  String get balanceTHB;

  /// No description provided for @clearFillter.
  ///
  /// In en, this message translates to:
  /// **'Clear Fillter'**
  String get clearFillter;

  /// No description provided for @found.
  ///
  /// In en, this message translates to:
  /// **'Found'**
  String get found;

  /// No description provided for @noDataForSelectedDates.
  ///
  /// In en, this message translates to:
  /// **'No data for selected dates'**
  String get noDataForSelectedDates;

  /// No description provided for @thb.
  ///
  /// In en, this message translates to:
  /// **'THB'**
  String get thb;

  /// No description provided for @accessDenied.
  ///
  /// In en, this message translates to:
  /// **'Access denied'**
  String get accessDenied;

  /// No description provided for @personalDataProtection.
  ///
  /// In en, this message translates to:
  /// **'Personal Data Protection Policty'**
  String get personalDataProtection;

  /// No description provided for @versionApplication.
  ///
  /// In en, this message translates to:
  /// **'Version application'**
  String get versionApplication;

  /// No description provided for @changeFontsize.
  ///
  /// In en, this message translates to:
  /// **'Change font size'**
  String get changeFontsize;

  /// No description provided for @limitAmountTransaction.
  ///
  /// In en, this message translates to:
  /// **'Limit account transaction'**
  String get limitAmountTransaction;

  /// No description provided for @appAccountDeletion.
  ///
  /// In en, this message translates to:
  /// **'App account deletion'**
  String get appAccountDeletion;

  /// No description provided for @markAccountNo.
  ///
  /// In en, this message translates to:
  /// **'Mask Account Number'**
  String get markAccountNo;

  /// No description provided for @editMemberInfo.
  ///
  /// In en, this message translates to:
  /// **'Edit member info'**
  String get editMemberInfo;

  /// No description provided for @changePin.
  ///
  /// In en, this message translates to:
  /// **'Change Pin'**
  String get changePin;

  /// No description provided for @manageDevices.
  ///
  /// In en, this message translates to:
  /// **'Manage devices'**
  String get manageDevices;

  /// No description provided for @manageNotification.
  ///
  /// In en, this message translates to:
  /// **'Manage notification'**
  String get manageNotification;

  /// No description provided for @contactNo.
  ///
  /// In en, this message translates to:
  /// **'Contact No.'**
  String get contactNo;

  /// No description provided for @ordinaryLoan.
  ///
  /// In en, this message translates to:
  /// **'Ordinary Loan'**
  String get ordinaryLoan;

  /// No description provided for @menuWelfare.
  ///
  /// In en, this message translates to:
  /// **'Welfare'**
  String get menuWelfare;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get or;

  /// No description provided for @regisUseApplication.
  ///
  /// In en, this message translates to:
  /// **'Register to use the application.'**
  String get regisUseApplication;

  /// No description provided for @regisMenberCoop.
  ///
  /// In en, this message translates to:
  /// **'Register member COOP'**
  String get regisMenberCoop;

  /// No description provided for @viewMoney.
  ///
  /// In en, this message translates to:
  /// **'View money'**
  String get viewMoney;

  /// No description provided for @saveAccountTotal.
  ///
  /// In en, this message translates to:
  /// **'Saving Accounts (total)'**
  String get saveAccountTotal;

  /// No description provided for @depositTxt.
  ///
  /// In en, this message translates to:
  /// **'Deposit'**
  String get depositTxt;

  /// No description provided for @myAccount.
  ///
  /// In en, this message translates to:
  /// **'My accounts'**
  String get myAccount;

  /// No description provided for @plsEnteramount.
  ///
  /// In en, this message translates to:
  /// **'Please enter amount'**
  String get plsEnteramount;

  /// No description provided for @transferBankAcc.
  ///
  /// In en, this message translates to:
  /// **'Transfer to bank account.'**
  String get transferBankAcc;

  /// No description provided for @transferCoopAcc.
  ///
  /// In en, this message translates to:
  /// **'Transfer to coop account.'**
  String get transferCoopAcc;

  /// No description provided for @otherDeductions.
  ///
  /// In en, this message translates to:
  /// **'Other deductions'**
  String get otherDeductions;

  /// No description provided for @fromAcc.
  ///
  /// In en, this message translates to:
  /// **'From account'**
  String get fromAcc;

  /// No description provided for @toAcc.
  ///
  /// In en, this message translates to:
  /// **'To account'**
  String get toAcc;

  /// No description provided for @transferSlip.
  ///
  /// In en, this message translates to:
  /// **'Transfer Slip'**
  String get transferSlip;

  /// No description provided for @dateTime.
  ///
  /// In en, this message translates to:
  /// **'Date-Time'**
  String get dateTime;

  /// No description provided for @transferAmount.
  ///
  /// In en, this message translates to:
  /// **'Transfer amount'**
  String get transferAmount;

  /// No description provided for @alertQRcreate.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while generating the QR code.'**
  String get alertQRcreate;

  /// No description provided for @backHome.
  ///
  /// In en, this message translates to:
  /// **'Return to homepage'**
  String get backHome;

  /// No description provided for @copyReference.
  ///
  /// In en, this message translates to:
  /// **'Copy Reference'**
  String get copyReference;

  /// No description provided for @copySuccess.
  ///
  /// In en, this message translates to:
  /// **'Copy Success'**
  String get copySuccess;

  /// No description provided for @saveSuccess.
  ///
  /// In en, this message translates to:
  /// **'Save Success'**
  String get saveSuccess;

  /// No description provided for @saveFailed.
  ///
  /// In en, this message translates to:
  /// **'Saving failed. Please try again.'**
  String get saveFailed;

  /// No description provided for @download.
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get download;

  /// No description provided for @downloadSuccess.
  ///
  /// In en, this message translates to:
  /// **'Download Success'**
  String get downloadSuccess;

  /// No description provided for @downloading.
  ///
  /// In en, this message translates to:
  /// **'Downloading...'**
  String get downloading;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'th'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'th':
      return AppLocalizationsTh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
