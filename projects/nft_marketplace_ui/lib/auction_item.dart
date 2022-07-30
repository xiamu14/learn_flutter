import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AuctionItem extends StatelessWidget {
  const AuctionItem(
      {Key? key,
      this.heading,
      this.pictureHeight,
      required this.onTap,
      required this.description,
      required this.uploader,
      required this.amount,
      required this.imagePath})
      : super(key: key);

  final String description, uploader, amount, imagePath;

  final String? heading;
  final double? pictureHeight;

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // title
            heading != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        heading ?? "",
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontFamily: GoogleFonts.acme().fontFamily,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.5),
                      ),
                      const Icon(
                        CupertinoIcons.forward,
                        size: 30,
                      )
                    ],
                  )
                : Row(),
            const SizedBox(
              height: 16,
            ),
            // picture
            Stack(
              children: [
                Container(
                  width: w,
                  height: pictureHeight ?? (h * 0.25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(imagePath),
                    ),
                  ),
                ),
                Positioned.fill(
                  top: 16,
                  left: 16,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).bottomAppBarTheme.color,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          '11h: 21m : 57s',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            // price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  description,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Row(
                  children: [
                    const Icon(
                      FontAwesomeIcons.ethereum,
                      color: AppColors.primaryColor,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      '$amount ETH',
                      style: Theme.of(context).textTheme.titleLarge,
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            // uploader
            Text(
              uploader,
              style: TextStyle(color: Colors.grey.shade400),
            ),
          ],
        ),
      ),
    );
  }
}
