import 'package:equatable/equatable.dart';
import 'package:movies_tech_test/domain/entities/industry_identifier_entity.dart';

class IndustryIdentifier extends IndustryIdentifierEntity with EquatableMixin {
  IndustryIdentifier({
    required String type,
    required String identifier,
  }) : super(
          type: type,
          identifier: identifier,
        );

  factory IndustryIdentifier.fromJson(Map<String, dynamic> json) =>
      IndustryIdentifier(
        type: json["type"],
        identifier: json["identifier"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "identifier": identifier,
      };

  @override
  List<Object?> get props => [
        type,
        identifier,
      ];
}
