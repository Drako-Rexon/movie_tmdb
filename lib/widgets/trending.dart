import 'package:flutter/material.dart';
import 'package:movie_tmdb/description.dart';
import 'package:movie_tmdb/utils/constants.dart';
import 'package:movie_tmdb/utils/texts.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({super.key, required this.trending});
  final List trending;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Trending Movies',
            style: textModified(size: 26),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, ind) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Description(
                          name: trending[ind]['title'] ??
                              trending[ind]['original_name'],
                          bannerUrl: posterUrl + trending[ind]['backdrop_path'],
                          posterUrl: posterUrl + trending[ind]['poster_path'],
                          desc: trending[ind]['overview'],
                          launchDate: trending[ind]['release_date'] ??
                              trending[ind]['first_air_date'],
                          vote: trending[ind]['vote_average'].toString(),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: 150,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  posterUrl + trending[ind]['poster_path']),
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            trending[ind]['title'] ??
                                trending[ind]['original_name'],
                            style: textModified(),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: trending.length,
            ),
          )
        ],
      ),
    );
  }
}
