class UserDTO {
  final String id;
  final String userName;
  final String password;

  UserDTO({required this.id, required this.userName, required this.password});

  factory UserDTO.fromJson(Map<String, dynamic> json) => UserDTO(
    id: json["id"],
    userName: json["userName"],
    password: json["password"],
  );
}
