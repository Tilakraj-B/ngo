import '../../domain/entity/picture.dart';

class PictureModel extends PictureEntity {
  PictureModel({
    String? url,
    String? filename,
  }) : super(url: url, filename: filename);

  // CopyWith method to create a copy of the object with specified fields changed
  PictureModel copyWith({
    String? url,
    String? filename,
  }) {
    return PictureModel(
      url: url ?? this.url,
      filename: filename ?? this.filename,
    );
  }

  // Factory method to create a PictureModel from a JSON Map
  factory PictureModel.fromJson(Map<String, dynamic> json) {
    return PictureModel(
      url: json['url'],
      filename: json['filename'],
    );
  }
}
