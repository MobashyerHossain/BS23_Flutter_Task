import 'dart:convert';
import 'package:string_capitalize/string_capitalize.dart';
import 'package:intl/intl.dart';
import '../../enums/git_repo/visibility_type.dart';

List<GitRepositorySummary> gitRepositorySummaryFromJson(String str) =>
    List<GitRepositorySummary>.from(
      json.decode(str).map(
            (x) => GitRepositorySummary.fromJson(x),
          ),
    );

String gitRepositorySummaryToJson(List<GitRepositorySummary> data) =>
    json.encode(
      List<dynamic>.from(
        data.map((x) => x.toJson()),
      ),
    );

class GitRepositorySummary {
  final int? id;
  final String? nodeId;
  final String? name;
  final String? fullName;
  final String? htmlUrl;
  final String? url;
  final String? description;
  final String? language;
  final bool? fork;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? pushedAt;
  final Visibility? visibility;
  final int? forks;
  final int? watchers;
  final int? stargazersCount;
  final double? score;

  GitRepositorySummary({
    this.id,
    this.nodeId,
    this.name,
    this.fullName,
    this.htmlUrl,
    this.url,
    this.description,
    this.language,
    this.fork,
    this.createdAt,
    this.updatedAt,
    this.pushedAt,
    this.visibility,
    this.forks,
    this.watchers,
    this.stargazersCount,
    this.score,
  });

  factory GitRepositorySummary.fromJson(Map<String, dynamic> json) =>
      GitRepositorySummary(
        id: json["id"],
        nodeId: json["node_id"],
        name: json["name"],
        fullName: json["full_name"],
        htmlUrl: json["html_url"],
        url: json["url"],
        description: json["description"],
        language: json["language"],
        fork: json["fork"],
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
        forks: json["forks"],
        watchers: json["watchers"],
        stargazersCount: json["stargazers_count"],
        score: json["score"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "node_id": nodeId,
        "name": name,
        "full_name": fullName,
        "html_url": htmlUrl,
        "url": url,
        "description": description,
        "language": language,
        "fork": fork,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "pushed_at": pushedAt?.toIso8601String(),
        "visibility": visibilityValues.reverse[visibility],
        "forks": forks,
        "watchers": watchers,
        "stargazers_count": stargazersCount,
        "score": score,
      };

  String getFullName() {
    return fullName != null ? fullName!.capitalize() : "Unknown";
  }

  String getDescription() {
    return description != null ? description!.trim().capitalize() : "...";
  }

  String getVisibility() {
    return visibility != null ? visibility.toString().split('.').last : "...";
  }

  String getLanguage() {
    return language != null ? language!.capitalize() : "Unknown";
  }

  String getStargazersCount() {
    return stargazersCount != null ? stargazersCount!.toString() : "0";
  }

  String getUpdatedAtV1() {
    if (updatedAt == null) {
      return 'Unknown';
    } else {
      final formattedDate = DateFormat('MMM dd, yyyy').format(updatedAt!);
      return 'Updated on $formattedDate';
    }
  }
}
