import 'package:booktheater/model/play_model.dart';
import '../model/event_model.dart';
import '../model/menu_model.dart';
import '../model/movie_model.dart';

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
  MovieModel(
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
  MovieModel(
      title: "DDLJ",
      description: "description",
      actors: ["Shah Rukh Khan", " Kajol", "Amrish Puri", "Anupam Kher"],
      like: 80,
      bannerUrl: "assets/movies/Ddlj.png"),
  MovieModel(
      title: "Bajrangi Bhaijaan",
      description: "description",
      actors: ["Salman Khan", "Kareena Kapoor", "Nawabzuddin Siddiqui"],
      like: 81,
      bannerUrl: "assets/movies/BajarangiBhaijaan.png"),
  MovieModel(
      title: "Dangal",
      description: "description",
      actors: ["Aamir Khan", "Fatima Sana Shaikh", "Sanya Malhotra"],
      like: 83,
      bannerUrl: "assets/movies/Dangal.png"),
  MovieModel(
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
  MovieModel(
      title: "Tiger Zinda Hai",
      description: "description",
      actors: ["Salman Khan", "Katrina Kaif", "Paresh Rawal", "Angad Badi"],
      like: 76,
      bannerUrl: "assets/movies/TigerZindaHai.png"),
  MovieModel(
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
  EventModel(
    title: "Dandiya Night",
    description: "description",
    bannerUrl: "assets/events/Event1.png",
    date: "date"
  ),
  EventModel(
    title: "Sid id Kidding",
    description: "description",
    bannerUrl: "assets/events/Event2.png",
    date: "date"
  ),
  EventModel(
    title: "Bassi",
    description: "description",
    bannerUrl: "assets/events/Event3.png",
    date: "date"
  ),
  EventModel(
    title: "Gujarat 11",
    description: "description",
    bannerUrl: "assets/events/Event4.png",
    date: "date"
  ),
  EventModel(
    title: "Vhalam",
    description: "description",
    bannerUrl: "assets/events/Event5.png",
    date: "date"
  ),
  EventModel(
    title: "Viranjali",
    description: "description",
    bannerUrl: "assets/events/Event6.png",
    date: "date"
  ),
  EventModel(
    title: "Gujarat Garba",
    description: "description",
    bannerUrl: "assets/events/Event7.png",
    date: "date"
  ),
];

List<PlayModel> plays = [
  PlayModel(
      title: "Dandiya Night",
      description: "description",
      bannerUrl: "assets/events/Event1.png",
      date: "date"
  ),
  PlayModel(
      title: "Sid id Kidding",
      description: "description",
      bannerUrl: "assets/events/Event2.png",
      date: "date"
  ),
  PlayModel(
      title: "Bassi",
      description: "description",
      bannerUrl: "assets/events/Event3.png",
      date: "date"
  ),
  PlayModel(
      title: "Gujarat 11",
      description: "description",
      bannerUrl: "assets/events/Event4.png",
      date: "date"
  ),
  PlayModel(
      title: "Vhalam",
      description: "description",
      bannerUrl: "assets/events/Event5.png",
      date: "date"
  ),
  PlayModel(
      title: "Viranjali",
      description: "description",
      bannerUrl: "assets/events/Event6.png",
      date: "date"
  ),
  PlayModel(
      title: "Gujarat Garba",
      description: "description",
      bannerUrl: "assets/events/Event7.png",
      date: "date"
  ),
];
