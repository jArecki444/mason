part of '{{name}}_bloc.dart';

@freezed
class {{name.pascalCase()}}State with _${{name.pascalCase()}}State {
  const factory {{name.pascalCase()}}State({

    /// Indicates the current status of the page to
    /// display the appropriate content for entire page
    /// to use it in bloc builder
    @Default({{name.pascalCase()}}PageStatus.loading())   
    final {{name.pascalCase()}}PageStatus pageStatus,

    // Indicates that we should handle some action result in bloc listener
    // like navigation to next screen or showing error message
    final ActionResultToHandle? actionResultToHandle,

    /// Fetched data from the API mapped to the entity
    final {{name.pascalCase()}}DetailsEntity? fetchedData,

  }) = _{{name.pascalCase()}}State;
}

@freezed
class {{name.pascalCase()}}PageStatus with _${{name.pascalCase()}}PageStatus {
  /// Allows you to display the initial content of this page.
  const factory {{name.pascalCase()}}PageStatus.initialized() =
      _{{name.pascalCase()}}InitializedPageStatus;

  /// Allows you to display the CircularProgressIndicator
  /// indicating pending API request.
  const factory {{name.pascalCase()}}PageStatus.loading() = _{{name.pascalCase()}}LoadingPageStatus;

  /// It reflects network connection lost.
  /// The user should check the network connection and try again.
  /// It persists last event to handle it after network connection is back
  const factory {{name.pascalCase()}}PageStatus.networkConnectionLost(
    {{name.pascalCase()}}Event lastEventToRetry,
  ) = _{{name.pascalCase()}}NetworkConnectionLostPageStatus;

  /// Indicated unexpected network error.
  /// It may be caused by server error or other unexpected error.
  /// We will show "Something went wrong" page.
  const factory {{name.pascalCase()}}PageStatus.unexpectedServerError() =
      _{{name.pascalCase()}}UnexpectedServerError;
}

@freezed
class ActionResultToHandle with _$ActionResultToHandle {
  /// Indicates that the user has performed an action that should be handled
  /// by showing a success snackbar
  /// TODO: Add more details about this action

  const factory ActionResultToHandle.showSuccessSnackBar() =
      _ShowSuccessSnackBarActionResultToHandle;

  /// Indicates that the user has performed an action that should be handled
  /// by showing an error snackbar
  /// TODO: Add more details about this action
  const factory ActionResultToHandle.showErrorSnackBar() =
      _ShowErrorSnackBarActionResultToHandle;

  /// Indicates that the user has performed an action that should be handled
  /// by navigating to the next page
  /// TODO: Add more details about this action
  const factory ActionResultToHandle.navigateToNextPage() =
      _NavigateToNextPageActionResultToHandle;
}
