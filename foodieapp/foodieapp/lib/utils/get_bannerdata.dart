

class banner_Data {
  late String desc;
  late String pic;
  late String foodcolour;
  late String foodcolourbg;

  banner_Data(this.desc, this.pic, this.foodcolour, this.foodcolourbg);
  // ignore: empty_constructor_bodies
  banner_Data.fromJson(Map<String, dynamic> json) {
    desc = json['desc'];
    pic = json['pic'];
    foodcolour = (json['foodcolour']);
    foodcolourbg = (json['foodcolourbg']);
  }
}
