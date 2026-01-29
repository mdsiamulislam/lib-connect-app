class LoginUserModel {
  User? user;
  String? refresh;
  String? access;

  LoginUserModel({this.user, this.refresh, this.access});

  LoginUserModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    refresh = json['refresh'];
    access = json['access'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['refresh'] = refresh;
    data['access'] = access;
    return data;
  }
}


class User {
  int? id;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  bool? isActive;
  String? dateJoined;
  String? bio;
  String? profilePicture;

  User(
      {this.id,
        this.username,
        this.firstName,
        this.lastName,
        this.email,
        this.isActive,
        this.dateJoined,
        this.bio,
        this.profilePicture});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    isActive = json['is_active'];
    dateJoined = json['date_joined'];
    bio = json['bio'];
    profilePicture = json['profile_picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['is_active'] = this.isActive;
    data['date_joined'] = this.dateJoined;
    data['bio'] = this.bio;
    data['profile_picture'] = this.profilePicture;
    return data;
  }
}