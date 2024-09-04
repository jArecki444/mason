import 'package:freezed_annotation/freezed_annotation.dart';

part '{{name}}_details_entity.freezed.dart';

// Use this entity instead of relying on the response from the network.
// This will allow you to have a consistent data structure across the app.

@freezed
class {{name.pascaCase()}}DetailsEntity with _${{name.pascaCase()}}DetailsEntity {
  factory {{name.pascaCase()}}DetailsEntity({
    required int id,
    required String firstName,
    required String lastName,
    required String email,
  }) = _{{name.pascaCase()}}DetailsEntity;
}
