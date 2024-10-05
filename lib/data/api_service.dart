import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class ApiService {
  final Dio _dio = Dio();
  final _logger = Logger();

  ApiService._privateConstructor() {
    initApiService();
  }

  static final ApiService _instance = ApiService._privateConstructor();

  factory ApiService() {
    return _instance;
  }

  static const currentUrl = "https://jsonplaceholder.typicode.com";

  initApiService() {
    _dio.options.baseUrl = currentUrl;
    _dio.options.headers['Content-Type'] = 'application/json';
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        _logger.i(
            " request Path: ${options.path} /n  Request data : ${options.data}");

        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.resolve(response);
      },
    ));
  }

  Dio get sendRequest => _dio;
}
