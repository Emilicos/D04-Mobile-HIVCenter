class Blogpost {
  String title;
  String opening;
  String main;
  String closing;
  String importance;

  Blogpost(
      {required this.title,
      required this.opening,
      required this.main,
      required this.closing,
      required this.importance});

  Map<String, dynamic> toJson() => {
        "importance": importance,
        "title": title,
        "opening": opening,
        "main": main,
        "closing": closing,
      };
}
