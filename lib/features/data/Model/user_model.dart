
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';
@JsonSerializable()
class UserModel{
  final List<UserResult>? userResult;
  UserModel({
     this.userResult
});
  factory UserModel.fromJson(Map<String,dynamic> json)=>_$UserModelFromJson(json);
  Map<String,dynamic> toJson()=>_$UserModelToJson(this);
}

@JsonSerializable()
class UserResult{
  final int id;
  final String name;
  final String username;
  final String email;
  final Address? address;
  final String phone;
  final String website;
  final Company? company;

  UserResult({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.username,
    required this.company,
    required this.phone,
    required this.website
});
  factory UserResult.fromJson(Map<String,dynamic> json)=>_$UserResultFromJson(json);
  Map<String,dynamic> toJson()=>_$UserResultToJson(this);
}
@JsonSerializable()
class Address{
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
  factory Address.fromJson(Map<String,dynamic> json)=>_$AddressFromJson(json);
  Map<String,dynamic> toJson()=>_$AddressToJson(this);
}
@JsonSerializable()
class Geo{
  final String lat;
  final String long;

  Geo({
    required this.long,
    required this.lat
});
  factory Geo.fromJson(Map<String,dynamic> json)=>_$GeoFromJson(json);
  Map<String,dynamic> toJson()=>_$GeoToJson(this);
}
@JsonSerializable()
class Company{
  final String name;
  final String catchPhrase;
  final String bs;
  Company({
    required this.name,
    required this.bs,
    required this.catchPhrase
});
  factory Company.fromJson(Map<String,dynamic> json)=>_$CompanyFromJson(json);
  Map<String,dynamic> toJson()=>_$CompanyToJson(this);
}