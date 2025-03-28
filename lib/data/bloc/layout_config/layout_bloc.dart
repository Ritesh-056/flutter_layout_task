import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/layout_config_model.dart';

part 'layout_event.dart';

part 'layout_state.dart';

class LayoutBloc extends Bloc<LayoutEvent, LayoutState> {
  LayoutBloc() : super(LayoutInitial()) {
    on<LoadLayoutConfig>(_onLoadLayoutConfig);
  }

  //load local config event
  void _onLoadLayoutConfig(
    LoadLayoutConfig event,
    Emitter<LayoutState> emit,
  ) {
    try {
      emit(LayoutLoading());
      final LayoutConfigModel configModel =
          LayoutConfigModel.fromJson(event.jsonConfig);
      emit(LayoutLoaded(configModel));
    } catch (e) {
      emit(LayoutError('Failed to parse layout configuration: $e'));
    }
  }
}
