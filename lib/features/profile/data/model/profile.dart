import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

@freezed
abstract class Profile with _$Profile {
  factory Profile({
    required int id,
    required String email,
    required String username,
    required String phone,
    required Name name,
    required Address address,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}

@freezed
abstract class Name with _$Name {
  factory Name({required String firstname, required String lastname}) = _Name;
  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);
}

@freezed
abstract class Address with _$Address {
  factory Address({
    required String city,
    required String street,
    required double number,
    required String zipcode,
    required GeoLocation geolocation,
  }) = _Address;
  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}

@freezed
abstract class GeoLocation with _$GeoLocation {
  factory GeoLocation({required String lat, required String long}) =
      _GeoLocation;
  factory GeoLocation.fromJson(Map<String, dynamic> json) =>
      _$GeoLocationFromJson(json);
}
