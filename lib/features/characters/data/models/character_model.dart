import 'package:equatable/equatable.dart';

class CharacterModel extends Equatable {
  final int id;
  final String name;
  final String status;
  final String species;
  final String image;
  final List<String> episodeUrls;

  const CharacterModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.image,
    required this.episodeUrls,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    status,
    species,
    image,
    episodeUrls,
  ];

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json["id"] as int,
      name: json["name"] as String,
      status: json["status"] as String,
      species: json["species"] as String,
      image: json["image"] as String,
      episodeUrls: (json["episode"] as List).map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "status": status,
      "species": species,
      "image": image,
      "episode": episodeUrls,
    };
  }
}
