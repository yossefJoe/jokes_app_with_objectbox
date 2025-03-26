class CategoriesModel {
  bool? error;
  List<String>? categories;
  List<CategoryAliases>? categoryAliases;
  int? timestamp;

  CategoriesModel(
      {this.error, this.categories, this.categoryAliases, this.timestamp});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    categories = json['categories'].cast<String>();
    if (json['categoryAliases'] != null) {
      categoryAliases = <CategoryAliases>[];
      json['categoryAliases'].forEach((v) {
        categoryAliases!.add(new CategoryAliases.fromJson(v));
      });
    }
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['categories'] = this.categories;
    if (this.categoryAliases != null) {
      data['categoryAliases'] =
          this.categoryAliases!.map((v) => v.toJson()).toList();
    }
    data['timestamp'] = this.timestamp;
    return data;
  }
}

class CategoryAliases {
  String? alias;
  String? resolved;

  CategoryAliases({this.alias, this.resolved});

  CategoryAliases.fromJson(Map<String, dynamic> json) {
    alias = json['alias'];
    resolved = json['resolved'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['alias'] = this.alias;
    data['resolved'] = this.resolved;
    return data;
  }
}