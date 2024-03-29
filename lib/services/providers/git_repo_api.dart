import 'package:dio/dio.dart';
import 'package:starflare/core/constants/api_constants.dart';

class GitRepoApi {
  late final Dio dio = Dio();

  // Get all Repositories
  Future<Response> getRepos({
    String query = "flutter",
    int page = 0,
    int perPage = 10,
    String sortBy = "stars",
    String sortOrder = "desc",
  }) {
    return dio.get(
      '${ApiConstants.gitRepoBaseApi}q=$query&page=$page&per_page=$perPage&sort=$sortBy&direction=$sortOrder',
    );
  }
}
