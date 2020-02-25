class Dob {
    DateTime date;
    int age;

    Dob({
        this.date,
        this.age,
    });

    factory Dob.fromJson(Map<String, dynamic> json) => Dob(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        age: json["age"] == null ? null : json["age"],
    );

    Map<String, dynamic> toJson() => {
        "date": date == null ? null : date.toIso8601String(),
        "age": age == null ? null : age,
    };
}