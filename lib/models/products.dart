class Products {
  String image;
  String title;
  String description;
  double price;
  bool isfood;
  bool restaurant;
  bool pub;

  Products({this.title, this.description, this.price});

  Products.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['price'] = this.price;
    return data;
  }
}
