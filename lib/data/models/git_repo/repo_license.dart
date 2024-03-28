import 'dart:convert';

RepoLicense repositoryFromJson(String str) => RepoLicense.fromJson(
      json.decode(str),
    );

String repositoryToJson(RepoLicense data) => json.encode(
      data.toJson(),
    );

class RepoLicense {
  final String key;
  final String name;
  final String spdxId;
  final String url;
  final String nodeId;

  RepoLicense({
    required this.key,
    required this.name,
    required this.spdxId,
    required this.url,
    required this.nodeId,
  });

  factory RepoLicense.fromJson(Map<String, dynamic> json) => RepoLicense(
        key: json["key"],
        name: json["name"],
        spdxId: json["spdx_id"],
        url: json["url"],
        nodeId: json["node_id"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "name": name,
        "spdx_id": spdxId,
        "url": url,
        "node_id": nodeId,
      };
}
