import '../../../../export.dart';

class TemperatureWidget extends ConsumerWidget {
  const TemperatureWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final temperature = ref.watch(vehicleProvider.select((vehicle) => vehicle));
    // final outsideTemperature = ref
    //     .watch(vehicleProvider.select((vehicle) => vehicle.outsideTemperature));
    final tempUnit =
        ref.watch(unitStateProvider.select((unit) => unit.temperatureUnit));

    TextStyle temperatureTextStyle = const TextStyle(
      fontFamily: 'BrunoAce',
      color: Colors.white,
      fontSize: 44,
    );

    TextStyle unitTextStyle = const TextStyle(
      fontFamily: 'BrunoAce',
      color: Color(0xFFC1D8FF),
      fontSize: 38,
    );

    return Container(
      width:
          442, // needs to be adjusted after the celsius and farenheight symbols are fixed
      height: 130, // Height of the oval
      //padding: const EdgeInsets.all(10),
      decoration: ShapeDecoration(
        gradient: const RadialGradient(
          colors: [
            Color.fromARGB(255, 19, 24, 75),
            Color.fromARGB(127, 0, 0, 0)
          ],
          stops: [0.0, 0.7],
          radius: 1,
        ),
        //color: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              65), // Half of the height for an oval effect
          side: const BorderSide(
            color: Color.fromARGB(156, 0, 0, 0),
            width: 2,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Inside temperature
          buildTemperatureRow(
            context,
            Icons.thermostat_outlined,
            "Inside",
            temperature.insideTemperature,
            tempUnit,
            temperatureTextStyle,
            unitTextStyle,
            false,
          ),
          const SizedBox(width: 10),
          // Outside temperature
          buildTemperatureRow(
            context,
            Icons.thermostat_outlined,
            "Outside",
            temperature.outsideTemperature,
            tempUnit,
            temperatureTextStyle,
            unitTextStyle,
            true,
          ),
        ],
      ),
    );
  }

  Widget buildTemperatureRow(
    BuildContext context,
    IconData icon,
    String label,
    double temperatureValue,
    TemperatureUnit tempUnit,
    TextStyle tempTextStyle,
    TextStyle unitTextStyle,
    bool isOutside,
  ) {
    int temperatureAsInt = temperatureValue.toInt();
    double convertedTemperature = tempUnit == TemperatureUnit.celsius
        ? temperatureAsInt.toDouble()
        : (temperatureAsInt * 9 / 5) + 32;

    // Format the temperature for display.
    String temperatureDisplay = tempUnit == TemperatureUnit.celsius
        ? '$temperatureAsInt'
        : convertedTemperature.toStringAsFixed(0);

    return Padding(
      padding: isOutside
          ? const EdgeInsets.only(
              right: 22) // Padding for the outside temperature
          : const EdgeInsets.only(
              left: 12), // Padding for the inside temperature
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: const Color(0xFF2962FF),
            size: 48,
          ),
          const SizedBox(width: 4), // Space between icon and text
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: const TextStyle(
                  color: Color(0xFFC1D8FF),
                  fontSize: 26,
                ),
              ),
              RichText(
                text: TextSpan(
                  text: temperatureDisplay,
                  style: tempTextStyle,
                  children: <TextSpan>[
                    TextSpan(
                      text: tempUnit == TemperatureUnit.celsius ? '°C' : '°F',
                      style: unitTextStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
