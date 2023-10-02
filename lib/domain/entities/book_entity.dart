import 'package:movies_tech_test/domain/entities/image_links_entity.dart';
import 'package:movies_tech_test/domain/entities/industry_identifier_entity.dart';

class BookEntity {
  final String title;
  final String? subtitle;
  final List<String> authors;
  final String? publisher;
  final String publishedDate;
  final String description;
  final List<IndustryIdentifierEntity> industryIdentifiers;
  // final int pageCount;
  final String printType;
  final List<String>? categories;
  // final double? averageRating;
  // final int? ratingsCount;
  final String maturityRating;
  final bool allowAnonLogging;
  final String contentVersion;
  final ImageLinksEntity imageLinks;
  final String language;
  final String previewLink;
  final String infoLink;
  final String canonicalVolumeLink;
  final String id;
  final String shelf;

  BookEntity({
    required this.title,
    this.subtitle,
    required this.authors,
    this.publisher,
    required this.publishedDate,
    required this.description,
    required this.industryIdentifiers,
    // required this.pageCount,
    required this.printType,
    this.categories,
    // this.averageRating,
    // this.ratingsCount,
    required this.maturityRating,
    required this.allowAnonLogging,
    required this.contentVersion,
    required this.imageLinks,
    required this.language,
    required this.previewLink,
    required this.infoLink,
    required this.canonicalVolumeLink,
    required this.id,
    required this.shelf,
  });
}
