class UserModelEntity {
  final List<UserResultEntity>? userResult;

  UserModelEntity({
    required this.userResult
  });
}
class UserResultEntity {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address? address;
  final String phone;
  final String website;
  final Company? company;

  UserResultEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.username,
    required this.company,
    required this.phone,
    required this.website
  });
}

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo geo;

  Address({
    required this.city,
    required this.street,
    required this.suite,
    required this.zipcode,
    required this.geo
  });
}
class Company {
  final String name;
  final String catchPhrase;
  final String bs;

  Company({
    required this.name,
    required this.bs,
    required this.catchPhrase
  });
}
class Geo {
  final String lat;
  final String long;

  Geo({
    required this.long,
    required this.lat
  });
}