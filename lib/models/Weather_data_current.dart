class WeatherDataCurrent {
  final Current current;

  WeatherDataCurrent({required this.current});

  factory WeatherDataCurrent.fromJson(Map<String, dynamic> json) =>
      WeatherDataCurrent(current: Current.fromJson(json));
}

class Current {
  Current({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,

    this.timezone,
    this.id,
    this.name,
    this.cod,
  });

  Current.fromJson(dynamic json) {
    coord = json['coord'] != null ? Coord.fromJson(json['coord']) : null;
    if (json['weather'] != null) {
      weather = [];
      json['weather'].forEach((v) {
        weather?.add(Weather.fromJson(v));
      });
    }
    base = json['base'];
    main = json['main'] != null ? Main.fromJson(json['main']) : null;
    visibility = json['visibility'];
    wind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;
    clouds = json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null;
    dt = json['dt'];

    timezone = json['timezone'];
    id = json['id'];
    name = json['name'];
    cod = json['cod'];
  }

  Coord? coord;
  List<Weather>? weather;
  String? base;
  Main? main;
  num? visibility;
  Wind? wind;
  Clouds? clouds;
  num? dt;

  num? timezone;
  num? id;
  String? name;
  num? cod;

  Current copyWith({
    Coord? coord,
    List<Weather>? weather,
    String? base,
    Main? main,
    num? visibility,
    Wind? wind,
    Clouds? clouds,
    num? dt,

    num? timezone,
    num? id,
    String? name,
    num? cod,
  }) => Current(
    coord: coord ?? this.coord,
    weather: weather ?? this.weather,
    base: base ?? this.base,
    main: main ?? this.main,
    visibility: visibility ?? this.visibility,
    wind: wind ?? this.wind,
    clouds: clouds ?? this.clouds,

    timezone: timezone ?? this.timezone,
    id: id ?? this.id,
    name: name ?? this.name,
    cod: cod ?? this.cod,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (coord != null) {
      map['coord'] = coord?.toJson();
    }
    if (weather != null) {
      map['weather'] = weather?.map((v) => v.toJson()).toList();
    }
    map['base'] = base;
    if (main != null) {
      map['main'] = main?.toJson();
    }
    map['visibility'] = visibility;
    if (wind != null) {
      map['wind'] = wind?.toJson();
    }
    if (clouds != null) {
      map['clouds'] = clouds?.toJson();
    }
    map['dt'] = dt;

    map['timezone'] = timezone;
    map['id'] = id;
    map['name'] = name;
    map['cod'] = cod;
    return map;
  }
}

/// country : "GB"
/// sunrise : 1744952280
/// sunset : 1745002874

/// all : 93

class Clouds {
  Clouds({this.all});

  Clouds.fromJson(dynamic json) {
    all = json['all'];
  }

  num? all;

  Clouds copyWith({num? all}) => Clouds(all: all ?? this.all);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['all'] = all;
    return map;
  }
}

/// speed : 5.34
/// deg : 147
/// gust : 9.12

class Wind {
  Wind({this.speed});

  Wind.fromJson(dynamic json) {
    speed = json['speed'];
  }

  num? speed;

  Wind copyWith({num? speed}) => Wind(speed: speed ?? this.speed);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['speed'] = speed;
    return map;
  }
}

/// temp : 14.46
/// feels_like : 13.53
/// temp_min : 14.46
/// temp_max : 14.46
/// pressure : 1011
/// humidity : 60
/// sea_level : 1011
/// grnd_level : 1007

class Main {
  Main({this.temp, this.humidity});

  Main.fromJson(dynamic json) {
    temp = json['temp'];
    humidity = json['humidity'];
  }

  num? temp;
  num? humidity;

  Main copyWith({num? temp, num? humidity}) =>
      Main(temp: temp ?? this.temp, humidity: humidity ?? this.humidity);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['temp'] = temp;

    map['humidity'] = humidity;

    return map;
  }
}

/// id : 804
/// main : "Clouds"
/// description : "overcast clouds"
/// icon : "04d"

class Weather {
  Weather({this.id, this.main, this.description, this.icon});

  Weather.fromJson(dynamic json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  num? id;
  String? main;
  String? description;
  String? icon;

  Weather copyWith({
    num? id,
    String? main,
    String? description,
    String? icon,
  }) => Weather(
    id: id ?? this.id,
    main: main ?? this.main,
    description: description ?? this.description,
    icon: icon ?? this.icon,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['main'] = main;
    map['description'] = description;
    map['icon'] = icon;
    return map;
  }
}

/// lon : -0.1257
/// lat : 51.5085

class Coord {
  Coord({this.lon, this.lat});

  Coord.fromJson(dynamic json) {
    lon = json['lon'];
    lat = json['lat'];
  }

  num? lon;
  num? lat;

  Coord copyWith({num? lon, num? lat}) =>
      Coord(lon: lon ?? this.lon, lat: lat ?? this.lat);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lon'] = lon;
    map['lat'] = lat;
    return map;
  }
}
