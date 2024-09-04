import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'dto/{{name}}_details_response/{{name}}_details_response.dart';
import 'dto/update_{{name}}_request_body/update_{{name}}_request_body.dart';

part '{{name}}_api.g.dart';

@RestApi()
abstract class {{name.pascalCase()}}Api {
  static const String {{name}}ApiPath = 'TODO: Add your REST API path here';

  factory {{name.pascalCase()}}Api(Dio dio) = _{{name.pascalCase()}}Api;

  @GET({{name}}ApiPath)
  Future<{{name.pascalCase()}}DetailsResponse> getMy{{name.pascalCase()}}Details();

  @PUT('${{name}}ApiPath/TODO: Add your REST API path here')
  Future<{{name.pascalCase()}}DetailsResponse> update{{name.pascalCase()}}(
    @Body() Update{{name.pascalCase()}}RequestBody body,
  );
}
