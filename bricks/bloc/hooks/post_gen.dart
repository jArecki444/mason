import 'dart:io';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final progress = context.logger.progress('Code generation in progress...');
  // Run `fvm flutter pub run build_runner build --delete-conflicting-outputs`
  // after generation.
  await Process.run(
    'dart',
    ['run', 'build_runner', 'build', '-d'],
  );

  progress.complete();
}
