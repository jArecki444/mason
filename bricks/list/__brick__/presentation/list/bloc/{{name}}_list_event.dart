part of '{{name}}_list_bloc.dart';

@freezed
class {{name.pascalCase()}}ListEvent with _${{name.pascalCase()}}ListEvent {
  /// This event is responding to the user entering the page.
  /// It will be used to initialize the state of the page.
  const factory {{name.pascalCase()}}ListEvent.enteredPage(
  ) = EnteredPage{{name.pascalCase()}}ListEvent;

  /// This event is responding to the user scrolling to the bottom of the list.
  /// We will use it to fetch more data from the server.
  const factory {{name.pascalCase()}}ListEvent.scrolledToFetchMoreItems() =
      ScrolledToFetchMore{{name.pascalCase()}}ItemsListEvent;

  /// This event is responding to the user pressing on the list item.
  const factory {{name.pascalCase()}}ListEvent.pressedOn{{name.pascalCase()}}ListItem(
    {{name.pascalCase()}}ListItem listItem,
  ) = PressedOn{{name.pascalCase()}}ListItemEvent;


}
