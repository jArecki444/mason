import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'dto/{{name}}_list_response/{{name}}_list_response.dart';

part '{{name}}_api.g.dart';

@RestApi()
abstract class {{name.pascalCase()}}Api {
  static const String {{name.camelCase()}}ApiPath = 'TODO: Add your REST API path here';

  factory {{name.pascalCase()}}Api(Dio dio) = _{{name.pascalCase()}}Api;

  @GET({{name.camelCase()}}ApiPath)
  Future<{{name.pascalCase()}}ListResponse> get{{name.pascalCase()}}List({
    @Query('pageIndex') required int pageIndex,
    @Query('pageSize') required int pageSize,
    @Query('sort') required String sort,
  });
}
