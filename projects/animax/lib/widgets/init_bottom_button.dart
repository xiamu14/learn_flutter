import 'package:animax/screens/home.dart';
import 'package:animax/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class InitBottomButton extends StatelessWidget {
  const InitBottomButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Flexible(
          flex: 1,
          child: ButtonSkip(),
        ),
        const SizedBox(
          width: 12,
        ),
        Flexible(
          flex: 1,
          child: Button(
            color: Theme.of(context).primaryColor,
            onTap: () {
              // switch widget
            },
            text: 'Continue',
            height: 58,
          ),
        )
      ],
    );
  }
}

class ButtonSkip extends StatelessWidget {
  const ButtonSkip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(Home.routePath);
      },
      child: Container(
        height: 58,
        decoration: BoxDecoration(
          color: const Color(0xffE6F9ED),
          borderRadius: BorderRadius.circular(29),
        ),
        child: Center(
          child: Text(
            'Skip',
            style: GoogleFonts.urbanist(
              textStyle: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
