class UserLibraryModel {
  final int id;
  final String name;
  final String description;
  final String address;
  final String coverImage;
  final String establishedDate;
  final bool isActive;
  final String libraryId;
  final int librarian;

  UserLibraryModel({
    required this.id,
    required this.name,
    required this.description,
    required this.address,
    required this.coverImage,
    required this.establishedDate,
    required this.isActive,
    required this.libraryId,
    required this.librarian,
  });

  // JSON থেকে মডেল তৈরি
  factory UserLibraryModel.fromJson(Map<String, dynamic> json) {
    return UserLibraryModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      address: json['address'] ?? '',
      coverImage: json['cover_image'] ?? '',
      establishedDate: json['established_date'] ?? '',
      isActive: json['is_active'] ?? false,
      libraryId: json['library_id'] ?? '',
      librarian: json['librarian'] ?? 0,
    );
  }

  // মডেল থেকে JSON তৈরি
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'address': address,
      'cover_image': coverImage,
      'established_date': establishedDate,
      'is_active': isActive,
      'library_id': libraryId,
      'librarian': librarian,
    };
  }
}
