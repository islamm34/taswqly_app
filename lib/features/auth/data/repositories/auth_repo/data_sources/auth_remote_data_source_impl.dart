import 'package:injectable/injectable.dart';
import '../../../../../../core/utils/api_result.dart';
import '../../../../../../core/utils/app_errors.dart';
import '../../../../../../core/utils/shared_prefs_utils.dart';
import '../../../../../network/api_client/api_client.dart';
import '../../../../../network/models/request/login_request.dart';
import '../../../../../network/models/request/register_request.dart';
import '../../../../../network/models/response/auth_response.dart';
import 'auth_remote_data_source.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final ApiClient _apiClient;
  final SharedPrefsUtils _sharedPrefsUtils;

  AuthRemoteDataSourceImpl(this._apiClient, this._sharedPrefsUtils);

  @override
  Future<ApiResult<AuthResponse>> login(LoginRequest request) async {
    try {
      var response = await _apiClient.login(request);
      if (response.data.token != null && response.data.user != null) {
        _sharedPrefsUtils.saveUser(response.data.user!);
        _sharedPrefsUtils.saveToken(response.data.token!);
      }

      return SuccessApiResult(response.data);
    } catch (e) {
      return ErrorApiResult(UnknownErrors());
    }
  }


  @override
  Future<ApiResult<AuthResponse>> register(RegisterRequest request) async {
    try {
      var response = await _apiClient.register(request);
      if (response.data.token != null && response.data.user != null) {
        _sharedPrefsUtils.saveUser(response.data.user!);
        _sharedPrefsUtils.saveToken(response.data.token!);
      }
      return SuccessApiResult(response.data);
    } catch (e) {
      return ErrorApiResult(UnknownErrors());
    }
  }
}
