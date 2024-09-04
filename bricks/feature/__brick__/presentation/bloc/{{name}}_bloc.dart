import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/{{name}}_details_entity.dart';
import '../../domain/repository/api_{{name}}_repository.dart';

part '{{name}}_bloc.freezed.dart';
part '{{name}}_event.dart';
part '{{name}}_state.dart';

@injectable
class {{name.pascalCase()}}Bloc
    extends Bloc<{{name.pascalCase()}}Event, {{name.pascalCase()}}State> {
  
  final Api{{name.pascalCase()}}Repository _api{{name.pascalCase()}}Repository;

  {{name.pascalCase()}}Bloc(
    this._api{{name.pascalCase()}}Repository,
  ) : super(const {{name.pascalCase()}}State()) {
    on<EnteredPage{{name.pascalCase()}}Event>(_onEnteredPage);
    //TODO: Uncomment this line if you want to handle the submit button press
    // on<PressedOnSubmitButton{{name.pascalCase()}}Event>(_onSubmitButtonPressed);
  }

  Future<void> _onEnteredPage(
    EnteredPage{{name.pascalCase()}}Event event,
    Emitter<{{name.pascalCase()}}State> emit,
  ) async {
    final result = await _api{{name.pascalCase()}}Repository.fetch{{name.pascalCase()}}Details();

    emit(
      result.when(
        success: (data) {
          return state.copyWith(
            pageStatus: const {{name.pascalCase()}}PageStatus.initialized(),
            actionResultToHandle: null,
            fetchedData: data,
          );
        },
        failure: (error) => error.when(
          connectionLost: () => state.copyWith(
            pageStatus: {{name.pascalCase()}}PageStatus.networkConnectionLost(event),
          ),
          undefinedProblem: () => state.copyWith(
            pageStatus: const {{name.pascalCase()}}PageStatus.unexpectedServerError(),
          ),
        ),
      ),
    );
  }

  //TODO: Uncomment this method if you want to handle the submit button press
  // Future<void> _onSubmitButtonPressed(
  //   PressedOnSubmitButton{{name.pascalCase()}}Event event,
  //   Emitter<{{name.pascalCase()}}State> emit,
  // ) async {
  //   emit(
  //     state.copyWith(
  //       pageStatus: const {{name.pascalCase()}}PageStatus.loading(),
  //       actionResultToHandle: null,
  //     ),
  //   );

  //   final result = await _{{name}}Repository.someApiCall(
  //     someValue: state.someValueToSubmit,
  //   );

  //   emit(
  //     result.when(
  //       success: () {
  //         return state.copyWith(
  //           pageStatus: const {{name.pascalCase()}}PageStatus.initialized(),
  //           actionResultToHandle: const ActionResultToHandle.showSuccessSnackBar()
           
  //         );
  //       },
  //       failure: (error) => error.when(
  //         connectionLost: () => state.copyWith(
  //           pageStatus:
  //               {{name.pascalCase()}}PageStatus.networkConnectionLost(event),
  //         ),
  //         undefinedProblem: () => state.copyWith(
  //           pageStatus:
  //               const {{name.pascalCase()}}PageStatus.unexpectedServerError(),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
