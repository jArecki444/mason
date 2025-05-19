import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'bloc/{{name}}_list_bloc.dart';

class {{name.pascalCase()}}ListBody extends StatefulWidget {
  const {{name.pascalCase()}}ListBody({super.key});

  @override
  State<{{name.pascalCase()}}ListBody> createState() => _{{name.pascalCase()}}ListBodyState();
}
class _{{name.pascalCase()}}ListBodyState extends State<{{name.pascalCase()}}ListBody> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScrollListener);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScrollListener)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<{{name.pascalCase()}}ListBloc, {{name.pascalCase()}}ListState>(
      listener: (context, state) {
        state.actionResultToHandle?.when(
          navigateToDetails: (itemId) {
            //TODO: add navigation to details page if needed
            print('Navigate to details page with itemId: $itemId');
          },
        );
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
                    title: LocaleKeys.errors_errorOccurred.tr(),
                    description: LocaleKeys.errors_somethingWentWrong.tr(),
                    imageAsset: ImageAssets.errorImages.warningIcon,
                  ),

                  // SHOW OFFLINE MODE PAGE
                  networkConnectionLost: (lastEventToRetry) => CommonOfflineModePage(
                    imageAsset: ImageAssets.errorImages.connectionLost,
                    title: LocaleKeys.errors_errorOccurred.tr(),
                    description: LocaleKeys.errors_offline.tr(),
                    submitButtonText: LocaleKeys.common_tryAgain.tr(),
                    onTryAgainPressed: () {
                      context.read<{{name.pascalCase()}}Bloc>().add(lastEventToRetry);
                    },
                  ),

                  // SHOW EMPTY DATA PAGE
                  //TODO: replace it with your own page for empty data 
                  emptyData: () => CommonUnexpectedServerErrorPage(
                    onSuggestionPressed: () => GoRouter.of(context).pop(),
                    buttonSuggestionText: LocaleKeys.common_goBack.tr(),
                    title: LocaleKeys.errors_noData.tr(),
                    description: LocaleKeys.errors_noDataDescription.tr(),
                    imageAsset: ImageAssets.errorImages.emptyState,
                  ),

                  // SHOW PAGE CONTENT
                  initialized: () {
                  return Scaffold(
              backgroundColor: AppPalette.backgroundPrimary,
              body: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                controller: _scrollController,
                child: Column(
                  children: [
                    // List of fetched items from state
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      // Add +1 to the length of the list to show the loading
                      // indicator at the bottom of the list
                      itemCount: state.isLoadingMore
                          ? state.fetchedListItems.length + 1
                          : state.fetchedListItems.length,
                      separatorBuilder: (context, index) => const Divider(),
                      itemBuilder: (context, index) {
                        if (index == state.fetchedListItems.length) {
                          // Show loading indicator at the bottom of the list
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          final {{name.pascalCase()}}ListItem item = state.fetchedListItems[index];
                          return ListTile(
                            title: Text('ID: ${item.id}'),
                            subtitle: Text('Created at: ${item.createdAt}'),
                            onTap: () {
                              context.read<{{name.pascalCase()}}Bloc>().add(
                                {{name.pascalCase()}}Event.pressedOn{{name.pascalCase()}}ListItem(itemId: item.id),
                              );
                            },
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _onScrollListener() {
  final currentState = context.read<{{name.pascalCase()}}ListBloc>().state;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;

    if (!_scrollController.hasClients ||
        currentState.isLoadingMore ||
        currentState.hasFetchedAll) {
      return;
    }

    if (currentScroll >= maxScroll) {
      context
          .read<{{name.pascalCase()}}ListBloc>()
          .add(const {{name.pascalCase()}}ListEvent.scrolledToFetchMoreItems());
    }
  }
}
