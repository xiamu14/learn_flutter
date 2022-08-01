import 'package:flutter/material.dart';

class AnimeCardList extends StatelessWidget {
  const AnimeCardList({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    final sh = MediaQuery.of(context).size.height;
    return Column(children: [
      SizedBox(
        height: 8,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Color(0xff212121),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'See all',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 16,
      ),
      Container(
        width: sw,
        height: 200,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ListView.builder(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: ((context, index) {
              return Row(
                children: [
                  Container(
                    width: 150,
                    height: 200,
                    decoration: BoxDecoration(
                      // border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image:
                            AssetImage('assets/poster/00${index + 1}_1.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(children: [
                      Positioned(
                        top: 12,
                        left: 12,
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 34,
                            height: 24,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Text(
                              '9.0',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    ]),
                  ),
                  const SizedBox(
                    width: 12,
                  )
                ],
              );
            })),
      ),
    ]);
  }
}
