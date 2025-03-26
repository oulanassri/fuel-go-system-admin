/* -- LIST OF Constants used in APIs -- */

class APIConstants {
  static final String baseUrl = "http://172.201.110.216:5000";

  static _EndPoints endPoints=_EndPoints();

}
class _EndPoints{
  final String login="/api/User/login";//True
  final String editPassword="/api/User/edit-password";

  final String addAdmin="/api/SystemAdmin/add-Admin";
  final String addCenter="/api/SystemAdmin/add-center";//True
  final String getAllOrders="/api/SystemAdmin/get-all-orders";
  final String getCenters="/api/SystemAdmin/get-centers";//True
  final String getAdminsByCneter = "/api/SystemAdmin/get-admins-by-cneter";//True
  final String getConstantValues = "/api/ConstantDictionary/get-constant-values";//GET True
  //City
  final String getCities = "/api/City/get-cities"; //GET True



  //Neighborhood
  final String getNeighborhood = "/api/Neighborhood/get-neighborhood"; //GET True

  final String editConstantValue = "/api/ConstantDictionary/edit-constant-value"; //GET True

}