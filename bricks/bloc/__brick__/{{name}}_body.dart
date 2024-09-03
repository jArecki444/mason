import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'bloc/{{name}}_bloc.dart';

class {{name.pascalCase()}}Body extends StatelessWidget {
  const {{name.pascalCase()}}Body({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<{{name.pascalCase()}}Bloc, {{name.pascalCase()}}State>(
      listener: (context, state) {
        state.actionResultToHandle?.when(navigateToNextPage: () {
          // TODO: implement
        }, showErrorSnackBar: () {
          // TODO: implement
        }, showSuccessSnackBar: () {
          // TODO: implement
        });
      },
      builder: (context, state) {
        return state.pageStatus.when(
                  // SHOW LOADING INDICATOR
                  loading: () => const CommonLoadingIndicatorPage(),

                  // SHOW UNEXPECTED SERVER ERROR PAGE
                  // when server is down
                  unexpectedServerError: () => CommonUnknownServerErrorPage(
                    onSuggestionPressed: () => GoRouter.of(context).pop(),
                    buttonSuggestionText: LocaleKeys.common_goBack.tr(),
                  ),

                  // SHOW OFFLINE MODE PAGE
                  networkConnectionLost: (lastEventToRetry) => CommonOfflineModePage(
                    onTryAgainPressed: () {
                      context.read<{{name.pascalCase()}}Bloc>().add(lastEventToRetry);
                    },
                  ),

                  // SHOW LOGIN FORM
                  initialized: () {
                    return Placeholder(
                      child: Text('TODO: implement {{name.pascalCase()}} page'),
                    );
                  },
                );
      },
    );
  }
}