import 'package:flutter_ics_homescreen/presentation/custom_icons/custom_icons.dart';

import '../../../../export.dart';
import '../../settings/settings_screens/audio_settings/widget/slider_widgets.dart';

class CustomVolumeSlider extends ConsumerStatefulWidget {
  const CustomVolumeSlider({
    super.key,
  });

  @override
  CustomVolumeSliderState createState() => CustomVolumeSliderState();
}

class CustomVolumeSliderState extends ConsumerState<CustomVolumeSlider> {
  void _increase() {
    _currentVal += 10;
    if (_currentVal > 100) {
      _currentVal = 100;
    }
    setState(() {
      ref.read(vehicleProvider.notifier).setVolume(_currentVal);
    });
  }

  void _dercrease() {
    _currentVal -= 10;
    if (_currentVal < 0) {
      _currentVal = 0;
    }
    setState(() {
      ref.read(vehicleProvider.notifier).setVolume(_currentVal);
    });
  }

  double _currentVal = 50;
  @override
  Widget build(BuildContext context) {
    final volumeValue =
        ref.watch(vehicleProvider.select((audio) => audio.mediaVolume));

    return Column(
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: const ShapeDecoration(
            color: AGLDemoColors.buttonFillEnabledColor,
            shape: StadiumBorder(
                side: BorderSide(
              color: Color(0xFF5477D4),
              width: 0.5,
            )),
          ),
          height: 160,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                      customBorder: const CircleBorder(),
                      onTap: () {
                        _dercrease();
                      },
                      child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            CustomIcons.vol_min,
                            color: AGLDemoColors.periwinkleColor,
                            size: 60,
                          ))),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 10.0),
              //   child: SizedBox(
              //     width: 50,
              //     child: IconButton(
              //         padding: EdgeInsets.zero,
              //         onPressed: () {
              //           _dercrease();
              //         },
              //         icon: const Icon(
              //           CustomIcons.vol_min,
              //           color: AGLDemoColors.periwinkleColor,
              //           size: 48,
              //         )),
              //   ),
              // ),
              Expanded(
                child: SliderTheme(
                  data: SliderThemeData(
                    overlayShape: SliderComponentShape.noOverlay,
                    valueIndicatorShape: SliderComponentShape.noOverlay,
                    activeTickMarkColor: Colors.transparent,
                    inactiveTickMarkColor: Colors.transparent,
                    inactiveTrackColor: AGLDemoColors.backgroundInsetColor,
                    thumbShape: const PolygonSliderThumb(
                        sliderValue: 3, thumbRadius: 23),
                    //trackHeight: 5,
                  ),
                  child: Slider(
                    divisions: 10,
                    min: 0,
                    max: 100,
                    value: volumeValue.toDouble(),
                    onChanged: (newValue) {
                      ref.read(vehicleProvider.notifier).setVolume(newValue);
                      _currentVal = newValue;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                      customBorder: const CircleBorder(),
                      onTap: () {
                        _increase();
                      },
                      child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            CustomIcons.vol_max,
                            color: AGLDemoColors.periwinkleColor,
                            size: 60,
                          ))),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(right: 10.0),
              //   child: SizedBox(
              //     width: 60,
              //     child: IconButton(
              //         padding: EdgeInsets.zero,
              //         onPressed: () {
              //           _increase();
              //         },
              //         icon: const Icon(
              //           CustomIcons.vol_max,
              //           color: AGLDemoColors.periwinkleColor,
              //           size: 48,
              //         )),
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
