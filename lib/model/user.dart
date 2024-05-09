class User {
  String? name;
  int? age;
  String? location;
  List<String>? jobs;
  List<String>? serie;

  User(
    {this.name, this.age, this.location, this.jobs = const [], this.serie = const []});
}