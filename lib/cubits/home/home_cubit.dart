import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'home_state.dart';
part '../../generated/cubits/home/home_cubit.freezed.dart';

@lazySingleton
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());

  started() {}

  reset() {
    emit(HomeState.initial());
  }
}
