// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_100_day/graphql/serializers.gql.dart' as _i1;

part 'country.data.gql.g.dart';

abstract class GQueryCountriesData
    implements Built<GQueryCountriesData, GQueryCountriesDataBuilder> {
  GQueryCountriesData._();

  factory GQueryCountriesData(
      [Function(GQueryCountriesDataBuilder b) updates]) = _$GQueryCountriesData;

  static void _initializeBuilder(GQueryCountriesDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GQueryCountriesData_countries> get countries;
  static Serializer<GQueryCountriesData> get serializer =>
      _$gQueryCountriesDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GQueryCountriesData.serializer, this)
          as Map<String, dynamic>);
  static GQueryCountriesData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GQueryCountriesData.serializer, json);
}

abstract class GQueryCountriesData_countries
    implements
        Built<GQueryCountriesData_countries,
            GQueryCountriesData_countriesBuilder> {
  GQueryCountriesData_countries._();

  factory GQueryCountriesData_countries(
          [Function(GQueryCountriesData_countriesBuilder b) updates]) =
      _$GQueryCountriesData_countries;

  static void _initializeBuilder(GQueryCountriesData_countriesBuilder b) =>
      b..G__typename = 'Country';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get code;
  String get name;
  String get emoji;
  String get native;
  static Serializer<GQueryCountriesData_countries> get serializer =>
      _$gQueryCountriesDataCountriesSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GQueryCountriesData_countries.serializer, this) as Map<String, dynamic>);
  static GQueryCountriesData_countries? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GQueryCountriesData_countries.serializer, json);
}
