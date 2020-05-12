class MyIcon {
  String name;
  String link;

  MyIcon({this.name, this.link});

  MyIcon.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['link'] = this.link;
    return data;
  }
}