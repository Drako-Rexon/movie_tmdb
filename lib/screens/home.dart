import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movie_tmdb/utils/constants.dart';
import 'package:movie_tmdb/widgets/top_rated.dart';
import 'package:movie_tmdb/widgets/trending.dart';
import 'package:movie_tmdb/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingMovies = [];
  List topRatedMovies = [];
  List tvPopular = [];
  final String apiKey = '6eff86638c0823370d1d56dfc418db5e';
  final readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2ZWZmODY2MzhjMDgyMzM3MGQxZDU2ZGZjNDE4ZGI1ZSIsInN1YiI6IjY0YTkzNjZkM2UyZWM4MDBhZjdjZGI1MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.TgXg-vFFDTPen75DVzoBt5M2VsXhIJuvubO6sYkiG4g';

  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apiKey, readAccessToken),
      logConfig: const ConfigLogger(showErrorLogs: true, showLogs: true),
    );

    Map<dynamic, dynamic> trendingResult =
        await tmdbWithCustomLogs.v3.trending.getTrending();
    Map<dynamic, dynamic> topRatedResult =
        await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map<dynamic, dynamic> tvResult =
        await tmdbWithCustomLogs.v3.tv.getPopular();
    setState(() {
      trendingMovies = trendingResult['results'];
      topRatedMovies = topRatedResult['results'];
      tvPopular = tvResult['results'];
    });
    log(tvPopular.toString());
    // print(topRatedMovies.toString());
    // print(tvPopular.toString());
  }

  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: const Text(
            'Movie TMDB',
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            TV(tv: tvPopular),
            TopRated(topRated: topRatedMovies),
            TrendingMovies(trending: trendingMovies)
          ],
        ));
  }
}
