import 'package:latlong2/latlong.dart';
import './map.dart';
import './trace.dart';

class ObjectWithDistance {
  final Trace trace;
  double distance;
  ObjectWithDistance(this.trace, this.distance);

  void addDistance(double dist) {
    distance += dist;
  }
}

class User {
  late TraceMap map;
  late LatLng pos;
  late int radius;
}

class Region {
  late double _xmin;
  late double _xmax;
  late double _ymin;
  late double _ymax;
  late List<ObjectWithDistance> _region;

  void updateDistances(double distance) {
    for (var element in _region) {
      element.addDistance(distance);
    }
  }

  //.sort((a, b) => a.someProperty.compareTo(b.someProperty));

  bool inside(double x, double y) {
    return true;
  }

  // nearBorder();
}
