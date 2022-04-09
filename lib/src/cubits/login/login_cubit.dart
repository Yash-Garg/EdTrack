import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'login_state.dart';
part '../../../generated/src/cubits/login/login_cubit.freezed.dart';

@lazySingleton
class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.initial());

  started() {}

  reset() {
    emit(LoginState.initial());
  }
}
