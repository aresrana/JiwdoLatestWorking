class Verse {
  final String text;

  Verse({
    this.text,
  });

  factory Verse.fromJson(Map<String, dynamic> json) {
    return Verse(
      text: json['text'],
    );
  }
}