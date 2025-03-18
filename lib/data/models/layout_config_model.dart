import 'cell_data_model.dart';

class LayoutConfigModel {
  final String type;
  final int flex;
  final CellDataModel? data;
  final List<LayoutConfigModel>? children;

  LayoutConfigModel({
    required this.type,
    required this.flex,
    this.data,
    this.children,
  });

  factory LayoutConfigModel.fromJson(Map<String, dynamic> json) {
    return LayoutConfigModel(
      type: json['type'],
      flex: json['flex'],
      data: json['data'] != null ? CellDataModel.fromJson(json['data']) : null,
      children: json['children'] != null
          ? List<LayoutConfigModel>.from(
              json['children'].map((x) => LayoutConfigModel.fromJson(x)))
          : null,
    );
  }
}
