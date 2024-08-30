import 'package:clean_architecture_with_bloc/domain/entities/token_data.dart';
import 'package:clean_architecture_with_bloc/domain/repositories/token_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: TokenRepository)
class TokenRepositoryImpl implements TokenRepository {
  @override
  TokenData getToken() {
    const accesToken =
        'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhMjMzNjBjNjFkNmQ1MmYzMzQxMGQ3ZDEzYWY0ZTE0ZCIsIm5iZiI6MTcyNTAzMjk4NS40NTQxMTksInN1YiI6IjY0OTU3NzkyOTdlYWI0MDBhZTAyODhhNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.AFgwk3X7pIsEodWcs8Q_Kneslz8fKEAI_FlOtJt9w_0';
    const refreshToken = '';

    return TokenData(accessToken: accesToken, refreshToken: refreshToken);
  }
}
