import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<Color> {
  ThemeCubit() : super(defaultColor);

  static const defaultColor = Color(0xFF2196F3);

  @override
  Color fromJson(Map<String, dynamic> json) {
    return Color(int.parse(json['color'] as String));
  }

  @override
  Map<String, dynamic> toJson(Color state) {
    return <String, String>{'color': '${state.value}'};
  }
}
