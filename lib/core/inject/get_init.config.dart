// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../infrastructure/client/dio_client.dart' as _i754;
import '../../infrastructure/movie_repo/movie_repo.dart' as _i285;
import '../../screens/movie/cubit/movie_cubit_cubit.dart' as _i173;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i173.MovieCubitCubit>(() => _i173.MovieCubitCubit());
    gh.factory<_i285.MovieRepo>(() => _i285.MovieRepo());
    gh.factory<_i754.DioClient>(() => _i754.DioClient());
    return this;
  }
}
