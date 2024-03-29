class RepoLicense {
  final String? key;
  final String? name;
  final String? spdxId;
  final String? url;
  final String? nodeId;

  RepoLicense({
    this.key,
    this.name,
    this.spdxId,
    this.url,
    this.nodeId,
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
