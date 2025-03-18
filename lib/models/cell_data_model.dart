class CellDataModel {
  final String type;
  final String ext;
  final String value;

  CellDataModel({
    required this.type,
    required this.ext,
    required this.value,
  });

  factory CellDataModel.fromJson(Map<String, dynamic> json) {
    return CellDataModel(
      type: json['type'],
      ext: json['ext'],
      value: json['value'],
    );
  }
}
