import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:movie_index/core/di/di_config.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => getIt.init();
