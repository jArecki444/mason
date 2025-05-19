import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/{{name}}_list_bloc.dart';
import '{{name}}_list_body.dart';

class {{name.pascalCase()}}ListPage extends StatelessWidget {

  const {{name.pascalCase()}}ListPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => inject<{{name.pascalCase()}}ListBloc>()
          ..add(
            const {{name.pascalCase()}}ListEvent.enteredPage(),
          ),
        child: const {{name.pascalCase()}}ListBody(),
      );
}
