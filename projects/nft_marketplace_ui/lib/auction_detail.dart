import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nft_marketplace_ui/auction_item.dart';

class AuctionDetails extends StatelessWidget {
  const AuctionDetails({Key? key}) : super(key: key);

  static const String route = '/AuctionDetails';

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(FontAwesomeIcons.heart),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(FontAwesomeIcons.share),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              AuctionItem(
                amount: '2.31',
                description: 'Colored bubbles',
                imagePath: 'assets/nft3.jpeg',
                pictureHeight: h * 0.5,
                onTap: () {
                  // Navigator.pushNamed(context, AuctionDetails.route);
                },
                uploader: '@Magdiellop',
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Crystal is a collection of 1,000 unique Crystal NFTs by Bastion -- rare digital collectibles living on the Ethereum blockchain.',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.grey.shade400, height: 1.5),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(0, 55)),
                        onPressed: () {},
                        child: Text(
                          'Buy now',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              )
            ],
          ),
        ),
      ),
    );
  }
}
