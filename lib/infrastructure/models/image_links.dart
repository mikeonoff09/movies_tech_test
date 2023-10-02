import 'package:equatable/equatable.dart';
import 'package:movies_tech_test/domain/entities/image_links_entity.dart';

class ImageLinks extends ImageLinksEntity with EquatableMixin {
  ImageLinks({
    required String smallThumbnail,
    required String thumbnail,
  }) : super(
          smallThumbnail: smallThumbnail,
          thumbnail: thumbnail,
        );

  factory ImageLinks.fromJson(Map<String, dynamic> json) => ImageLinks(
        smallThumbnail: json["smallThumbnail"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "smallThumbnail": smallThumbnail,
        "thumbnail": thumbnail,
      };

  @override
  List<Object?> get props => [
        smallThumbnail,
        thumbnail,
      ];
}
