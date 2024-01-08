import 'package:device_preview/device_preview.dart';

import 'export.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(DevicePreview( //it gives the flexibility to simulate our app on diffrent devices
    enabled: debugDisplay, //set it to !k release mode to test on diffrent devices
    tools: const [
      ...DevicePreview.defaultTools,
    ],
    builder: (context) => const App(),
  ));
}
