import 'package:dio/dio.dart';
import 'package:weather_app/models/wearther_model.dart';

class WeatherService {
  Dio dio = Dio();
  String baseurl = "";
  Future<WeatherModel> getWeather(String city) async {
    try {
      Response response = await dio.get(
          "http://api.weatherapi.com/v1/forecast.json?key=f502ad0e29d245259dc173345231411&q=$city&days=1&aqi=no&alerts=no");
      WeatherModel weathermodel = WeatherModel.froJson(response.data);
      return weathermodel;
    } on DioException catch (e) {
      final String messError = e.response?.data['error']['message'] ??
          "oops  there was an Error serever , try again";
      throw Exception(messError);
    } catch (e) {
      throw Exception("oops  there was an Error , try again");
    }
  }
}
