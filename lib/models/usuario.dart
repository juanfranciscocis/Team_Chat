class UsuarioDb {
  UsuarioDb({
    required this.nombre,
    required this.email,
    required this.online,
    required this.uid,
  });

  String nombre;
  String email;
  bool online;
  String uid;

  factory UsuarioDb.fromJson(Map<String, dynamic> json) => UsuarioDb(
        nombre: json["nombre"],
        email: json["email"],
        online: json["online"],
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "email": email,
        "online": online,
        "uid": uid,
      };
}
