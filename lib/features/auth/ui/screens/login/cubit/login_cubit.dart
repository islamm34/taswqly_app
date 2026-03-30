import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/utils/resource.dart';
import '../../../../../network/models/request/login_request.dart';
import '../../../../domain/usecase/login_usecase.dart';
import 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginUsecase) : super(LoginState.initial());

  LoginUsecase _loginUsecase;

  void login(String email, String password) async {
    emit(LoginState(Resource.loading()));
    var result = await _loginUsecase(
      LoginRequest(email: email, password: password),
    );
    if (result.isSuccess) {
      emit(LoginState(Resource.success(null)));
    } else {
      // emit(LoginState(Resource.error((result as ErrorApiResult).errors.message)));
      emit(LoginState(Resource.error(result.error.message)));
    }
  }
}
