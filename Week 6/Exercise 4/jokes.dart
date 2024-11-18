class Joke {
  String title;
  String description;
  bool isFavorite;

  Joke({
    required this.title,
    required this.description,
    this.isFavorite = false,
  });
}

List<Joke> jokes = [
  Joke(
    title: "Kal na chob sl ke mnek eng",
    description: "Because u cant",
  ),
  Joke(
    title: "Apateu",
    description: "uh huh huh huh huh",
  ),
];
