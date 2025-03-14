/* -- LIST OF Constants used in APIs -- */

class APIConstants {
  static final String baseUrl = "http://192.168.7.17:5000";

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
  final String getFuelDetails = "/api/FuelDetails/get-fuel-details";//GET True
  //City
  final String getCities = "/api/City/get-cities"; //GET True



  //Neighborhood
  final String getNeighborhood = "/api/Neighborhood/get-neighborhood"; //GET True


}