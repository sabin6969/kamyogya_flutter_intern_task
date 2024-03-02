class MembersModel {
  String? id;
  String? image;
  String? name;
  dynamic classification;
  String? email;
  String? phone;
  String? club;

  MembersModel(
      {this.id,
      this.image,
      this.name,
      this.classification,
      this.email,
      this.phone,
      this.club});

  MembersModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    image = json["image"];
    name = json["name"];
    classification = json["classification"];
    email = json["email"];
    phone = json["phone"];
    club = json["club"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["image"] = image;
    data["name"] = name;
    data["classification"] = classification;
    data["email"] = email;
    data["phone"] = phone;
    data["club"] = club;
    return data;
  }
}
