/* -- LIST OF Constants used in APIs -- */

class APIConstants {
  static final String baseUrl = "https://127.0.0.1:7270/api/User/login";

  static _EndPoints endPoints=_EndPoints();

}
class _EndPoints{
  final String login="/api/User/login";
  final String editPassword="/api/User/edit-password";

  final String getMyWallet="/api/Wallet/get-my-wallet";
  final String addAdmin="/api/SystemAdmin/add-Admin";
  final String addCenter="/api/SystemAdmin/add-center";

}