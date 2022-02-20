import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'dependency_init.config.dart';


final getIt = GetIt.instance;
@injectableInit
GetIt configureDependencies() => $initGetIt(getIt);

// flutter packages pub run build_runner watch
// flutter packages pub run build_runner build
// flutter packages pub run build_runner clean
// flutter packages pub run build_runner build --delete-conflicting-outputs