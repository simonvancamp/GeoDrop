import 'package:rbush/rbush.dart';
import './trace.dart';

class TraceMap {
  late RBushBase<Trace> traceMap;

  TraceMap(String jsonStr) {
    List<Trace> traces = convertJsonStr(jsonStr);
    traceMap = loadTraces(traces);
  }

  List<Trace> convertJsonStr(String jsonStr) {
    return [Sent(0.0, 0.0, const Duration(days: 0))];
  }

  RBushBase<Trace> loadTraces(List<Trace> traces) {
    final tree = RBushBase<Trace>(
      maxEntries: 9,
      toBBox: (item) => RBushBox(
        minX: item.location.longitude,
        maxX: item.location.longitude,
        minY: item.location.latitude,
        maxY: item.location.latitude,
      ),
      getMinX: (item) => item.location.longitude,
      getMinY: (item) => item.location.latitude,
    );
    tree.load(traces);
    return tree;
  }
}
