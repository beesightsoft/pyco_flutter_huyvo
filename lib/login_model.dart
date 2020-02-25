class Login {
    String uuid;
    String username;
    String password;
    String salt;
    String md5;
    String sha1;
    String sha256;

    Login({
        this.uuid,
        this.username,
        this.password,
        this.salt,
        this.md5,
        this.sha1,
        this.sha256,
    });

    factory Login.fromJson(Map<String, dynamic> json) => Login(
        uuid: json["uuid"] == null ? null : json["uuid"],
        username: json["username"] == null ? null : json["username"],
        password: json["password"] == null ? null : json["password"],
        salt: json["salt"] == null ? null : json["salt"],
        md5: json["md5"] == null ? null : json["md5"],
        sha1: json["sha1"] == null ? null : json["sha1"],
        sha256: json["sha256"] == null ? null : json["sha256"],
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid == null ? null : uuid,
        "username": username == null ? null : username,
        "password": password == null ? null : password,
        "salt": salt == null ? null : salt,
        "md5": md5 == null ? null : md5,
        "sha1": sha1 == null ? null : sha1,
        "sha256": sha256 == null ? null : sha256,
    };
}