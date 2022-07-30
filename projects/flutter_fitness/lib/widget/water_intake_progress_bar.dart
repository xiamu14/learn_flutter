import 'package:flutter/cupertino.dart';
import 'package:flutter_fitness/theme/colors.dart';

class WaterIntakeProgressBar extends StatelessWidget {
  const WaterIntakeProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 20,
          height: 280,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: bgTextField,
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: 20,
            height: 280 * 0.5,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              gradient: LinearGradient(
                  begin: Alignment.topCenter, colors: [fourthColor, primary]),
            ),
          ),
        )
      ],
    );
  }
}
