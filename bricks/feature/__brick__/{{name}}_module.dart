import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'data/network/{{name}}_api.dart';
import 'data/repository/rest_api_{{name}}_repository.dart';
import 'domain/repository/{{name}}_repository.dart';

@module
abstract class {{name.pascalCase()}}Module {
  @LazySingleton(as: {{name.pascalCase()}}Repository)
  RestApi{{name.pascalCase()}}Repository get api{{name.pascalCase()}}Repository;

  @lazySingleton
  {{name.pascalCase()}}Api get {{name}}Api => {{name.pascalCase()}}Api(inject<Dio>());
}
