class BookModel {
  final int id;
  final String title;
  final String author;
  final String summary;
  final String tag;
  final String language;
  final int pages;
  final String publishedDate;
  final String? isbn;
  final String coverImage;
  final int availableCopies;
  final bool isAvailable;
  final int library;

  BookModel({
    required this.id,
    required this.title,
    required this.author,
    required this.summary,
    required this.tag,
    required this.language,
    required this.pages,
    required this.publishedDate,
    this.isbn,
    required this.coverImage,
    required this.availableCopies,
    required this.isAvailable,
    required this.library,
  });

  // JSON থেকে model তৈরি
  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      author: json['author'] ?? '',
      summary: json['summary'] ?? '',
      tag: json['tag'] ?? '',
      language: json['language'] ?? '',
      pages: json['pages'] ?? 0,
      publishedDate: json['published_date'] ?? '',
      isbn: json['isbn'], // nullable
      coverImage: json['cover_image'] ?? '',
      availableCopies: json['available_copies'] ?? 0,
      isAvailable: json['is_available'] ?? false,
      library: json['library'] ?? 0,
    );
  }

  // Model থেকে JSON তৈরি
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'summary': summary,
      'tag': tag,
      'language': language,
      'pages': pages,
      'published_date': publishedDate,
      'isbn': isbn,
      'cover_image': coverImage,
      'available_copies': availableCopies,
      'is_available': isAvailable,
      'library': library,
    };
  }
}
