part of 'layout_bloc.dart';

abstract class LayoutState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LayoutInitial extends LayoutState {}

class LayoutLoading extends LayoutState {}

class LayoutLoaded extends LayoutState {
  final LayoutConfigModel configModel;

  LayoutLoaded(this.configModel);

  @override
  List<Object?> get props => [configModel];
}

class LayoutError extends LayoutState {
  final String message;

  LayoutError(this.message);

  @override
  List<Object> get props => [message];
}
