class User{
  String id,notification_token,name,gender,email,password,address;
  double latitude,longitude;int timeStamp;
  bool blocked;

//<editor-fold desc="Data Methods">

  User({
    required this.id,
    required this.notification_token,
    required this.name,
    required this.gender,
    required this.email,
    required this.password,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.timeStamp,
    required this.blocked,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          notification_token == other.notification_token &&
          name == other.name &&
          gender == other.gender &&
          email == other.email &&
          password == other.password &&
          address == other.address &&
          latitude == other.latitude &&
          longitude == other.longitude &&
          timeStamp == other.timeStamp &&
          blocked == other.blocked);

  @override
  int get hashCode =>
      id.hashCode ^
      notification_token.hashCode ^
      name.hashCode ^
      gender.hashCode ^
      email.hashCode ^
      password.hashCode ^
      address.hashCode ^
      latitude.hashCode ^
      longitude.hashCode ^
      timeStamp.hashCode ^
      blocked.hashCode;

  @override
  String toString() {
    return 'User{' +
        ' id: $id,' +
        ' notification_token: $notification_token,' +
        ' name: $name,' +
        ' gender: $gender,' +
        ' email: $email,' +
        ' password: $password,' +
        ' address: $address,' +
        ' latitude: $latitude,' +
        ' longitude: $longitude,' +
        ' timeStamp: $timeStamp,' +
        ' blocked: $blocked,' +
        '}';
  }

  User copyWith({
    String? id,
    String? notification_token,
    String? name,
    String? gender,
    String? email,
    String? password,
    String? address,
    double? latitude,
    double? longitude,
    int? timeStamp,
    bool? blocked,
  }) {
    return User(
      id: id ?? this.id,
      notification_token: notification_token ?? this.notification_token,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      email: email ?? this.email,
      password: password ?? this.password,
      address: address ?? this.address,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      timeStamp: timeStamp ?? this.timeStamp,
      blocked: blocked ?? this.blocked,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'notification_token': this.notification_token,
      'name': this.name,
      'gender': this.gender,
      'email': this.email,
      'password': this.password,
      'address': this.address,
      'latitude': this.latitude,
      'longitude': this.longitude,
      'timeStamp': this.timeStamp,
      'blocked': this.blocked,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      notification_token: map['notification_token'] as String,
      name: map['name'] as String,
      gender: map['gender'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      address: map['address'] as String,
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      timeStamp: map['timeStamp'] as int,
      blocked: map['blocked'] as bool,
    );
  }

//</editor-fold>
}