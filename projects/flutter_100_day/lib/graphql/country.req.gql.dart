// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:flutter_100_day/graphql/country.ast.gql.dart' as _i5;
import 'package:flutter_100_day/graphql/country.data.gql.dart' as _i2;
import 'package:flutter_100_day/graphql/country.var.gql.dart' as _i3;
import 'package:flutter_100_day/graphql/serializers.gql.dart' as _i6;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'country.req.gql.g.dart';

abstract class GQueryCountriesReq
    implements
        Built<GQueryCountriesReq, GQueryCountriesReqBuilder>,
        _i1.OperationRequest<_i2.GQueryCountriesData, _i3.GQueryCountriesVars> {
  GQueryCountriesReq._();

  factory GQueryCountriesReq([Function(GQueryCountriesReqBuilder b) updates]) =
      _$GQueryCountriesReq;

  static void _initializeBuilder(GQueryCountriesReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'QueryCountries')
    ..executeOnListen = true;
  _i3.GQueryCountriesVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GQueryCountriesData? Function(
      _i2.GQueryCountriesData?, _i2.GQueryCountriesData?)? get updateResult;
  _i2.GQueryCountriesData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GQueryCountriesData? parseData(Map<String, dynamic> json) =>
      _i2.GQueryCountriesData.fromJson(json);
  static Serializer<GQueryCountriesReq> get serializer =>
      _$gQueryCountriesReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GQueryCountriesReq.serializer, this)
          as Map<String, dynamic>);
  static GQueryCountriesReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GQueryCountriesReq.serializer, json);
}
