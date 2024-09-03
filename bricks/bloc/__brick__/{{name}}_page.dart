import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/{{name}}_bloc.dart';
import '{{name}}_body.dart';

class {{name.pascalCase()}}Page extends StatelessWidget {

  const {{name.pascalCase()}}Page({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => inject<{{name.pascalCase()}}Bloc>()
          ..add(
            const {{name.pascalCase()}}Event.enteredPage(),
          ),
        child: const {{name.pascalCase()}}Body(),
      );
}
