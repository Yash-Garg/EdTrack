import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'config_state.dart';
part '../../generated/cubits/config/config_cubit.freezed.dart';

@lazySingleton
class ConfigCubit extends Cubit<ConfigState> {
  ConfigCubit() : super(ConfigState.initial());

  started() {}

  reset() {
    emit(ConfigState.initial());
  }
}
