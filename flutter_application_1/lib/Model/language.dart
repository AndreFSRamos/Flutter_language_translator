// ignore_for_file: non_constant_identifier_names

class Languages {
  String created_at;
  String updated_at;
  String resource_id;
  String module_id;
  String value;
  String language_id;

  Languages(this.created_at, this.updated_at, this.resource_id, this.module_id,
      this.value, this.language_id);

  factory Languages.fromJson(Map<String, dynamic> json) {
    return Languages(
      json['resource']['created_at'],
      json['resource']['updated_at'],
      json['resource']['resource_id'],
      json['resource']['module_id'],
      json['resource']['value'],
      json['resource']['language_id'],
    );
  }
  Map<String, dynamic> toJson() => {
        "created_at": created_at,
        "updated_at": updated_at,
        "resource_id": resource_id,
        "cmodule_id": module_id,
        "value": value,
        "language_id": language_id
      };
}
