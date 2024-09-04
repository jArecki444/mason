import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:retrofit/dio.dart';
import 'package:rxdart/rxdart.dart';

import '../../domain/entity/{{name}}_details_entity.dart';
import '../../domain/repository/api_{{name}}_repository.dart';
import '../network/dto/{{name}}_details_response/{{name}}_details_response.dart';
import '../network/{{name}}_api.dart';



class RestApi{{name.pascalCase()}}Repository implements Api{{name.pascalCase()}}Repository {
  final {{name.pascalCase()}}Api _{{name}}Api;

  RestApi{{name.pascalCase()}}Repository(this._{{name}}Api);

  @override
  Future<Result<{{name.pascalCase()}}DetailsEntity, CommonRequestError>>
      fetch{{name.pascalCase()}}Details() async {
    try {
      final {{name.pascalCase()}}DetailsResponse response =
          await _{{name}}Api.get{{name.pascalCase()}}Details();

      final {{name.pascalCase()}}DetailsEntity {{name}}DetailsEntity = response.toEntity();

      return Result.success(data: {{name}}DetailsEntity);
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
      final {{name.pascalCase()}}DetailsResponse response = await _testApi.update{{name.pascalCase()}}(
        update{{name.pascalCase()}}RequestBody,
      );

      final {{name.pascalCase()}}DetailsEntity testDetailsEntity = response.toEntity();

      return Result.success(data: testDetailsEntity);
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
