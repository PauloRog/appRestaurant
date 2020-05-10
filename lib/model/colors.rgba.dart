
class ColorsRgba {
  int r;
  int g;
  int b;
  double o;

  ColorsRgba({this.r, this.g, this.b, this.o});

  ColorsRgba.fromJson(Map<String, dynamic> json) {
    r = json['r'];
    g = json['g'];
    b = json['b'];
    o = json['o'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['r'] = this.r;
    data['g'] = this.g;
    data['b'] = this.b;
    data['o'] = this.o;
    return data;
  }
}