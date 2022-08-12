import 'package:animax/model/user_info.dart';
import 'package:animax/screens/edit_profile.dart';
import 'package:animax/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

const interestOptions = [
  'Action',
  'Drama',
  'Comely',
  'Ecchi',
  'Adventure',
  'Mecha',
  'Romance',
  'Science',
  'Music',
  'School',
  'Seinen',
  'Shoujo',
  'Fantasy',
  'Mytery',
  'Vampire'
];

class InterestSelect extends StatelessWidget {
  const InterestSelect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 24,
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.start,
      children: interestOptions
          .map((e) => Interest(
                text: e,
              ))
          .toList(),
    );
  }
}

class Interest extends StatelessWidget {
  const Interest({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      constrainedAxis: Axis.vertical,
      child: Consumer<Interests>(
        builder: (context, provider, child) {
          final isSelected = provider.isSelected(text);
          return Button(
            text: text,
            height: 45,
            onTap: () {
              if (isSelected) {
                provider.removeInterest(text);
              } else {
                provider.addInterest(text);
              }
            },
            color: Theme.of(context).primaryColor,
            solid: isSelected,
          );
        },
      ),
    );
  }
}

class ButtonSkip extends StatelessWidget {
  const ButtonSkip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(EditProfile.routePath);
      },
      child: Container(
        height: 58,
        decoration: BoxDecoration(
          color: const Color(0xffE6F9ED),
          borderRadius: BorderRadius.circular(29),
        ),
        child: Center(
          child: Text(
            'skip',
            style: GoogleFonts.urbanist(
              textStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
