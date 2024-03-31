import 'dart:convert';
import 'package:string_capitalize/string_capitalize.dart';
import 'package:intl/intl.dart';
import '../../enums/git_repo/visibility_type.dart';

List<GitRepoSummary> gitRepositorySummaryFromJson(String str) =>
    List<GitRepoSummary>.from(
      json.decode(str).map(
            (x) => GitRepoSummary.fromJson(x),
          ),
    );

String gitRepositorySummaryToJson(List<GitRepoSummary> data) => json.encode(
      List<dynamic>.from(
        data.map((x) => x.toJson()),
      ),
    );

class GitRepoSummary {
  final int? id;
  final String? nodeId;
  final String? name;
  final String? fullName;
  final String? url;
  final String? description;
  final String? language;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? pushedAt;
  final Visibility? visibility;
  final int? stargazersCount;

  GitRepoSummary({
    this.id,
    this.nodeId,
    this.name,
    this.fullName,
    this.url,
    this.description,
    this.language,
    this.createdAt,
    this.updatedAt,
    this.pushedAt,
    this.visibility,
    this.stargazersCount,
  });

  factory GitRepoSummary.fromJson(Map<String, dynamic> json) => GitRepoSummary(
        id: json["id"],
        nodeId: json["node_id"],
        name: json["name"],
        fullName: json["full_name"],
        url: json["url"],
        description: json["description"],
        language: json["language"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        pushedAt: json["pushed_at"] == null
            ? null
            : DateTime.parse(json["pushed_at"]),
        visibility: visibilityValues.map[json["visibility"]]!,
        stargazersCount: json["stargazers_count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "node_id": nodeId,
        "name": name,
        "full_name": fullName,
        "url": url,
        "description": description,
        "language": language,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "pushed_at": pushedAt?.toIso8601String(),
        "visibility": visibilityValues.reverse[visibility],
        "stargazers_count": stargazersCount,
      };

  String getFullName() {
    return fullName != null ? fullName!.capitalize() : "Unknown";
  }

  String getDescription() {
    String desc = description != null ? description! : "...";
    return desc.length > 120 ? '${desc.substring(0, 110)}. Read More...' : desc;
  }

  String getVisibility() {
    return visibility != null ? visibility.toString() : "...";
  }

  String getLanguage() {
    return language != null ? language!.capitalize() : "Unknown";
  }

  String getStargazersCount() {
    return stargazersCount != null ? stargazersCount!.toString() : "0";
  }

  int getStarCount() {
    return stargazersCount != null ? stargazersCount! : 0;
  }

  String getUpdatedAtV1() {
    if (updatedAt == null) {
      return 'Unknown';
    } else {
      final formattedDate = DateFormat('MMM dd, yyyy').format(updatedAt!);
      return 'Updated on $formattedDate';
    }
  }

  String getUpdatedAtV2() {
    if (updatedAt == null) {
      return 'Unknown';
    } else {
      final formattedDate = DateFormat('yyyy-mm-dd').format(updatedAt!);
      return formattedDate;
    }
  }

  String getCreatedAtV2() {
    if (createdAt == null) {
      return 'Unknown';
    } else {
      final formattedDate = DateFormat('yyyy-mm-dd').format(createdAt!);
      return formattedDate;
    }
  }
}
