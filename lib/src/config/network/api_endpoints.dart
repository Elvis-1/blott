import 'package:blott/src/config/network/config.dart';

final baseUrl = AppConfig.baseUrl;

// AUTH ENDPIONTS
class _AuthEndpoints {
  final String registerUser = '$baseUrl/auth/register';
  final String changePassword = '$baseUrl/auth/change-password';
  final String loginUser = '$baseUrl/auth/login';
  final String verifyCode = '$baseUrl/auth/verify-code';
  String resendVerificationCode(String link) => '$baseUrl$link';
  final String logout = '$baseUrl/auth/logout';

  final String verifyPwdResetCode = '$baseUrl/auth/verify-password-reset-code';
  final String createNewPassword = '$baseUrl/auth/reset-password';

  final String getOTPOnnEmail = '$baseUrl/auth/request-password-reset-code';

  final String refreshSession = '$baseUrl/auth/refresh';
  final String forgotPin = '$baseUrl/auth-pins/forgot-pin';
  String verifyResetPin(String link) => '$baseUrl$link';
}

//CURRENCIES
class _Currencies {
  final String getCurrencies = '$baseUrl/currencies/list';
  String followCurrencies(String currencyCode) =>
      '$baseUrl/currencies/$currencyCode/follow';
  String unfollowCurrencies(String currencyCode) =>
      '$baseUrl/currencies/$currencyCode/unfollow';

  final String getCurrenciesYouFollow = '$baseUrl/currencies/following';
  String getCurrenciesPairs(String currencyCode) =>
      '$baseUrl/currencies/pairs/$currencyCode';
}
// TODO ENDPIOINTS

class _TodoEndpoints {
  final String getTodos = '$baseUrl/todos';
  final String getIdenties = '$baseUrl/identity-types/select';
  final String addAddress = '$baseUrl/address';

  String verifyId(String endpoint) => '$baseUrl$endpoint';
}

class _User {
  String updatePersonalDetails(String profile_id) =>
      '$baseUrl/profiles/edit/$profile_id';
  String updateProfilePic = '$baseUrl/profiles/add-avatar';
  String updateTag = '$baseUrl/profiles/change-display-tag';
  String changePhone = '$baseUrl/profiles/verify-new-telephone';
  String changeEmail = '$baseUrl/profiles/verify-new-email';

  String updateAddress(String addressId) => '$baseUrl/address/$addressId';
  String getAddress = '$baseUrl/address';
  String getUserProfile(String profileId) =>
      '$baseUrl/profiles/display/$profileId';
  String getUser = '$baseUrl/users/dashboard';
  String verifyCode = '$baseUrl/profiles/verify-code';
  String getContactUsDetails = '$baseUrl/contact-us';
}

class _StatesAndCities {
  String getStates = '$baseUrl/states';
  String getCountryDailCode = '$baseUrl/countries/select';
  String getCities(String stateId) => '$baseUrl/cities/state/$stateId';
}

class _Wallet {
  String getAllWallets = '$baseUrl/wallets';
  String deleteBeneficiary(String id) => '$baseUrl/beneficiaries/$id';
  String getWalletBeneficairies(String walletId) =>
      '$baseUrl/wallets/$walletId/beneficiaries';
  String mainWallet = '$baseUrl/wallets/dashboard';
  String getWallet(String walletId) =>
      '$baseUrl/wallets/dashboard?wallet_id=$walletId';

  String getWalletTransactionHistory(String walletId) =>
      '$baseUrl/wallets/history?wallet_id=$walletId';
  String getFundwalletMethod = '$baseUrl/wallets/funding-options';

  String bankTransferToWallet(String walletId) =>
      '$baseUrl/wallets/funding-account/$walletId';

  String enterAmountfundWithCard = '$baseUrl/collections-notice';
  String payWithCard = '$baseUrl/collections-notice/pay';
  String getPurposeOfSwap = '$baseUrl/purpose';
  String createSwap(String link) => '$baseUrl$link';
  String authorizeSwapRequest(String link) => '$baseUrl/$link';
  String getSwapValue = '$baseUrl/swaps/convert';
}

class _Transactions {
  String getSingleTransationsDetaills(String transactionId) =>
      '$baseUrl/transactions/display/$transactionId';

  String reportTransactions = '$baseUrl/issues';
}

class _Bank {
  String getBanks = '$baseUrl/banks/select';
}

class _Withdraw {
  String addBeneficiary = '$baseUrl/beneficiaries';
  String accResolve = '$baseUrl/beneficiaries/resolve';
  String getBeneficiary(String beneficiaryId) =>
      '$baseUrl/beneficiaries/$beneficiaryId';

  String withdrawFunds(String link) => '$baseUrl$link';

  String authorizeWithdraw = '$baseUrl/transactions/authorize';
  String calculateWithdrawFee = '$baseUrl/fees/calculate';
}

class _Requests {
  String getAllMyRequest = '$baseUrl/swaps/profile';
  String getMySingleSwapRequest(String swapRequestId) =>
      '$baseUrl/swaps/show/$swapRequestId';
  String acceptOrDeclineBid = '$baseUrl/bids/process';
}

class _Market {
  String getAllMarketSwaps(String? currencyCode) =>
      '$baseUrl/marketplace/?currency_code=$currencyCode';
  String getMarketCurrencyPairs(String link) => '$baseUrl$link';
  String getAvailableReviews = '$baseUrl/stars/select';
  String bidSwapRequest = '$baseUrl/bids';
  String getSingleMarketSwapRequest(String swapRequestId) =>
      '$baseUrl/swaps/display/$swapRequestId';
  String authorizeBidRequest = '$baseUrl/bids/pay';
  String addReview = '$baseUrl/reviews';
}

class _Settings {
  String changePin = '$baseUrl/auth-pins/change';
  String getChangePinOTP = '$baseUrl/auth-pins/request-change-pin-code';
  //String verifyForgotPin = '$b'
}

class _News {
  String allNews(String category, String apikey) =>
      '$baseUrl/news?category=$category&token=$apikey';

  String allTicketsCategories = '$baseUrl/issue-categories/select';
  String addComment = '$baseUrl/conversations';
  String issuesDetails(String id) => '$baseUrl/issues/$id';
}

class _Notifications {
  String allNotifications(bool? status) => status == null
      ? '$baseUrl/notifications'
      : '$baseUrl/notifications/?read=$status';

  String notificationDetail(String id) => '$baseUrl/notifications/$id';
}

// endpoints
final news = _News();
final notifications = _Notifications();
final authEndpoints = _AuthEndpoints();
final requests = _Requests();
final settings = _Settings();

final market = _Market();

final todoEndpoints = _TodoEndpoints();
final userEndpoints = _User();

final stateAndCityEndpoints = _StatesAndCities();

final currencies = _Currencies();
final wallets = _Wallet();

final transactions = _Transactions();
final bank = _Bank();
final withdraw = _Withdraw();

// Todo -> Add more Endpoint classes based on what they do


