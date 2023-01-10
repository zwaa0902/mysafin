part of 'menu_cubit.dart';

@immutable
class MenuState extends Equatable {
  const MenuState({required this.sfMenuItem});

  final SfMenuItem sfMenuItem;

  @override
  List<Object?> get props => <Object?>[sfMenuItem];
}
