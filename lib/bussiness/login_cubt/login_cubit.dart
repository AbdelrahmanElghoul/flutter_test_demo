import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_flutter/data/model/user.dart';
import 'package:test_flutter/data/repo_interface.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final IRepository? _repo;

  LoginCubit([this._repo]) : super(LoginInitialState());

  void login({required String? email, required String? password}) async {
    emit(LoginLoadingState());
    try {
      final response = await _repo?.login(email: email, password: password);

      emit(LoginSuccessState(response));
    } catch (e) {
      emit(LoginErrorState(e));
    }
  }
}
