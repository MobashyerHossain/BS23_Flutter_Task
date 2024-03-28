import 'package:dio/dio.dart';
import 'package:starflare/core/constants/api_constants.dart';

class GitRepoApi {
  late final Dio dio = Dio();

  // Get all Repositories
  Future<Response> getRepos({
    int page = 0,
  }) {
    return dio.get(
      '${ApiConstants.gitRepoBaseApi}q=flutter&page=$page&per_page=10&sort=stars&order=desc',
    );
  }
}
