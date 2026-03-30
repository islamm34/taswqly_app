
import '../../../../../../core/utils/resource.dart';

class LoginState {
  late Resource<void> loginApi;

  LoginState(this.loginApi);

  LoginState.initial() {
    loginApi = Resource.initial();
  }
}
