import 'coord.dart';

class City {
  int id;
  String name;
  Coord coord;
  String country;
  int timezone;
  int sunrise;
  int sunset;

  City(
      {this.id,
      this.name,
      this.coord,
      this.country,
      this.timezone,
      this.sunrise,
      this.sunset});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    coord = json['coord'] != null ? new Coord.fromJson(json['coord']) : null;
    country = json['country'];
    timezone = json['timezone'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.coord != null) {
      data['coord'] = this.coord.toJson();
    }
    data['country'] = this.country;
    data['timezone'] = this.timezone;
    data['sunrise'] = this.sunrise;
    data['sunset'] = this.sunset;
    return data;
  }
}
