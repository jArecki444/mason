import 'package:freezed_annotation/freezed_annotation.dart';

import '{{name}}_list_item.dart';

part '{{name}}_list_response.freezed.dart';
part '{{name}}_list_response.g.dart';

@freezed
class {{name.pascalCase()}}ListResponse with _${{name.pascalCase()}}ListResponse {
  factory {{name.pascalCase()}}ListResponse({
    required int pageIndex,
    required int pageSize,
    required int totalCount,
    required bool hasNext,
    required List<{{name.pascalCase()}}ListItem> content,
  }) = _{{name.pascalCase()}}ListResponse;

  factory {{name.pascalCase()}}ListResponse.fromJson(Map<String, dynamic> json) =>
      _${{name.pascalCase()}}ListResponseFromJson(json);
}
