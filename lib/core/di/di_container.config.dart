// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:clean_architecture_with_bloc/core/dio/dio_module.dart' as _i241;
import 'package:clean_architecture_with_bloc/data/remote/movie_api.dart'
    as _i651;
import 'package:clean_architecture_with_bloc/data/repositories/movie_repository_impl.dart'
    as _i174;
import 'package:clean_architecture_with_bloc/data/repositories/token_repository_impl.dart'
    as _i453;
import 'package:clean_architecture_with_bloc/domain/repositories/movie_repository.dart'
    as _i889;
import 'package:clean_architecture_with_bloc/domain/repositories/token_repository.dart'
    as _i447;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

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
    final dioModule = _$DioModule();
    gh.singleton<_i361.Dio>(
      () => dioModule.getUnAuthorizedDioClient(),
      instanceName: 'UnAuthorized',
    );
    gh.singleton<_i447.TokenRepository>(() => _i453.TokenRepositoryImpl());
    gh.singleton<_i361.Dio>(
        () => dioModule.getAuthorizedDioClient(gh<_i447.TokenRepository>()));
    gh.singleton<_i651.MovieApi>(() => _i651.MovieApi(gh<_i361.Dio>()));
    gh.singleton<_i889.MovieRepository>(
        () => _i174.MovieRepositoryImpl(gh<_i651.MovieApi>()));
    return this;
  }
}

class _$DioModule extends _i241.DioModule {}
