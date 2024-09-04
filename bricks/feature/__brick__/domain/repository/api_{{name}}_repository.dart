import 'entity/{{name}}_entity.dart';


abstract class Api{{name.pascalCase()}}Repository {
  /// The method allows you to fetch details of the {{name}}.
  Future<Result<{{name.pascalCase()}}DetailsEntity, CommonRequestError>>
      fetch{{name.pascalCase}}Details();

  /// The method allows you to update details of the {{name}}.
    Future<Result<{{name.pascalCase()}}DetailsEntity, CommonRequestError>> update{{name.pascalCase()}}({
    required Update{{name.pascalCase()}}RequestBody update{{name.pascalCase()}}RequestBody,
  });
}
