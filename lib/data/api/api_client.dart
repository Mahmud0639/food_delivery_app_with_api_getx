import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService{
  //we will use GetX for Api Client, Repository and Controller
  late String token;
  final String appBaseUrl;
  late Map<String,String> _mainHeader;

  ApiClient({required this.appBaseUrl}){
    baseUrl = appBaseUrl;//here baseUrl is coming from getx
    timeout = Duration(seconds: 30);//timeout also coming from getx..timeout time will wait for 30 seconds to fetching data
    token = AppConstants.TOKEN;
    _mainHeader = {
      'Content-type':'application/json; charset=UTF-8',//Headers used to tell server that we need json type data or posting to server json type data
      'Authorization':'Bearer $token',//here "Bearer" is the token type..when we use post request then we need to pass token and the type of token here is "Bearer"
    };
  }
  Future<Response> getData(String uri) async{
    try{
     Response response = await get(uri);
     return response;
    }catch(e){
      return Response(statusCode: 1,statusText: e.toString());
    }
  }

  void updateHeader(String token){
    _mainHeader = {
      'Content-type':'application/json; charset=UTF-8',//Headers used to tell server that we need json type data or posting to server json type data
      'Authorization':'Bearer $token',//here "Bearer" is the token type..when we use post request then we need to pass token and the type of token here is "Bearer"
    };
  }

  Future<Response> postData(String uri,dynamic body) async{
    try{
     Response response = await post(uri, body,headers: _mainHeader);//here headers is an optional parameter so we need to declare as "headers:"
      return response;
    }catch(e){
      return Response(statusCode: 1,statusText: e.toString());
    }
  }
}