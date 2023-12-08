import 'dart:convert';

Model modelFromJson(String str) => Model.fromJson(json.decode(str));

String modelToJson(Model data) => json.encode(data.toJson());

class Model {
    String ? label;
    String ? dateTime;
    bool check;
    String ? when;
    int ? id;
    int ? milliseconds;


    Model({
        required this.label,
        required this.dateTime,
        required this.check,
        required this.when,
        required this.id,
        required this.milliseconds
    });

    factory Model.fromJson(Map<String, dynamic> json) => Model(
        label: json["label"],
        dateTime: json["dateTime"],
        check: json["check"],
        when: json["when"],
        id:json["id"],
        milliseconds:json["milliseconds"],
    );

    Map<String, dynamic> toJson() => {
        "label": label,
        "dateTime": dateTime,
        "check": check,
        "when": when,
        "id":id,
        "milliseconds":milliseconds,
    };
}
