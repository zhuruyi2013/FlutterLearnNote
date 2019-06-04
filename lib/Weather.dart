class Weather {
  String cityid;
  String updateTime;
  String city;
  String cityEn;
  String country;
  String countryEn;
  List<Data> data;

  Weather(
      {this.cityid,
      this.updateTime,
      this.city,
      this.cityEn,
      this.country,
      this.countryEn,
      this.data});

  Weather.fromJson(Map<String, dynamic> json) {
    cityid = json['cityid'];
    updateTime = json['update_time'];
    city = json['city'];
    cityEn = json['cityEn'];
    country = json['country'];
    countryEn = json['countryEn'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cityid'] = this.cityid;
    data['update_time'] = this.updateTime;
    data['city'] = this.city;
    data['cityEn'] = this.cityEn;
    data['country'] = this.country;
    data['countryEn'] = this.countryEn;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String day;
  String date;
  String week;
  String wea;
  String weaImg;
  int air;
  int humidity;
  String airLevel;
  String airTips;
  Alarm alarm;
  String tem1;
  String tem2;
  String tem;
  List<String> win;
  String winSpeed;
  List<Hours> hours;
  List<Index> index;

  Data(
      {this.day,
      this.date,
      this.week,
      this.wea,
      this.weaImg,
      this.air,
      this.humidity,
      this.airLevel,
      this.airTips,
      this.alarm,
      this.tem1,
      this.tem2,
      this.tem,
      this.win,
      this.winSpeed,
      this.hours,
      this.index});

  Data.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    date = json['date'];
    week = json['week'];
    wea = json['wea'];
    weaImg = json['wea_img'];
    air = json['air'];
    humidity = json['humidity'];
    airLevel = json['air_level'];
    airTips = json['air_tips'];
    alarm = json['alarm'] != null ? new Alarm.fromJson(json['alarm']) : null;
    tem1 = json['tem1'];
    tem2 = json['tem2'];
    tem = json['tem'];
    win = json['win'].cast<String>();
    winSpeed = json['win_speed'];
    if (json['hours'] != null) {
      hours = new List<Hours>();
      json['hours'].forEach((v) {
        hours.add(new Hours.fromJson(v));
      });
    }
    if (json['index'] != null) {
      index = new List<Index>();
      json['index'].forEach((v) {
        index.add(new Index.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['date'] = this.date;
    data['week'] = this.week;
    data['wea'] = this.wea;
    data['wea_img'] = this.weaImg;
    data['air'] = this.air;
    data['humidity'] = this.humidity;
    data['air_level'] = this.airLevel;
    data['air_tips'] = this.airTips;
    if (this.alarm != null) {
      data['alarm'] = this.alarm.toJson();
    }
    data['tem1'] = this.tem1;
    data['tem2'] = this.tem2;
    data['tem'] = this.tem;
    data['win'] = this.win;
    data['win_speed'] = this.winSpeed;
    if (this.hours != null) {
      data['hours'] = this.hours.map((v) => v.toJson()).toList();
    }
    if (this.index != null) {
      data['index'] = this.index.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Alarm {
  String alarmType;
  String alarmLevel;
  String alarmContent;

  Alarm({this.alarmType, this.alarmLevel, this.alarmContent});

  Alarm.fromJson(Map<String, dynamic> json) {
    alarmType = json['alarm_type'];
    alarmLevel = json['alarm_level'];
    alarmContent = json['alarm_content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['alarm_type'] = this.alarmType;
    data['alarm_level'] = this.alarmLevel;
    data['alarm_content'] = this.alarmContent;
    return data;
  }
}

class Hours {
  String day;
  String wea;
  String tem;
  String win;
  String winSpeed;

  Hours({this.day, this.wea, this.tem, this.win, this.winSpeed});

  Hours.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    wea = json['wea'];
    tem = json['tem'];
    win = json['win'];
    winSpeed = json['win_speed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['wea'] = this.wea;
    data['tem'] = this.tem;
    data['win'] = this.win;
    data['win_speed'] = this.winSpeed;
    return data;
  }
}

class Index {
  String title;
  String level;
  String desc;

  Index({this.title, this.level, this.desc});

  Index.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    level = json['level'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['level'] = this.level;
    data['desc'] = this.desc;
    return data;
  }
}
