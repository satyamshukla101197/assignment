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
  final AddressEntity? address;
  final String phone;
  final String website;
  final CompanyEntity? company;

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

class AddressEntity {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final GeoEntity geo;

  AddressEntity({
    required this.city,
    required this.street,
    required this.suite,
    required this.zipcode,
    required this.geo
  });
}
class CompanyEntity {
  final String name;
  final String catchPhrase;
  final String bs;

  CompanyEntity({
    required this.name,
    required this.bs,
    required this.catchPhrase
  });
}
class GeoEntity {
  final String lat;
  final String long;

  GeoEntity({
    required this.long,
    required this.lat
  });
}