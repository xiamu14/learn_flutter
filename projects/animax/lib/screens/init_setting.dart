import 'package:animax/screens/edit_profile.dart';
import 'package:animax/widgets/button.dart';
import 'package:animax/widgets/custom_app_bar.dart';
import 'package:animax/widgets/init_bottom_button.dart';
import 'package:animax/widgets/interest_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class InitSetting extends StatelessWidget {
  const InitSetting({Key? key}) : super(key: key);

  static String routePath = '/initSetting';
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SafeArea(
            child: Column(
          children: [
            const CustomAppBar(title: 'Choose Your Interest'),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SingleChildScrollView(
                  child: Column(children: [
                    Text(
                      'Choose your interests and get the best anime recommendations. Don\'t worry, you can always change it later.',
                      style: GoogleFonts.urbanist(
                        textStyle: const TextStyle(fontSize: 18, height: 1.4),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const InterestSelect()
                  ]),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: InitBottomButton(),
            ),
            const SizedBox(
              height: 24,
            )
          ],
        )),
      ),
    );
  }
}
