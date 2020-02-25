class Location {
    Street street;
    String city;
    String state;
    String country;
    Coordinates coordinates;

    Location({
        this.street,
        this.city,
        this.state,
        this.country,
        this.coordinates,
    });

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        street: json["street"] == null ? null : Street.fromJson(json["street"]),
        city: json["city"] == null ? null : json["city"],
        state: json["state"] == null ? null : json["state"],
        country: json["country"] == null ? null : json["country"],
        coordinates: json["coordinates"] == null ? null : Coordinates.fromJson(json["coordinates"]),
    );

    Map<String, dynamic> toJson() => {
        "street": street == null ? null : street.toJson(),
        "city": city == null ? null : city,
        "state": state == null ? null : state,
        "country": country == null ? null : country,
        "coordinates": coordinates == null ? null : coordinates.toJson(),
    };
}

class Coordinates {
    String latitude;
    String longitude;

    Coordinates({
        this.latitude,
        this.longitude,
    });

    factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        latitude: json["latitude"] == null ? null : json["latitude"],
        longitude: json["longitude"] == null ? null : json["longitude"],
    );

    Map<String, dynamic> toJson() => {
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
    };
}

class Street {
    int number;
    String name;

    Street({
        this.number,
        this.name,
    });

    factory Street.fromJson(Map<String, dynamic> json) => Street(
        number: json["number"] == null ? null : json["number"],
        name: json["name"] == null ? null : json["name"],
    );

    Map<String, dynamic> toJson() => {
        "number": number == null ? null : number,
        "name": name == null ? null : name,
    };
}