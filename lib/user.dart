import 'package:fluttertest/dob.dart';
import 'package:fluttertest/location.dart';
import 'package:fluttertest/login_model.dart';
import 'package:fluttertest/name.dart';
import 'package:fluttertest/picture.dart';

class User {
    String gender;
    Name name;
    Location location;
    String email;
    Login login;
    Dob dob;
    Dob registered;
    String phone;
    String cell;
    Picture picture;
    String nat;

    User({
        this.gender,
        this.name,
        this.location,
        this.email,
        this.login,
        this.dob,
        this.registered,
        this.phone,
        this.cell,
        this.picture,
        this.nat,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        gender: json["gender"] == null ? null : json["gender"],
        name: json["name"] == null ? null : Name.fromJson(json["name"]),
        location: json["location"] == null ? null : Location.fromJson(json["location"]),
        email: json["email"] == null ? null : json["email"],
        login: json["login"] == null ? null : Login.fromJson(json["login"]),
        dob: json["dob"] == null ? null : Dob.fromJson(json["dob"]),
        registered: json["registered"] == null ? null : Dob.fromJson(json["registered"]),
        phone: json["phone"] == null ? null : json["phone"],
        cell: json["cell"] == null ? null : json["cell"],
        picture: json["picture"] == null ? null : Picture.fromJson(json["picture"]),
        nat: json["nat"] == null ? null : json["nat"],
    );

    Map<String, dynamic> toJson() => {
        "gender": gender == null ? null : gender,
        "name": name == null ? null : name.toJson(),
        "location": location == null ? null : location.toJson(),
        "email": email == null ? null : email,
        "login": login == null ? null : login.toJson(),
        "dob": dob == null ? null : dob.toJson(),
        "registered": registered == null ? null : registered.toJson(),
        "phone": phone == null ? null : phone,
        "cell": cell == null ? null : cell,
        "picture": picture == null ? null : picture.toJson(),
        "nat": nat == null ? null : nat,
    };
}