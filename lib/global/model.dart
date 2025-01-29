class GlobalModel{
  String src;
  GlobalModel({required this.src});
}

class GlobalMenuModel{
  String img;
  String text;
  String? subText;

  GlobalMenuModel({
    required this.img,
    required this.text,
    this.subText
  });
}

class SummeryModel{
  String img;
  String text;
  String subText;

  SummeryModel({
    required this.img,
    required this.text,
    required this.subText
  });

}