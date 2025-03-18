part of 'layout_bloc.dart';

abstract class LayoutEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadLayoutConfig extends LayoutEvent {
  final Map<String, dynamic> jsonConfig;

  LoadLayoutConfig(this.jsonConfig);

  @override
  List<Object> get props => [jsonConfig];
}
