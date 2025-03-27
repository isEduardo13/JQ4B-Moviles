class User{
  final String uid;
  final String name;
  final String email;
  final String photoUrl;

  User({
    required this.uid,
    required this.name,
    required this.email,
    this.photoUrl = '',
  });

  factory User.fromFirebase(dynamic firebaseUser) {
    return User(
      uid: firebaseUser.uid,
      name: firebaseUser.displayName ?? '',
      email: firebaseUser.email ?? '',
      photoUrl: firebaseUser.photoURL ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'photoUrl': photoUrl,
    };
  }
}
