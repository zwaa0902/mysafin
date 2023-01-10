import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../data/models/menu_item.dart';
import '../../ui/screens/menu/menu_screen.dart';

part 'menu_state.dart';

class MenuCubit extends HydratedCubit<MenuState> {
  MenuCubit() : super(const MenuState(sfMenuItem: MenuItems.dashboard));

  void updateMenuItem(MenuState state) {
    emit(state);
  }

  @override
  MenuState? fromJson(Map<String, dynamic> json) {
    return null;
  }

  @override
  Map<String, String>? toJson(MenuState state) {
    return null;
  }
}
