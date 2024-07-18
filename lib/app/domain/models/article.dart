class Article {
  final String title;
  final String author;
  final String content;
  final String? id;
  final String? date;

  Article({
    required this.title,
    required this.author,
    required this.content,
    this.id,
    this.date,
  });
}
