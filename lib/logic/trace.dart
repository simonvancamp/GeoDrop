import 'package:latlong2/latlong.dart';
import 'dart:convert';

// enum Sentiment { red, green, blue }

// enum Subject { warning, question, post }

class Message {
  late String content;
  late String title;
  // late Sentiment sentiment; //detected based on content
  // late Subject subject;
  //late File attached_image;
}

enum TraceType { post, sent }

abstract class Trace {
  late final DateTime _droptime;
  late final String _creatorID;
  late final LatLng _location;
  late Duration _allowedAge = const Duration(days: 10000);
  static const Distance distance = Distance();

  Trace(double lat, double long, String userID) {
    _location = LatLng(lat, long);
    _droptime = DateTime.now();
    _creatorID = userID;
  }

  LatLng get location => _location;

  double getDistance(LatLng position) {
    return distance.as(LengthUnit.Meter, position, _location);
  }

  Duration getAge() {
    return DateTime.now().difference(_droptime);
  }

  bool isAlive() {
    return (getAge() <= _allowedAge);
  }

  String convertToJson() {
    String jsonStr = '"lat":${jsonEncode(_location.latitude)}}';
    jsonStr =
        '${jsonStr.substring(0, jsonStr.length - 1)},"long":${jsonEncode(_location.longitude)}}';
    jsonStr =
        '${jsonStr.substring(0, jsonStr.length - 1)},"droptime":${jsonEncode(_droptime.toString())}}';
    jsonStr =
        '${jsonStr.substring(0, jsonStr.length - 1)},"allowedAge":${jsonEncode(_allowedAge.toString())}}';
    return jsonStr;
  }

  TraceType getType();
}

class Sent extends Trace {
  Sent(super.lat, super.long, Duration allowedAge) {
    _allowedAge = allowedAge;
  }

  @override
  TraceType getType() {
    return TraceType.sent;
  }
}

class Post extends Trace {
  late final Message _message;

  Post(super.lat, super.long, Duration allowedAge, Message message) {
    _allowedAge = allowedAge;
    _message = message;
  }

  @override
  String convertToJson() {
    String jsonStr = super.convertToJson();
    return jsonStr; //TODO add message content
  }

  @override
  TraceType getType() {
    return TraceType.post;
  }
}
