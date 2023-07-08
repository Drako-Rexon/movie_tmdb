import 'package:flutter/material.dart';
import 'package:movie_tmdb/utils/constants.dart';
import 'package:movie_tmdb/utils/texts.dart';

class TV extends StatelessWidget {
  const TV({super.key, required this.tv});
  final List tv;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Popular TV Shows',
            style: textModified(size: 26),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: tv.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, ind) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    width: 150,
                    child: Column(
                      children: [
                        Container(
                          width: 250,
                          height: 140,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: tv[ind]['backdrop_path'] != null
                                  ? NetworkImage(
                                      posterUrl + tv[ind]['backdrop_path'],
                                    )
                                  : const NetworkImage(
                                      'https://thumbs.dreamstime.com/z/not-available-stamp-seal-watermark-distress-style-designed-rectangle-circles-stars-black-vector-rubber-print-title-138796185.jpg'),
                            ),
                          ),
                        ),
                        // const SizedBox(height: 5),
                        Container(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            tv[ind]['original_name'] ?? 'Loading...',
                            style: textModified(),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
