import 'package:freezed_annotation/freezed_annotation.dart';

part '{{name}}_details_response.freezed.dart';
part '{{name}}_details_response.g.dart';

@freezed
class {{name.pascalCase()}}DetailsResponse
    with _${{name.pascalCase()}}DetailsResponse
    implements DtoToEntityMapper<{{name.pascalCase()}}DetailsResponse, {{name.pascalCase()}}DetailsEntity> {
  const {{name.pascalCase()}}DetailsResponse._();

  factory {{name.pascalCase()}}DetailsResponse({
    required int id,
    required String firstName,
    required String lastName,
    required String email,
    required UserRoleEnum role,
    String? phoneNumber,
  }) = _{{name.pascalCase()}}DetailsResponse;

  factory {{name.pascalCase()}}DetailsResponse.fromJson(Map<String, dynamic> json) =>
      _${{name.pascalCase()}}DetailsResponseFromJson(json);

  @override
  {{name.pascalCase()}}DetailsEntity toEntity() => {{name.pascalCase()}}DetailsEntity(
        id: id,
        firstName: firstName,
        lastName: lastName,
        email: email,
      );
}
