class MyIcons {
  String contact;
  String config;
  String drink;
  String food;
  String home;

  MyIcons({this.contact, this.config, this.drink, this.food, this.home});

  MyIcons.fromJson(Map<String, dynamic> json) {
    contact = json['contact'];
    config = json['config'];
    drink = json['drink'];
    food = json['food'];
    home = json['home'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contact'] = this.contact;
    data['config'] = this.config;
    data['drink'] = this.drink;
    data['food'] = this.food;
    data['home'] = this.home;
    return data;
  }
}