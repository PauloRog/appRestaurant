import 'colors.rgba.dart';

class Social {
  Network instagram;
  Network whatsapp;
  Network facebook;
  Network twitter;
  Network phone;
  Network maps;
  ColorsRgba colorText;

  Social({
    this.facebook,
    this.instagram,
    this.maps,
    this.phone,
    this.twitter,
    this.whatsapp,
    this.colorText,
  });

  Social.fromJson(Map<String, dynamic> json) {
    facebook = json['facebook'] != null
        ? new Network.fromJson(json['facebook'])
        : null;
    instagram = json['instagram'] != null
        ? new Network.fromJson(json['instagram'])
        : null;
    maps = json['maps'] != null ? new Network.fromJson(json['maps']) : null;
    phone = json['phone'] != null ? new Network.fromJson(json['phone']) : null;
    twitter =
        json['twitter'] != null ? new Network.fromJson(json['twitter']) : null;
    whatsapp =
        json['maps'] != null ? new Network.fromJson(json['whatsapp']) : null;
    colorText = json['colorText'] != null
        ? new ColorsRgba.fromJson(json['colorText'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.facebook != null) {
      data['facebook'] = this.facebook.toJson();
    }
    if (this.instagram != null) {
      data['instagram'] = this.instagram.toJson();
    }
    if (this.maps != null) {
      data['maps'] = this.maps.toJson();
    }
    if (this.phone != null) {
      data['phone'] = this.phone.toJson();
    }
    if (this.twitter != null) {
      data['twitter'] = this.twitter.toJson();
    }
    if (this.whatsapp != null) {
      data['whatsapp'] = this.whatsapp.toJson();
    }
    if (this.colorText != null) {
      data['colorText'] = this.colorText.toJson();
    }
    return data;
  }
}

class Network {
  String icon;
  String link;
  String name;

  Network({this.icon, this.link, this.name});

  Network.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    link = json['link'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['link'] = this.link;
    data['name'] = this.name;

    return data;
  }
}
