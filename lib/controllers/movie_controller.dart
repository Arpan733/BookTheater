import 'package:get/get.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../utils/constants.dart';

class MovieController extends GetxController {
  static MovieController instance = Get.find();
  RxList trendingMovies = [].obs;
  RxList popularMovies = [].obs;
  RxList upComingMovies = [].obs;
  RxString genres = "".obs;

  @override
  void onReady() {
    loadMovies();
    super.onReady();
  }

  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(Constants.tmdbAPI, Constants.readAccessToken),
      logConfig: const ConfigLogger(
        showErrorLogs: true,
        showLogs: true,
      ),
    );

    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    trendingMovies.value = trendingResult['results'] as List;

    Map popularResult = await tmdbWithCustomLogs.v3.movies.getPopular();
    popularMovies.value = popularResult['results'] as List;
    print("popular " + popularMovies.value.toString());

    Map upComingResult = await tmdbWithCustomLogs.v3.movies.getUpcoming();
    upComingMovies.value = upComingResult['results'] as List;
    print("upcoming" + upComingMovies.value.toString());
  }

  generateGenreList(List l) {
    genres.value = "";
    l.forEach((element) {
      if (element == 28) {
        genres.value = "${genres.value}Action, ";
      } else if (element == 12) {
        genres.value = "${genres.value}Adventure, ";
      } else if (element == 16) {
        genres.value = "${genres.value}Animation, ";
      } else if (element == 35) {
        genres.value = "${genres.value}Comedy, ";
      } else if (element == 80) {
        genres.value = "${genres.value}Crime, ";
      } else if (element == 99) {
        genres.value = "${genres.value}Documentry, ";
      } else if (element == 18) {
        genres.value = "${genres.value}Drama, ";
      } else if (element == 10751) {
        genres.value = "${genres.value}Family, ";
      } else if (element == 14) {
        genres.value = "${genres.value}Fantasy, ";
      } else if (element == 36) {
        genres.value = "${genres.value}History, ";
      } else if (element == 27) {
        genres.value = "${genres.value}Horror, ";
      } else if (element == 10402) {
        genres.value = "${genres.value}Music, ";
      } else if (element == 9648) {
        genres.value = "${genres.value}Mystory, ";
      } else if (element == 10749) {
        genres.value = "${genres.value}Romance, ";
      } else if (element == 878) {
        genres.value = "${genres.value}Science Fiction, ";
      } else if (element == 10770) {
        genres.value = "${genres.value}TV Movie, ";
      } else if (element == 53) {
        genres.value = "${genres.value}Thriller, ";
      } else if (element == 10752) {
        genres.value = "${genres.value}War, ";
      } else if (element == 37) {
        genres.value = "${genres.value}Western, ";
      }
    });
    genres.value = genres.value.substring(0, genres.value.length - 2);
  }
}
