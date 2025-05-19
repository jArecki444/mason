part of '{{name}}_list_bloc.dart';

@freezed
class {{name.pascalCase()}}ListState with _${{name.pascalCase()}}ListState {
  const factory {{name.pascalCase()}}ListState({

    /// Indicates the current status of the page to
    /// display the appropriate content for entire page
    /// to use it in bloc builder
    @Default({{name.pascalCase()}}ListPageStatus.loading())   
    final {{name.pascalCase()}}ListPageStatus pageStatus,

    // Indicates that we should handle some action result in bloc listener
    // like navigation to next screen or showing error message
    final ActionResultToHandle? actionResultToHandle,

    /// Fetched data from the API to display in the list
    @Default([]) final List<{{name.pascalCase()}}ListItem> fetchedListItems,

    // Pagination params
    @Default(0) final int pageIndex,
    @Default(false) final bool hasFetchedAll,
    @Default(false) final bool isLoadingMore,

  }) = _{{name.pascalCase()}}ListState;
}

@freezed
class {{name.pascalCase()}}ListPageStatus with _${{name.pascalCase()}}ListPageStatus {
  /// Allows you to display the initial content of this page.
  const factory {{name.pascalCase()}}ListPageStatus.initialized() =
      _{{name.pascalCase()}}InitializedPageStatus;

  /// Allows you to display the CircularProgressIndicator
  /// indicating pending API request.
  const factory {{name.pascalCase()}}ListPageStatus.loading() = _{{name.pascalCase()}}LoadingPageStatus;

  /// It reflects network connection lost.
  /// The user should check the network connection and try again.
  /// It persists last event to handle it after network connection is back
  const factory {{name.pascalCase()}}ListPageStatus.networkConnectionLost(
    {{name.pascalCase()}}ListEvent lastEventToRetry,
  ) = _{{name.pascalCase()}}NetworkConnectionLostPageStatus;

  /// It reflects that we received empty data from the server and 
  /// we should show empty state page.
  const factory {{name.pascalCase()}}ListPageStatus.emptyData() =
      _{{name.pascalCase()}}EmptyDataPageStatus;

  /// Indicated unexpected network error.
  /// It may be caused by server error or other unexpected error.
  /// We will show "Something went wrong" page.
  const factory {{name.pascalCase()}}ListPageStatus.unexpectedServerError() =
      _{{name.pascalCase()}}UnexpectedServerError;
}

@freezed
class ActionResultToHandle with _$ActionResultToHandle {

  /// Indicates that the user has performed an action that should be handled
  /// (user pressed on a list item to navigate to the details page)
  const factory ActionResultToHandle.navigateToDetailsPage(int itemId) =
      _NavigateTo{{name.pascalCase()}}DetailsPageActionResultToHandle;
}
