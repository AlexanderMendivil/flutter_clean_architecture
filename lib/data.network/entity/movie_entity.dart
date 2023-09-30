// To parse this JSON data, do
//
//     final upcomingMovies = upcomingMoviesFromJson(jsonString);

import 'dart:convert';

UpcomingMovies upcomingMoviesFromJson(String str) => UpcomingMovies.fromJson(json.decode(str));

String upcomingMoviesToJson(UpcomingMovies data) => json.encode(data.toJson());

class UpcomingMovies {
    List<MovieEntity> MovieEntitys;

    UpcomingMovies({
        required this.MovieEntitys,
    });

    factory UpcomingMovies.fromJson(Map<String, dynamic> json) => UpcomingMovies(
        MovieEntitys: List<MovieEntity>.from(json["MovieEntitys"].map((x) => MovieEntity.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "MovieEntitys": List<dynamic>.from(MovieEntitys.map((x) => x.toJson())),
    };
}

class MovieEntity {
    String id;
    String MovieEntityId;
    PrimaryImage? primaryImage;
    TitleType titleType;
    TitleText titleText;
    TitleText originalTitleText;
    ReleaseYear releaseYear;
    ReleaseDate releaseDate;

    MovieEntity({
        required this.id,
        required this.MovieEntityId,
        required this.primaryImage,
        required this.titleType,
        required this.titleText,
        required this.originalTitleText,
        required this.releaseYear,
        required this.releaseDate,
    });

    factory MovieEntity.fromJson(Map<String, dynamic> json) => MovieEntity(
        id: json["_id"],
        MovieEntityId: json["id"],
        primaryImage: json["primaryImage"] == null ? null : PrimaryImage.fromJson(json["primaryImage"]),
        titleType: TitleType.fromJson(json["titleType"]),
        titleText: TitleText.fromJson(json["titleText"]),
        originalTitleText: TitleText.fromJson(json["originalTitleText"]),
        releaseYear: ReleaseYear.fromJson(json["releaseYear"]),
        releaseDate: ReleaseDate.fromJson(json["releaseDate"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "id": MovieEntityId,
        "primaryImage": primaryImage?.toJson(),
        "titleType": titleType.toJson(),
        "titleText": titleText.toJson(),
        "originalTitleText": originalTitleText.toJson(),
        "releaseYear": releaseYear.toJson(),
        "releaseDate": releaseDate.toJson(),
    };
}

class TitleText {
    String text;
    OriginalTitleTextTypename typename;

    TitleText({
        required this.text,
        required this.typename,
    });

    factory TitleText.fromJson(Map<String, dynamic> json) => TitleText(
        text: json["text"],
        typename: originalTitleTextTypenameValues.map[json["__typename"]]!,
    );

    Map<String, dynamic> toJson() => {
        "text": text,
        "__typename": originalTitleTextTypenameValues.reverse[typename],
    };
}

enum OriginalTitleTextTypename {
    TITLE_TEXT
}

final originalTitleTextTypenameValues = EnumValues({
    "TitleText": OriginalTitleTextTypename.TITLE_TEXT
});

class PrimaryImage {
    String id;
    int width;
    int height;
    String url;
    Caption caption;

    PrimaryImage({
        required this.id,
        required this.width,
        required this.height,
        required this.url,
        required this.caption,
    });

    factory PrimaryImage.fromJson(Map<String, dynamic> json) => PrimaryImage(
        id: json["id"],
        width: json["width"],
        height: json["height"],
        url: json["url"],
        caption: Caption.fromJson(json["caption"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "width": width,
        "height": height,
        "url": url,
        "caption": caption.toJson(),
    };
}

class Caption {
    String plainText;

    Caption({
        required this.plainText,
    });

    factory Caption.fromJson(Map<String, dynamic> json) => Caption(
        plainText: json["plainText"],
    );

    Map<String, dynamic> toJson() => {
        "plainText": plainText,
    };
}

enum CaptionTypename {
    MARKDOWN
}

final captionTypenameValues = EnumValues({
    "Markdown": CaptionTypename.MARKDOWN
});

class ReleaseDate {
    int day;
    int month;
    int year;

    ReleaseDate({
        required this.day,
        required this.month,
        required this.year,
    });

    factory ReleaseDate.fromJson(Map<String, dynamic> json) => ReleaseDate(
        day: json["day"],
        month: json["month"],
        year: json["year"],
    );

    Map<String, dynamic> toJson() => {
        "day": day,
        "month": month,
        "year": year,
    };
} 

class ReleaseYear {
    int year;
    dynamic endYear;

    ReleaseYear({
        required this.year,
        required this.endYear,
    });

    factory ReleaseYear.fromJson(Map<String, dynamic> json) => ReleaseYear(
        year: json["year"],
        endYear: json["endYear"],
    );

    Map<String, dynamic> toJson() => {
        "year": year,
        "endYear": endYear,
    };
}


class TitleType {
    DisplayableProperty? displayableProperty;
    String text;
    String id;
    bool isSeries;
    bool isEpisode;
    List<Category>? categories;
    bool? canHaveEpisodes;

    TitleType({
        this.displayableProperty,
        required this.text,
        required this.id,
        required this.isSeries,
        required this.isEpisode,
        this.categories,
        this.canHaveEpisodes,
    });

    factory TitleType.fromJson(Map<String, dynamic> json) => TitleType(
        displayableProperty: json["displayableProperty"] == null ? null : DisplayableProperty.fromJson(json["displayableProperty"]),
        text: json["text"],
        id: json["id"],
        isSeries: json["isSeries"],
        isEpisode: json["isEpisode"],
        categories: json["categories"] == null ? [] : List<Category>.from(json["categories"]!.map((x) => Category.fromJson(x))),
        canHaveEpisodes: json["canHaveEpisodes"],
    );

    Map<String, dynamic> toJson() => {
        "displayableProperty": displayableProperty?.toJson(),
        "text": text,
        "id": id,
        "isSeries": isSeries,
        "isEpisode": isEpisode,
        "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x.toJson())),
        "canHaveEpisodes": canHaveEpisodes,
    };
}

class Category {
    String value;

    Category({
        required this.value,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "value": value,
    };
}

class DisplayableProperty {
    Caption value;
    String typename;

    DisplayableProperty({
        required this.value,
        required this.typename,
    });

    factory DisplayableProperty.fromJson(Map<String, dynamic> json) => DisplayableProperty(
        value: Caption.fromJson(json["value"]),
        typename: json["__typename"],
    );

    Map<String, dynamic> toJson() => {
        "value": value.toJson(),
        "__typename": typename,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
