import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/utils/api_result.dart';
import '../../../../../core/utils/app_errors.dart';
import '../../../../../core/utils/extensions/connectivity_extension.dart';
import '../../../../network/models/request/login_request.dart';
import '../../../../network/models/request/register_request.dart';
import '../../../domain/repositories/auth_repo.dart';
import 'data_sources/auth_remote_data_source.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl extends AuthRepo {
  AuthRemoteDataSource authRemoteDataSource;
  Connectivity connectivity;

  AuthRepoImpl(this.authRemoteDataSource, this.connectivity);

  @override
  Future<ApiResult<void>> login(LoginRequest request) async {
    if (await connectivity.isConnected()) {
      return authRemoteDataSource.login(request);
    } else {
      return ErrorApiResult(NetworkError());
    }
  }

  @override
  Future<ApiResult<void>> register(RegisterRequest request) async {
    if (await connectivity.isConnected()) {
      return authRemoteDataSource.register(request);
    } else {
      return ErrorApiResult(NetworkError());
    }
  }
}
