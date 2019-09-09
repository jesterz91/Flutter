class AirResult {
    Data info;
    String status;

    AirResult({this.info, this.status});

    factory AirResult.fromJson(Map<String, dynamic> json) {
        return AirResult(
            info: json['data'] != null ? Data.fromJson(json['data']) : null,
            status: json['status'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['status'] = this.status;
        if (this.info != null) {
            data['info'] = this.info.toJson();
        }
        return data;
    }
}

class Data {
    String city;
    String country;
    Current current;
    Location location;
    String state;

    Data({this.city, this.country, this.current, this.location, this.state});

    factory Data.fromJson(Map<String, dynamic> json) {
        return Data(
            city: json['city'],
            country: json['country'],
            current: json['current'] != null ? Current.fromJson(json['current']) : null,
            location: json['location'] != null ? Location.fromJson(json['location']) : null,
            state: json['state'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['city'] = this.city;
        data['country'] = this.country;
        data['state'] = this.state;
        if (this.current != null) {
            data['current'] = this.current.toJson();
        }
        if (this.location != null) {
            data['location'] = this.location.toJson();
        }
        return data;
    }
}

class Location {
    List<double> coordinates;
    String type;

    Location({this.coordinates, this.type});

    factory Location.fromJson(Map<String, dynamic> json) {
        return Location(
            coordinates: json['coordinates'] != null ? new List<double>.from(json['coordinates']) : null,
            type: json['type'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['type'] = this.type;
        if (this.coordinates != null) {
            data['coordinates'] = this.coordinates;
        }
        return data;
    }
}

class Current {
    Pollution pollution;
    Weather weather;

    Current({this.pollution, this.weather});

    factory Current.fromJson(Map<String, dynamic> json) {
        return Current(
            pollution: json['pollution'] != null ? Pollution.fromJson(json['pollution']) : null,
            weather: json['weather'] != null ? Weather.fromJson(json['weather']) : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.pollution != null) {
            data['pollution'] = this.pollution.toJson();
        }
        if (this.weather != null) {
            data['weather'] = this.weather.toJson();
        }
        return data;
    }
}

class Weather {
    int hu;
    String ic;
    int pr;
    int tp;
    String ts;
    int wd;
    int ws;

    Weather({this.hu, this.ic, this.pr, this.tp, this.ts, this.wd, this.ws});

    factory Weather.fromJson(Map<String, dynamic> json) {
        return Weather(
            hu: json['hu'],
            ic: json['ic'],
            pr: json['pr'],
            tp: json['tp'],
            ts: json['ts'],
            wd: json['wd'],
            ws: json['ws'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['hu'] = this.hu;
        data['ic'] = this.ic;
        data['pr'] = this.pr;
        data['tp'] = this.tp;
        data['ts'] = this.ts;
        data['wd'] = this.wd;
        data['ws'] = this.ws;
        return data;
    }
}

class Pollution {
    int aqicn;
    int aqius;
    String maincn;
    String mainus;
    String ts;

    Pollution({this.aqicn, this.aqius, this.maincn, this.mainus, this.ts});

    factory Pollution.fromJson(Map<String, dynamic> json) {
        return Pollution(
            aqicn: json['aqicn'],
            aqius: json['aqius'],
            maincn: json['maincn'],
            mainus: json['mainus'],
            ts: json['ts'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['aqicn'] = this.aqicn;
        data['aqius'] = this.aqius;
        data['maincn'] = this.maincn;
        data['mainus'] = this.mainus;
        data['ts'] = this.ts;
        return data;
    }
}