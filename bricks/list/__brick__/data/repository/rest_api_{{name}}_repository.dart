import 'dart:io';

import 'package:dio/dio.dart';

import '../../domain/repository/api_{{name}}_repository.dart';
import '../network/dto/{{name}}_list_response/{{name}}_list_response.dart';
import '../network/{{name}}_api.dart';

class RestApi{{name.pascalCase()}}Repository implements Api{{name.pascalCase()}}Repository {
  final {{name.pascalCase()}}Api _{{name.camelCase()}}Api;

  RestApi{{name.pascalCase()}}Repository(this._{{name.camelCase()}}Api);

  @override
  Future<Result<{{name.pascalCase()}}ListResponse, CommonRequestError>>
      fetch{{name.pascalCase()}}List({
        required int pageIndex,
      }) async {
    try {
      final {{name.pascalCase()}}ListResponse response =
          await _{{name.camelCase()}}Api.get{{name.pascalCase()}}List(
            pageIndex: pageIndex,
            pageSize: 50,
            sort: 'ID,DESC',
          );

      return Result.success(data: response);
    } on DioException catch (e) {
      // catch network connection lost error
      if (e.error is SocketException) {
        return const Result.failure(
          error: CommonRequestError.connectionLost(),
        );
      } else {
        // catch undefined problem like 500 server error
        return const Result.failure(
          error: CommonRequestError.undefinedProblem(),
        );
      }
    }
  }
}
