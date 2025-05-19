import 'package:freezed_annotation/freezed_annotation.dart';

part '{{name}}_list_item.freezed.dart';
part '{{name}}_list_item.g.dart';

@freezed
class {{name.pascalCase()}}ListItem with _${{name.pascalCase()}}ListItem {
  factory {{name.pascalCase()}}ListItem({
    required int id,
    required DateTime createdAt,
  }) = _NotificationListItem;

  factory {{name.pascalCase()}}ListItem.fromJson(Map<String, dynamic> json) =>
      _${{name.pascalCase()}}ListItemFromJson(json);
}
