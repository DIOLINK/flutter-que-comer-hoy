class UserProfile {
  final String uid;
  final String name;
  final String email;
  final String photoUrl;

  UserProfile({
    required this.uid,
    required this.name,
    required this.email,
    required this.photoUrl,
  });

  //copyWith method
  UserProfile copyWith({
    String? uid,
    String? name,
    String? email,
    String? photoUrl,
  }) {
    return UserProfile(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }

  //fromMap method
  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      photoUrl: map['photoUrl'] ?? '',
    );
  }

  //toMap method
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'photoUrl': photoUrl,
    };
  }
}

// Mock user profile data
final mockUserProfile = UserProfile(
  uid: '12345',
  name: 'John Doe',
  email: 'john.doe@example.com',
  photoUrl: '', // Empty for now, as we are not using the asset yet
);
