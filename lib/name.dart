class Name {
    String title;
    String first;
    String last;

    Name({
        this.title,
        this.first,
        this.last,
    });

    factory Name.fromJson(Map<String, dynamic> json) => Name(
        title: json["title"] == null ? null : json["title"],
        first: json["first"] == null ? null : json["first"],
        last: json["last"] == null ? null : json["last"],
    );

    Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "first": first == null ? null : first,
        "last": last == null ? null : last,
    };
}