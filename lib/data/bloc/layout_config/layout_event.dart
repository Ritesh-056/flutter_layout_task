part of 'layout_bloc.dart';

abstract class LayoutEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadLayoutConfig extends LayoutEvent {
  final String jsonConfig;

  LoadLayoutConfig(this.jsonConfig);

  @override
  List<Object> get props => [jsonConfig];
}
