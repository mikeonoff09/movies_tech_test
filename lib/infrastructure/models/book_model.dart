import 'package:equatable/equatable.dart';
import 'package:movies_tech_test/domain/entities/book_entity.dart';
import 'package:movies_tech_test/infrastructure/models/image_links.dart';
import 'package:movies_tech_test/infrastructure/models/industry_identifiers.dart';

class BookModel extends BookEntity with EquatableMixin {
  BookModel({
    required String title,
    required String subtitle,
    required List<String> authors,
    required String publisher,
    required String publishedDate,
    required String description,
    required List<IndustryIdentifier> industryIdentifiers,
    // required int pageCount,
    required String printType,
    required List<String> categories,
    // required double averageRating,
    // required int ratingsCount,
    required String maturityRating,
    required bool allowAnonLogging,
    required String contentVersion,
    required ImageLinks imageLinks,
    required String language,
    required String previewLink,
    required String infoLink,
    required String canonicalVolumeLink,
    required String id,
    required String shelf,
  }) : super(
          title: title,
          subtitle: subtitle,
          authors: authors,
          publisher: publisher,
          publishedDate: publishedDate,
          description: description,
          industryIdentifiers: industryIdentifiers,
          // pageCount: pageCount,
          printType: printType,
          categories: categories,
          // averageRating: averageRating,
          // ratingsCount: ratingsCount,
          maturityRating: maturityRating,
          allowAnonLogging: allowAnonLogging,
          contentVersion: contentVersion,
          imageLinks: imageLinks,
          language: language,
          previewLink: previewLink,
          infoLink: infoLink,
          canonicalVolumeLink: canonicalVolumeLink,
          id: id,
          shelf: shelf,
        );

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        title: json["title"],
        subtitle: json["subtitle"] ?? '',
        authors: json["authors"] != null
            ? List<String>.from(json["authors"].map((x) => x))
            : [],
        publisher: json["publisher"] ?? '',
        publishedDate: json["publishedDate"] ?? '',
        description: json["description"] ?? '',
        industryIdentifiers: json["industryIdentifiers"] != null
            ? List<IndustryIdentifier>.from(
                json["industryIdentifiers"]
                    .map((x) => IndustryIdentifier.fromJson(x)),
              )
            : [],
        // pageCount:
        //     json["pageCount"] != null ? int.parse(json["pageCount"] ?? 0) : 0,
        printType: json["printType"] ?? '',
        categories: json["categories"] != null
            ? List<String>.from(json["categories"].map((x) => x))
            : [],
        // averageRating: json["averageRating"] ?? 0.0,
        // ratingsCount:
        //     json["ratingsCount"] != null ? int.parse(json["ratingsCount"]) : 0,
        maturityRating: json["maturityRating"] ?? '',
        allowAnonLogging: json["allowAnonLogging"] ?? '',
        contentVersion: json["contentVersion"] ?? '',
        imageLinks: json["imageLinks"] != null
            ? ImageLinks.fromJson(json["imageLinks"])
            : ImageLinks(
                smallThumbnail: 'smallThumbnail', thumbnail: 'thumbnail'),
        language: json["language"] ?? '',
        previewLink: json["previewLink"] ?? '',
        infoLink: json["infoLink"] ?? '',
        canonicalVolumeLink: json["canonicalVolumeLink"] ?? '',
        id: json["id"] ?? '',
        shelf: json["shelf"] ?? '',
      );

  @override
  List<Object?> get props => [
        title,
        subtitle,
        authors,
        publisher,
        publishedDate,
        description,
        industryIdentifiers,
        // pageCount,
        printType,
        categories,
        // averageRating,
        // ratingsCount,
        maturityRating,
        allowAnonLogging,
        contentVersion,
        imageLinks,
        language,
        previewLink,
        infoLink,
        canonicalVolumeLink,
        id,
        shelf,
      ];
}
