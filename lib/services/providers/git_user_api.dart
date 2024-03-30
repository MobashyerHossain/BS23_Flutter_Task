import 'package:dio/dio.dart';

class GitUserApi {
  late final Dio dio = Dio();

  // Get User by Url
  Future<Response> getGitUserByUrl(String url) {
    return dio.get(
      url,
    );
  }
}
