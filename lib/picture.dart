class Picture {
    String large;
    String medium;
    String thumbnail;

    Picture({
        this.large,
        this.medium,
        this.thumbnail,
    });

    factory Picture.fromJson(Map<String, dynamic> json) => Picture(
        large: json["large"] == null ? null : json["large"],
        medium: json["medium"] == null ? null : json["medium"],
        thumbnail: json["thumbnail"] == null ? null : json["thumbnail"],
    );

    Map<String, dynamic> toJson() => {
        "large": large == null ? null : large,
        "medium": medium == null ? null : medium,
        "thumbnail": thumbnail == null ? null : thumbnail,
    };
}