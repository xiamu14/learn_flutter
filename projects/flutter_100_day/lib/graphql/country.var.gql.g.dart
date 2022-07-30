// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GQueryCountriesVars> _$gQueryCountriesVarsSerializer =
    new _$GQueryCountriesVarsSerializer();

class _$GQueryCountriesVarsSerializer
    implements StructuredSerializer<GQueryCountriesVars> {
  @override
  final Iterable<Type> types = const [
    GQueryCountriesVars,
    _$GQueryCountriesVars
  ];
  @override
  final String wireName = 'GQueryCountriesVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GQueryCountriesVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GQueryCountriesVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GQueryCountriesVarsBuilder().build();
  }
}

class _$GQueryCountriesVars extends GQueryCountriesVars {
  factory _$GQueryCountriesVars(
          [void Function(GQueryCountriesVarsBuilder)? updates]) =>
      (new GQueryCountriesVarsBuilder()..update(updates)).build();

  _$GQueryCountriesVars._() : super._();

  @override
  GQueryCountriesVars rebuild(
          void Function(GQueryCountriesVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GQueryCountriesVarsBuilder toBuilder() =>
      new GQueryCountriesVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GQueryCountriesVars;
  }

  @override
  int get hashCode {
    return 923812624;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('GQueryCountriesVars').toString();
  }
}

class GQueryCountriesVarsBuilder
    implements Builder<GQueryCountriesVars, GQueryCountriesVarsBuilder> {
  _$GQueryCountriesVars? _$v;

  GQueryCountriesVarsBuilder();

  @override
  void replace(GQueryCountriesVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GQueryCountriesVars;
  }

  @override
  void update(void Function(GQueryCountriesVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GQueryCountriesVars build() {
    final _$result = _$v ?? new _$GQueryCountriesVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
