import 'dart:convert';

GitUser gitUserFromJson(String str) => GitUser.fromJson(json.decode(str));

String gitUserToJson(GitUser data) => json.encode(data.toJson());

class GitUser {
  final int? id;
  final String? login;
  final String? nodeId;
  final String? url;
  final String? avatarUrl;
  final String? reposUrl;
  final String? type;
  final String? name;
  final int? publicRepos;
  final int? followers;
  final int? following;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  GitUser({
    this.id,
    this.login,
    this.nodeId,
    this.url,
    this.avatarUrl,
    this.reposUrl,
    this.type,
    this.name,
    this.publicRepos,
    this.followers,
    this.following,
    this.createdAt,
    this.updatedAt,
  });

  factory GitUser.fromJson(Map<String, dynamic> json) => GitUser(
        id: json["id"],
        login: json["login"],
        nodeId: json["node_id"],
        url: json["url"],
        avatarUrl: json["avatar_url"],
        reposUrl: json["repos_url"],
        type: json["type"],
        name: json["name"],
        publicRepos: json["public_repos"],
        followers: json["followers"],
        following: json["following"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

      factory GitUser.fromDatabase(Map<String, dynamic> json) => GitUser(
        id: json["id"],
        login: json["login"],
        nodeId: json["node_id"],
        url: json["url"],
        avatarUrl: json["avatar_url"],
        reposUrl: json["repos_url"],
        type: json["type"],
        name: json["name"],
        publicRepos: json["public_repos"],
        followers: json["followers"],
        following: json["following"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "login": login,
        "node_id": nodeId,
        "url": url,
        "avatar_url": avatarUrl,
        "repos_url": reposUrl,
        "type": type,
        "name": name,
        "public_repos": publicRepos,
        "followers": followers,
        "following": following,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };

  String getName() {
    return name ?? "Unknown";
  }

  String getType() {
    return type ?? "Unknown";
  }

  String getPublicRepos() {
    if (publicRepos == null) {
      return "0";
    } else {
      return publicRepos.toString();
    }
  }

  String getFollowers() {
    if (followers == null) {
      return "0";
    } else {
      return followers.toString();
    }
  }

  String getFollowing() {
    if (following == null) {
      return "0";
    } else {
      return following.toString();
    }
  }
}
