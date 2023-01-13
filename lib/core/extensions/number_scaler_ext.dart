import 'package:web_test/core/utils/device_scaler.dart';

extension NumScaler on num {
  double get scale => DeviceScaler().scale(toDouble());
  double get sf => DeviceScaler().scaleFont(toDouble());
}