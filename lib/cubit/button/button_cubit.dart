import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'button_state.dart';

class ButtonCubit extends HydratedCubit<ButtonState> {
  ButtonCubit() : super(const ButtonState(disable: true));

  void updateStateButton(ButtonState state) {
    emit(state);
  }

  @override
  ButtonState? fromJson(Map<String, dynamic> json) {
    return null;
  }

  @override
  Map<String, dynamic>? toJson(ButtonState state) {
    return null;
  }
}
