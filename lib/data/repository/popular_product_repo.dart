import 'package:food_delivery_app/data/api/api_client.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:get/get.dart';


class PopularProductRepo extends GetxService{
  //many times we need to get load data from internet that is why we need GetxService
  final ApiClient apiClient;
  //constructor
  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async{
     return apiClient.getData(AppConstants.POPULAR_PRODUCT_URI);
  }
}