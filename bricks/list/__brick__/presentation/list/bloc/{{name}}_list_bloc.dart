import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/network/dto/{{name}}_list_response/{{name}}_list_item.dart';
import '../../../domain/repository/api_{{name}}_repository.dart';

part '{{name}}_list_bloc.freezed.dart';
part '{{name}}_list_event.dart';
part '{{name}}_list_state.dart';

@injectable
class {{name.pascalCase()}}ListBloc
    extends Bloc<{{name.pascalCase()}}ListEvent, {{name.pascalCase()}}ListState> {
  
  final Api{{name.pascalCase()}}Repository _api{{name.pascalCase()}}Repository;

  {{name.pascalCase()}}ListBloc(
    this._api{{name.pascalCase()}}Repository,
  ) : super(const {{name.pascalCase()}}ListState()) {

    on<EnteredPage{{name.pascalCase()}}ListEvent>(_onEnteredPage);

    on<PressedOn{{name.pascalCase()}}ListItemEvent>(
      _onPressed{{name.pascalCase()}}ListItem,
    );
    on<ScrolledToFetchMore{{name.pascalCase()}}ItemsListEvent>(
      _onScrolledToFetchMoreItems,
    );

  }

  Future<void> _onEnteredPage(
    EnteredPage{{name.pascalCase()}}ListEvent event,
    Emitter<{{name.pascalCase()}}ListState> emit,
  ) async {
    emit(
      state.copyWith(
        pageStatus: const {{name.pascalCase()}}ListPageStatus.loading(),
        pageIndex: 0,
        hasFetchedAll: false,
        isLoadingMore: false,
      ),
    );

    final result = await _api{{name.pascalCase()}}Repository.fetch{{name.pascalCase()}}List(
      pageIndex: state.pageIndex,
    );

    emit(
      result.when(
        success: (data) {
          return state.copyWith(
            pageStatus: data == null || data.content.isEmpty
                ? const {{name.pascalCase()}}ListPageStatus.emptyData()
                : const {{name.pascalCase()}}ListPageStatus.initialized(),
            actionResultToHandle: null,
            fetchedListItems: data == null ? [] : List<{{name.pascalCase()}}ListItem>.from(data.content),
          );
        },
        failure: (error) => error.when(
          connectionLost: () => state.copyWith(
            pageStatus: {{name.pascalCase()}}ListPageStatus.networkConnectionLost(event),
          ),
          undefinedProblem: () => state.copyWith(
            pageStatus: const {{name.pascalCase()}}ListPageStatus.unexpectedServerError(),
          ),
        ),
      ),
    );
  }

  Future<void> _onPressed{{name.pascalCase()}}ListItem(
    PressedOn{{name.pascalCase()}}ListItemEvent event,
    Emitter<{{name.pascalCase()}}ListState> emit,
  ) async {
    emit(
      state.copyWith(
        actionResultToHandle: null,
      ),
    );
  

    emit(
      state.copyWith(
        actionResultToHandle: ActionResultToHandle.navigateToDetailsPage(event.listItem.id),
      ),
    );
  }

  Future<void> _onScrolledToFetchMoreItems(
    ScrolledToFetchMore{{name.pascalCase()}}ItemsListEvent event,
    Emitter<{{name.pascalCase()}}ListState> emit,
  ) async {
    if (state.isLoadingMore || state.hasFetchedAll) return;

    emit(
      state.copyWith(
        isLoadingMore: true,
      ),
    );

    final result = await _api{{name.pascalCase()}}Repository.fetch{{name.pascalCase()}}List(
      pageIndex: state.pageIndex + 1,
    );

    emit(
      result.when(
        success: (data) {
          List<{{name.pascalCase()}}ListItem> fetchedItems = List.from(data!.content);

          return state.copyWith(
            pageStatus: const {{name.pascalCase()}}ListPageStatus.initialized(),
            actionResultToHandle: null,
            fetchedListItems: [...state.fetchedListItems, ...fetchedItems],
            pageIndex: state.pageIndex + 1,
            hasFetchedAll: !data.hasNext,
            isLoadingMore: false,
          );
        },
        failure: (error) => error.when(
          connectionLost: () => state.copyWith(
            pageStatus: {{name.pascalCase()}}ListPageStatus.networkConnectionLost(event),
          ),
          undefinedProblem: () => state.copyWith(
            pageStatus: const {{name.pascalCase()}}ListPageStatus.unexpectedServerError(),
          ),
        ),
      ),
    );
  }
}
