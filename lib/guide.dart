class Guide {
  String name;
  String language;
  String city;
  String country;
  String phoneNumber;
  String emailAddress;
  String avatarUrl = "http://lorempixel.com/200/200/people";

  Guide(String name, String language, String city, String country, String phoneNumber, String emailAddress) {
    this.name = name;
    this.language = language;
    this.city = city;
    this.country = country;
    this.phoneNumber = phoneNumber;
    this.emailAddress = emailAddress;
  }
}