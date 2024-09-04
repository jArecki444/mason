import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_{{name}}_request_body.freezed.dart';
part 'update_{{name}}_request_body.g.dart';

@freezed
class Update{{name.pascalCase()}}RequestBody with _$Update{{name.pascalCase()}}RequestBody {
  factory Update{{name.pascalCase()}}RequestBody({
    required String dataToUpdate,
  }) = _Update{{name.pascalCase()}}RequestBody;

  factory Update{{name.pascalCase()}}RequestBody.fromJson(Map<String, dynamic> json) =>
      _$Update{{name.pascalCase()}}RequestBodyFromJson(json);
}
