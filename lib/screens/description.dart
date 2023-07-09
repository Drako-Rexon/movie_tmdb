import 'package:flutter/material.dart';
import 'package:movie_tmdb/utils/constants.dart';
import 'package:movie_tmdb/utils/texts.dart';

class Description extends StatelessWidget {
  const Description(
      {super.key,
      required this.name,
      required this.desc,
      required this.bannerUrl,
      required this.posterUrl,
      required this.vote,
      required this.launchDate});
  final String name, desc, bannerUrl, posterUrl, vote, launchDate;

  String titleName(String n) {
    if (n.length >= 15) return '${n.substring(0, 15)}...';
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleName(name)),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Row(
            children: [
              SizedBox(width: 7),
              Icon(Icons.arrow_back_ios, size: 16),
              Text('Back'),
            ],
          ),
        ),
      ),
      backgroundColor: primaryColor,
      body: SizedBox(
        width: double.maxFinite,
        height: 366,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(posterUrl), fit: BoxFit.cover),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.00, -1.00),
                  end: Alignment(0, 4),
                  colors: [
                    Colors.transparent,
                    Color.fromARGB(167, 105, 105, 105),
                    Color(0x00C4C4C4)
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 15, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Movie Name', style: textModified(size: 24)),
                      Text('Action / Thriller', style: textModified(size: 12)),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text('90% Fresh',
                        style: textModified(size: 12, weight: FontWeight.w900)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
