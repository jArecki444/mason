part of '{{name}}_bloc.dart';


@freezed
class {{name.pascalCase()}}Event with _${{name.pascalCase()}}Event {
  /// This event is responding to the user entering the page.
  /// It will be used to initialize the state of the page.
  const factory {{name.pascalCase()}}Event.enteredPage(
  ) = EnteredPage{{name.pascalCase()}}Event;

  /// This event is responding to the user pressing the submit button.
  const factory {{name.pascalCase()}}Event.pressedOnSubmitButton(
  ) = PressedOnSubmitButton{{name.pascalCase()}}Event;


}
