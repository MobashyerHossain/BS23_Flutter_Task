// To parse this JSON data, do
//
//     final gitRepository = gitRepositoryFromJson(jsonString);

import 'dart:convert';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:starflare/data/models/git_repo/repo_owner.dart';

import '../../enums/git_repo/default_branch.dart';
import '../../enums/git_repo/visibility_type.dart';

List<GitRepository> gitRepositoryFromJson(String str) =>
    List<GitRepository>.from(
      json.decode(str).map(
            (x) => GitRepository.fromJson(x),
          ),
    );

String gitRepositoryToJson(List<GitRepository> data) => json.encode(
      List<dynamic>.from(
        data.map((x) => x.toJson()),
      ),
    );

class GitRepository {
  final int? id;
  final String? nodeId;
  final String? name;
  final String? fullName;
  final String? ownerUrl;
  final String? url;
  final String? description;
  final String? languagesUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? pushedAt;
  final int? size;
  final int? stargazersCount;
  final int? watchersCount;
  final String? language;
  final List<String>? topics;
  final Visibility? visibility;
  final int? watchers;
  final DefaultBranch? defaultBranch;
  final double? score;

  GitRepository({
    this.id,
    this.nodeId,
    this.name,
    this.fullName,
    this.ownerUrl,
    this.url,
    this.description,
    this.languagesUrl,
    this.createdAt,
    this.updatedAt,
    this.pushedAt,
    this.size,
    this.stargazersCount,
    this.watchersCount,
    this.language,
    this.topics,
    this.visibility,
    this.watchers,
    this.defaultBranch,
    this.score,
  });

  factory GitRepository.fromJson(Map<String, dynamic> json) => GitRepository(
        id: json["id"],
        nodeId: json["node_id"],
        name: json["name"],
        fullName: json["full_name"],
        ownerUrl: json["owner"] == null
            ? null
            : RepoOwner.fromJson(
                json["owner"],
              ).url,
        url: json["url"],
        description: json["description"],
        languagesUrl: json["languages_url"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        pushedAt: json["pushed_at"] == null
            ? null
            : DateTime.parse(json["pushed_at"]),
        size: json["size"],
        stargazersCount: json["stargazers_count"],
        watchersCount: json["watchers_count"],
        language: json["language"],
        topics: json["topics"] == null
            ? []
            : List<String>.from(
                json["topics"]!.map((x) => x),
              ),
        visibility: visibilityValues.map[json["visibility"]]!,
        watchers: json["watchers"],
        defaultBranch: defaultBranchValues.map[json["default_branch"]]!,
        score: json["score"],
      );

  factory GitRepository.fromDatabase(Map<String, dynamic> json) {
    return GitRepository(
      id: json["id"],
      nodeId: json["node_id"],
      name: json["name"],
      fullName: json["full_name"],
      ownerUrl: json["owner_url"],
      url: json["url"],
      description: json["description"],
      languagesUrl: json["languages_url"],
      createdAt: json["created_at"] == null
          ? null
          : DateTime.parse(json["created_at"]),
      updatedAt: json["updated_at"] == null
          ? null
          : DateTime.parse(json["updated_at"]),
      pushedAt:
          json["pushed_at"] == null ? null : DateTime.parse(json["pushed_at"]),
      size: json["size"],
      stargazersCount: json["stargazers_count"],
      watchersCount: json["watchers_count"],
      language: json["language"],
      topics: json["topics"]
          .substring(1, json["topics"].length - 1)
          .toString()
          .split(", "),
      visibility: visibilityValues.map[json["visibility"]]!,
      watchers: json["watchers"],
      defaultBranch: defaultBranchValues.map[json["default_branch"]]!,
      score: json["score"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "node_id": nodeId,
        "name": name,
        "full_name": fullName,
        "owner_url": ownerUrl,
        "url": url,
        "description": description,
        "languages_url": languagesUrl,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "pushed_at": pushedAt?.toIso8601String(),
        "size": size,
        "stargazers_count": stargazersCount,
        "watchers_count": watchersCount,
        "language": language,
        "topics": topics == null
            ? [].toString()
            : List<dynamic>.from(
                topics!.map(
                  (x) => x,
                ),
              ).toString(),
        "visibility": visibilityValues.reverse[visibility],
        "watchers": watchers,
        "default_branch": defaultBranchValues.reverse[defaultBranch],
        "score": score,
      };

  String getUpdatedAt() {
    if (updatedAt == null) {
      return 'Unknown';
    } else {
      final formattedDate = DateFormat('M-dd-yyyy hh:ss').format(updatedAt!);
      return formattedDate;
    }
  }

  String getCreatedAt() {
    if (createdAt == null) {
      return 'Unknown';
    } else {
      final formattedDate = DateFormat('M-dd-yyyy hh:ss').format(createdAt!);
      return formattedDate;
    }
  }

  String getPushedAt() {
    if (pushedAt == null) {
      return 'Unknown';
    } else {
      final formattedDate = DateFormat('M-dd-yyyy hh:ss').format(pushedAt!);
      return formattedDate;
    }
  }

  String getTopicsString() {
    if (topics != null) {
      return topics!
          .map(
            (e) => e.capitalize,
          )
          .toList()
          .join(', ');
    } else {
      return "Unknown";
    }
  }

  List getTopics() {
    if (topics != null) {
      return topics!
          .map(
            (e) => e.capitalize,
          )
          .toList();
    } else {
      return [];
    }
  }

  String getVisibility() {
    return visibility != null ? visibility.toString() : "Unknown";
  }

  String getDefaultBranch() {
    return defaultBranch != null ? defaultBranch.toString() : "Unknown";
  }

  String getSize() {
    return size != null ? size.toString() : "0";
  }

  String getScore() {
    return score != null ? score.toString() : "0";
  }

  String getStargazersCount() {
    return stargazersCount != null ? stargazersCount.toString() : "0";
  }

  String getWatchersCount() {
    return watchersCount != null ? watchersCount.toString() : "0";
  }

  String getLanguage() {
    return language != null ? language.toString() : "Unknown";
  }
}
