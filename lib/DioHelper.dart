import 'package:dio/dio.dart';

class DioHelper {
	Dio dio;

	void _checkInit(){
		if(dio == null) {
			dio = Dio();
		}
	}

	requestGet(String baseUrl, Map<String, dynamic> queryParameters) async{
		_checkInit();
		Response response = await dio.get(baseUrl, queryParameters: queryParameters);
		print(response);
		return response;
	}
}
