part of 'button_cubit.dart';

@immutable
class ButtonState extends Equatable {
  const ButtonState({required this.disable});

  final bool disable;

  @override
  List<Object?> get props => <Object?>[disable];
}
