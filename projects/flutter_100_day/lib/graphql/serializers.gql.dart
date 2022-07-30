import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart' show StandardJsonPlugin;
import 'package:flutter_100_day/graphql/country.data.gql.dart'
    show GQueryCountriesData, GQueryCountriesData_countries;
import 'package:flutter_100_day/graphql/country.req.gql.dart'
    show GQueryCountriesReq;
import 'package:flutter_100_day/graphql/country.var.gql.dart'
    show GQueryCountriesVars;
import 'package:flutter_100_day/graphql/schema.schema.gql.dart'
    show
        GCacheControlScope,
        GContinentFilterInput,
        GCountryFilterInput,
        GLanguageFilterInput,
        GStringQueryOperatorInput,
        GUpload;
import 'package:gql_code_builder/src/serializers/operation_serializer.dart'
    show OperationSerializer;

part 'serializers.gql.g.dart';

final SerializersBuilder _serializersBuilder = _$serializers.toBuilder()
  ..add(OperationSerializer())
  ..addPlugin(StandardJsonPlugin());
@SerializersFor([
  GCacheControlScope,
  GContinentFilterInput,
  GCountryFilterInput,
  GLanguageFilterInput,
  GQueryCountriesData,
  GQueryCountriesData_countries,
  GQueryCountriesReq,
  GQueryCountriesVars,
  GStringQueryOperatorInput,
  GUpload
])
final Serializers serializers = _serializersBuilder.build();
