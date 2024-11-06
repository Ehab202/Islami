// ignore: file_names
class RadioResponce {
  String?massage;
  RadioResponce({this.massage,
      List<Radios>? radios,}){
    _radios = radios;
}

  RadioResponce.fromJson(dynamic json) {
    massage=json["massage"];
    if (json['radios'] != null) {
      _radios = [];
      json['radios'].forEach((v) {
        _radios?.add(Radios.fromJson(v));

      });
    }
  }
  List<Radios>? _radios;
RadioResponce copyWith({  List<Radios>? radios,
}) => RadioResponce(  radios: radios ?? _radios,
);
  List<Radios>? get radios => _radios;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_radios != null) {
      map['radios'] = _radios?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Radios {
  Radios({
      int? id, 
      String? name, 
      String? url,}){
    _id = id;
    _name = name;
    _url = url;
}

  Radios.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _url = json['url'];
  }
  int? _id;
  String? _name;
  String? _url;
Radios copyWith({  int? id,
  String? name,
  String? url,
}) => Radios(  id: id ?? _id,
  name: name ?? _name,
  url: url ?? _url,
);
  int? get id => _id;
  String? get name => _name;
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['url'] = _url;
    return map;
  }

}