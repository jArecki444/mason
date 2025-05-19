import 'dart:io';

import 'package:dio/dio.dart';

import '../../domain/entity/{{name}}_details_entity.dart';
import '../../domain/repository/api_{{name}}_repository.dart';
import '../network/dto/{{name}}_details_response/{{name}}_details_response.dart';
import '../network/dto/update_{{name}}_request_body/update_{{name}}_request_body.dart';
import '../network/{{name}}_api.dart';

class RestApi{{name.pascalCase()}}Repository implements Api{{name.pascalCase()}}Repository {
  final {{name.pascalCase()}}Api _{{name.camelCase()}}Api;

  RestApi{{name.pascalCase()}}Repository(this._{{name.camelCase()}}Api);

  @override
  Future<Result<{{name.pascalCase()}}DetailsEntity, CommonRequestError>>
      fetch{{name.pascalCase()}}Details() async {
    try {
      final {{name.pascalCase()}}DetailsResponse response =
          await _{{name.camelCase()}}Api.get{{name.pascalCase()}}Details();

      final {{name.pascalCase()}}DetailsEntity {{name.camelCase()}}DetailsEntity = response.toEntity();

      return Result.success(data: {{name.camelCase()}}DetailsEntity);
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

  @override
  Future<Result<{{name.pascalCase()}}DetailsEntity, CommonRequestError>> update{{name.pascalCase()}}({
    required Update{{name.pascalCase()}}RequestBody update{{name.pascalCase()}}RequestBody,
  }) async {
    try {
      final {{name.pascalCase()}}DetailsResponse response = await _{{name.camelCase()}}Api.update{{name.pascalCase()}}(
        update{{name.pascalCase()}}RequestBody,
      );

      final {{name.pascalCase()}}DetailsEntity {{name.camelCase()}}DetailsEntity = response.toEntity();

      return Result.success(data: {{name.camelCase()}}DetailsEntity);
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
