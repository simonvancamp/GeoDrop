import 'dart:math';
import 'package:latlong2/latlong.dart';
import './trace.dart';
import './traceMap.dart';

class PolarCoord {
  late double angle;
  late double distance;
  PolarCoord(this.angle, this.distance);
}

class User {
  GeohashTree<Trace> tree = GeohashTree<Trace>();
  late LatLng pos;
  late double radius;
  late LatLng residence;
  late List<String> blackList;
  late String userID;

//communication with repository
  void _dropTrace<
      T extends Trace>() {} // to the server, server sends this to all user inside

  void dropPost() {}
  void dropSent() {}
  void OpenTrace() {}

  void refreshMap() {
    tree.forEach((geohash, value) {
      if (value.isAlive() == false) {
        tree.remove(geohash);
      }
    });
  }

//updating UI
  List<PolarCoord> polarView() {
    List<Trace> traces =
        tree.getGeohashesByProximity(pos.latitude, pos.longitude, radius);
    List<PolarCoord> points = traces.map<PolarCoord>((element) {
      return _getSortedPolarCoordinates(
          element.location.latitude, element.location.longitude);
    }).toList();
    return points;
  }

  PolarCoord _getSortedPolarCoordinates(double lat, double long) {
    var angle = atan((cos(lat) * sin(long - pos.longitude)) /
        (cos(pos.latitude) * sin(lat) -
            sin(pos.latitude) * cos(lat) * cos(long - pos.longitude)));
    var dist = acos((sin(pos.latitude) * sin(lat)) +
            (cos(pos.latitude) * cos(lat) * cos(long - pos.longitude))) *
        6378137.0;
    return PolarCoord(angle, dist);

    ///distance in meters
  }
}
