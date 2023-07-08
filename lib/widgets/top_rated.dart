import 'package:flutter/material.dart';
import 'package:movie_tmdb/utils/constants.dart';
import 'package:movie_tmdb/utils/texts.dart';

class TopRated extends StatelessWidget {
  const TopRated({super.key, required this.toprated});
  final List toprated;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Top Rated Movies',
            style: textModified(size: 26),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, ind) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    width: 150,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  posterUrl + toprated[ind]['poster_path']),
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            toprated[ind]['title'] ?? 'Loading...',
                            style: textModified(),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: toprated.length,
            ),
          )
        ],
      ),
    );
  }
}
