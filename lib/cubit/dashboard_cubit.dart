import 'package:hydrated_bloc/hydrated_bloc.dart';

class DashboardCubit extends HydratedCubit<int> {
  DashboardCubit() : super(0);

  void updateIndex(int index) => emit(index);

  @override
  int? fromJson(Map<String, dynamic> json) {
    return json['tabIndex'] as int?;
  }

  @override
  Map<String, dynamic>? toJson(int state) {
    return <String, int>{'tabIndex': state};
  }
}
