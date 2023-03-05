import 'dart:convert';

import 'package:flutter/foundation.dart';
@immutable
class RepoModel {
  final int id;
  final String name;
  final String description;
  final String language;
  final int languageColor;
  final String htmlUrl;
  final String license;
  final int forks;
  final int watchers;
  final String mdLink;
  final int stars;
  const RepoModel({
    required this.id,
    required this.name,
    required this.description,
    required this.language,
    required this.languageColor,
    required this.htmlUrl,
    required this.license,
    required this.forks,
    required this.watchers,
    required this.stars,
    required this.mdLink,
  });

  factory RepoModel.fromMap(Map<String, dynamic> map) {
    return RepoModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      language: map['language'] ?? 'none',
      languageColor: 0xffffff,
      htmlUrl: map['html_url'] ?? '',
      license: map['license'] != null ? map['license']['key'] ?? 'none' : 'none',
      forks: map['forks_count']?.toInt() ?? 0,
      watchers: map['watchers_count']?.toInt() ?? 0,
      mdLink: '',
      stars: map['stargazers_count']?.toInt() ?? 0,
    );
  }


  factory RepoModel.fromJson(String source) => RepoModel.fromMap(json.decode(source));

  RepoModel copyWith({
    int? id,
    String? name,
    String? description,
    String? language,
    int? languageColor,
    String? htmlUrl,
    String? license,
    int? forks,
    int? watchers,
    String? mdLink,
    int? stars,
  }) {
    return RepoModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      language: language ?? this.language,
      languageColor: languageColor ?? this.languageColor,
      htmlUrl: htmlUrl ?? this.htmlUrl,
      license: license ?? this.license,
      forks: forks ?? this.forks,
      watchers: watchers ?? this.watchers,
      mdLink: mdLink ?? this.mdLink,
      stars: stars ?? this.stars,
    );
  }
}
