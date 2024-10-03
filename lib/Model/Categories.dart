
class foodItem {
    String? description;
    String? image;
    String? name;

    foodItem({this.description, this.image, this.name});

    foodItem.fromJson(Map<String, dynamic> json) {
        description = json["description"];
        image = json["image"];
        name = json["name"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["description"] = description;
        _data["image"] = image;
        _data["name"] = name;
        return _data;
    }
}