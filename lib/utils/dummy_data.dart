import 'package:booktheater/model/play_model.dart';
import 'package:booktheater/utils/mytheme.dart';

import '../model/crea_cast_model.dart';
import '../model/event_model.dart';
import '../model/menu_model.dart';
import '../model/movie_model.dart';
import '../model/offer_model.dart';
import '../model/theater_model.dart';

List<String> cities = [
  "Surat",
  "Ahmedabad",
  "Amreli",
  "Mumbai",
  "Delhi",
  "Chennai",
];

List<MenuModel> menus = [
  MenuModel(name: "Movies", image: "assets/images/Movie.png"),
  MenuModel(name: "Events", image: "assets/images/Event.png"),
  MenuModel(name: "Plays", image: "assets/images/Play.png"),
  MenuModel(name: "Sports", image: "assets/images/Sport.png"),
  MenuModel(name: "Activity", image: "assets/images/Activity.png"),
  MenuModel(name: "Monum", image: "assets/images/Monum.png"),
];

List<MovieModel> movies = [
  const MovieModel(
      title: "3 Idiots",
      description: "description",
      actors: [
        "Aamir Khan",
        "R. Madhvan",
        "Shamran Joshi",
        "Kareena Kapoor",
        "Boman Irani"
      ],
      like: 84,
      bannerUrl: "assets/movies/3Idiots.png"),
  const MovieModel(
      title: "DDLJ",
      description: "description",
      actors: ["Shah Rukh Khan", " Kajol", "Amrish Puri", "Anupam Kher"],
      like: 80,
      bannerUrl: "assets/movies/Ddlj.png"),
  const MovieModel(
      title: "Bajrangi Bhaijaan",
      description: "description",
      actors: ["Salman Khan", "Kareena Kapoor", "Nawabzuddin Siddiqui"],
      like: 81,
      bannerUrl: "assets/movies/BajarangiBhaijaan.png"),
  const MovieModel(
      title: "Dangal",
      description: "description",
      actors: ["Aamir Khan", "Fatima Sana Shaikh", "Sanya Malhotra"],
      like: 83,
      bannerUrl: "assets/movies/Dangal.png"),
  const MovieModel(
      title: "Dhoom 3",
      description: "description",
      actors: [
        "Aamir Khan",
        "Abhishek Bachchan",
        "Uday Chopra",
        "Katrina Kaif",
        "Jackie Shroff"
      ],
      like: 54,
      bannerUrl: "assets/movies/Dhoom3.png"),
  const MovieModel(
      title: "Tiger Zinda Hai",
      description: "description",
      actors: ["Salman Khan", "Katrina Kaif", "Paresh Rawal", "Angad Badi"],
      like: 76,
      bannerUrl: "assets/movies/TigerZindaHai.png"),
  const MovieModel(
      title: "Sanju",
      description: "description",
      actors: [
        "Sanjay Dutt",
        "Ranbir Kapoor",
        "Viki Kaushal",
        "Sonam Kapoor",
        "Paresh Rawal"
      ],
      like: 82,
      bannerUrl: "assets/movies/Sanju.png")
];

List<EventModel> events = [
  const EventModel(
      title: "Dandiya Night",
      description: "description",
      bannerUrl: "assets/events/Event1.png",
      date: "date"),
  const EventModel(
      title: "Sid id Kidding",
      description: "description",
      bannerUrl: "assets/events/Event2.png",
      date: "date"),
  const EventModel(
      title: "Bassi",
      description: "description",
      bannerUrl: "assets/events/Event3.png",
      date: "date"),
  const EventModel(
      title: "Gujarat 11",
      description: "description",
      bannerUrl: "assets/events/Event4.png",
      date: "date"),
  const EventModel(
      title: "Vhalam",
      description: "description",
      bannerUrl: "assets/events/Event5.png",
      date: "date"),
  const EventModel(
      title: "Viranjali",
      description: "description",
      bannerUrl: "assets/events/Event6.png",
      date: "date"),
  const EventModel(
      title: "Gujarat Garba",
      description: "description",
      bannerUrl: "assets/events/Event7.png",
      date: "date"),
];

List<PlayModel> plays = [
  const PlayModel(
      title: "Dandiya Night",
      description: "description",
      bannerUrl: "assets/events/Event1.png",
      date: "date"),
  const PlayModel(
      title: "Sid id Kidding",
      description: "description",
      bannerUrl: "assets/events/Event2.png",
      date: "date"),
  const PlayModel(
      title: "Bassi",
      description: "description",
      bannerUrl: "assets/events/Event3.png",
      date: "date"),
  const PlayModel(
      title: "Gujarat 11",
      description: "description",
      bannerUrl: "assets/events/Event4.png",
      date: "date"),
  const PlayModel(
      title: "Vhalam",
      description: "description",
      bannerUrl: "assets/events/Event5.png",
      date: "date"),
  const PlayModel(
      title: "Viranjali",
      description: "description",
      bannerUrl: "assets/events/Event6.png",
      date: "date"),
  const PlayModel(
      title: "Gujarat Garba",
      description: "description",
      bannerUrl: "assets/events/Event7.png",
      date: "date"),
];

List<OfferModel> offers = [
  OfferModel(
    title: "Wait! Grab a Free Reward",
    description: "Book your seats and tap on box to claim it!",
    startTime: DateTime(2023, 7, 25, 12),
    expiry: DateTime(2023, 8, 25, 12),
    discount: 50,
  ),
  OfferModel(
    title: "Wait! Grab a Free Reward",
    description: "Book your seats and tap on box to claim it!",
    startTime: DateTime(2023, 3, 7, 12),
    expiry: DateTime(2024, 3, 7, 12),
    discount: 100,
    color: Mytheme.greenTextColor,
    gradientColor: Mytheme.greenGiftGradientColors,
  ),
];

List<CrewCastModel> casts = [
  const CrewCastModel(
      movieId: "3 Idiots",
      castId: "AK",
      name: "Aamir Khan",
      image: "assets/casts/AK.png"),
  const CrewCastModel(
      movieId: "3 Idiots",
      castId: "RM",
      name: "R. Madhvan",
      image: "assets/casts/RM.png"),
  const CrewCastModel(
      movieId: "3 Idiots",
      castId: "SJ",
      name: "Shamaran Joshi",
      image: "assets/casts/SJ.png"),
  const CrewCastModel(
      movieId: "3 Idiots",
      castId: "KK",
      name: "Kareena Kapoor",
      image: "assets/casts/KK.png"),
  const CrewCastModel(
      movieId: "3 Idiots",
      castId: "BI",
      name: "Boman Irani",
      image: "assets/casts/BI.png"),
];

List<TheaterModel> theaters = [
  const TheaterModel(id: '1', name: 'PVR Motera'),
  const TheaterModel(id: '2', name: 'NY Cinema'),
  const TheaterModel(id: '3', name: 'INOX Raj Imperial'),
  const TheaterModel(id: '4', name: 'PVR RR Mall'),
];
