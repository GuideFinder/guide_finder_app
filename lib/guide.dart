class Guide {
  String name;
  String language;
  String city;
  String country;
  String phoneNumber;
  String emailAddress;
  String avatarUrl = "https://avatars0.githubusercontent.com/u/66577?s=400&v=4";
  String introduction = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.";

  Guide(String name, String language, String city, String country, String phoneNumber, String emailAddress) {
    this.name = name;
    this.language = language;
    this.city = city;
    this.country = country;
    this.phoneNumber = phoneNumber;
    this.emailAddress = emailAddress;
  }
}