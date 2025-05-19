
import '../../data/network/dto/{{name}}_list_response/{{name}}_list_response.dart';

abstract class Api{{name.pascalCase()}}Repository {
  /// The method allows you to fetch {{name}} list from the API.
  Future<Result<{{name.pascalCase()}}ListResponse, CommonRequestError>>
      fetch{{name.pascalCase()}}List({
          required int pageIndex,
        });
}
