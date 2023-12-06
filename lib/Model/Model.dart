import 'dart:convert';

Model modelFromJson(String str) => Model.fromJson(json.decode(str));

String modelToJson(Model data) => json.encode(data.toJson());

class Model {
    String ? label;
    String ? dateTime;
    bool check;
    String ? when;

    Model({
        required this.label,
        required this.dateTime,
        required this.check,
        required this.when,
    });

    factory Model.fromJson(Map<String, dynamic> json) => Model(
        label: json["label"],
        dateTime: json["dateTime"],
        check: json["check"],
        when: json["when"],
    );

    Map<String, dynamic> toJson() => {
        "label": label,
        "dateTime": dateTime,
        "check": check,
        "when": when,
    };
}
