class Recipe {
  String? description;
  double? fullPrice;
  String? image;
  List<String>? ingredients;
  String? kindOfRecipe;
  String? name;

  Recipe(
      {this.description,
      this.fullPrice,
      this.image,
      this.ingredients,
      this.kindOfRecipe,
      this.name});

  Recipe.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    fullPrice = json['full_price'];
    image = json['image'];
    ingredients = json['ingredients'].cast<String>();
    kindOfRecipe = json['kind_of_recipe'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['full_price'] = this.fullPrice;
    data['image'] = this.image;
    data['ingredients'] = this.ingredients;
    data['kind_of_recipe'] = this.kindOfRecipe;
    data['name'] = this.name;
    return data;
  }
}