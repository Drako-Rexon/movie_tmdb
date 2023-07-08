import 'package:flutter/material.dart';
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
    if (n.length >= 15) return n.substring(0, 15) + '...';
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
              Icon(
                Icons.arrow_back_ios,
                size: 16,
              ),
              Text('Back'),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          SizedBox(
            height: 250,
            child: Stack(
              children: [
                Positioned(
                  child: SizedBox(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      bannerUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                    bottom: 10,
                    child: Text(
                      '🌟 Average Rating - $vote',
                      style: textModified(size: 18),
                    )),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              name,
              style: textModified(size: 24),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            child: Text('Release On - $launchDate'),
          ),
          Row(
            children: [
              SizedBox(
                height: 200,
                width: 100,
                child: Image.network(posterUrl),
              ),
              Flexible(
                child: Text(
                  desc,
                  style: textModified(
                    size: 18,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
