import 'dart:convert';

class Quote {
  final String text;
  final String author;

  const Quote({
    required this.text,
    required this.author,
  });

  factory Quote.fromMap(Map<String, dynamic> map) {
    return Quote(
      text: map['text'] ?? '',
      author: map['author'] ?? '',
    );
  }

  factory Quote.fromJson(String source) => Quote.fromMap(json.decode(source));

  @override
  String toString() => 'Quote(text: $text, author: $author)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Quote && other.text == text && other.author == author;
  }

  @override
  int get hashCode => text.hashCode ^ author.hashCode;
}
