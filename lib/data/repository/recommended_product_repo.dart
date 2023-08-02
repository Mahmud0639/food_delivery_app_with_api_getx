import 'package:food_delivery_app/data/api/api_client.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:get/get.dart';


class RecommendedProductRepo extends GetxService{
  //many times we need to get load data from internet that is why we need GetxService
  final ApiClient apiClient;
  //constructor
  RecommendedProductRepo({required this.apiClient});

  Future<Response> getRecommendedProductList() async{
    return apiClient.getData(AppConstants.RECOMMENDED_PRODUCT_URI);
  }
}