import 'package:flutter/material.dart';
import 'package:movie_tmdb/utils/constants.dart';
import 'package:movie_tmdb/utils/texts.dart';

class TV extends StatelessWidget {
  const TV({super.key, required this.tv});
  final List tv;

  @override
  Widget build(BuildContext context) {
    List time = ['7:45 PM', '9:30 PM', '11:15 PM'];
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
            height: 300,
            child: ListView.builder(
              itemCount: tv.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, ind) {
                return InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 5, left: 5),
                        width: 270,
                        height: 270,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: tv[ind]['backdrop_path'] != null
                                ? NetworkImage(
                                    posterUrl + tv[ind]['backdrop_path'],
                                  )
                                : const NetworkImage(notAvailableNet),
                          ),
                        ),
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 15, bottom: 15, right: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 5),
                                child: Text(
                                  tv[ind]['original_name'] ?? 'Loading...',
                                  style: textModified(weight: FontWeight.w900),
                                ),
                              ),
                              tv[ind]['overview'] == ''
                                  ? Container()
                                  : Text(
                                      tv[ind]['overview'] ?? 'Loading...',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style:
                                          textModified(weight: FontWeight.bold),
                                    ),
                              Row(
                                children: List.generate(
                                  3,
                                  (index) => Expanded(
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                        left: 5,
                                        right: 5,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          time[index],
                                          style: textModified(
                                            clr: Colors.black,
                                            size: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
