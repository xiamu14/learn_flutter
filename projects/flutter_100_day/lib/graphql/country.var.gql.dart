// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_100_day/graphql/serializers.gql.dart' as _i1;

part 'country.var.gql.g.dart';

abstract class GQueryCountriesVars
    implements Built<GQueryCountriesVars, GQueryCountriesVarsBuilder> {
  GQueryCountriesVars._();

  factory GQueryCountriesVars(
      [Function(GQueryCountriesVarsBuilder b) updates]) = _$GQueryCountriesVars;

  static Serializer<GQueryCountriesVars> get serializer =>
      _$gQueryCountriesVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GQueryCountriesVars.serializer, this)
          as Map<String, dynamic>);
  static GQueryCountriesVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GQueryCountriesVars.serializer, json);
}
