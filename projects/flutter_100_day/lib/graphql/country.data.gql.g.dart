// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GQueryCountriesData> _$gQueryCountriesDataSerializer =
    new _$GQueryCountriesDataSerializer();
Serializer<GQueryCountriesData_countries>
    _$gQueryCountriesDataCountriesSerializer =
    new _$GQueryCountriesData_countriesSerializer();

class _$GQueryCountriesDataSerializer
    implements StructuredSerializer<GQueryCountriesData> {
  @override
  final Iterable<Type> types = const [
    GQueryCountriesData,
    _$GQueryCountriesData
  ];
  @override
  final String wireName = 'GQueryCountriesData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GQueryCountriesData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'countries',
      serializers.serialize(object.countries,
          specifiedType: const FullType(BuiltList,
              const [const FullType(GQueryCountriesData_countries)])),
    ];

    return result;
  }

  @override
  GQueryCountriesData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GQueryCountriesDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'countries':
          result.countries.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GQueryCountriesData_countries)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GQueryCountriesData_countriesSerializer
    implements StructuredSerializer<GQueryCountriesData_countries> {
  @override
  final Iterable<Type> types = const [
    GQueryCountriesData_countries,
    _$GQueryCountriesData_countries
  ];
  @override
  final String wireName = 'GQueryCountriesData_countries';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GQueryCountriesData_countries object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'code',
      serializers.serialize(object.code, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'emoji',
      serializers.serialize(object.emoji,
          specifiedType: const FullType(String)),
      'native',
      serializers.serialize(object.native,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GQueryCountriesData_countries deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GQueryCountriesData_countriesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'code':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'emoji':
          result.emoji = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'native':
          result.native = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GQueryCountriesData extends GQueryCountriesData {
  @override
  final String G__typename;
  @override
  final BuiltList<GQueryCountriesData_countries> countries;

  factory _$GQueryCountriesData(
          [void Function(GQueryCountriesDataBuilder)? updates]) =>
      (new GQueryCountriesDataBuilder()..update(updates)).build();

  _$GQueryCountriesData._({required this.G__typename, required this.countries})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GQueryCountriesData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        countries, 'GQueryCountriesData', 'countries');
  }

  @override
  GQueryCountriesData rebuild(
          void Function(GQueryCountriesDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GQueryCountriesDataBuilder toBuilder() =>
      new GQueryCountriesDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GQueryCountriesData &&
        G__typename == other.G__typename &&
        countries == other.countries;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), countries.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GQueryCountriesData')
          ..add('G__typename', G__typename)
          ..add('countries', countries))
        .toString();
  }
}

class GQueryCountriesDataBuilder
    implements Builder<GQueryCountriesData, GQueryCountriesDataBuilder> {
  _$GQueryCountriesData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GQueryCountriesData_countries>? _countries;
  ListBuilder<GQueryCountriesData_countries> get countries =>
      _$this._countries ??= new ListBuilder<GQueryCountriesData_countries>();
  set countries(ListBuilder<GQueryCountriesData_countries>? countries) =>
      _$this._countries = countries;

  GQueryCountriesDataBuilder() {
    GQueryCountriesData._initializeBuilder(this);
  }

  GQueryCountriesDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _countries = $v.countries.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GQueryCountriesData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GQueryCountriesData;
  }

  @override
  void update(void Function(GQueryCountriesDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GQueryCountriesData build() {
    _$GQueryCountriesData _$result;
    try {
      _$result = _$v ??
          new _$GQueryCountriesData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, 'GQueryCountriesData', 'G__typename'),
              countries: countries.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'countries';
        countries.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GQueryCountriesData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GQueryCountriesData_countries extends GQueryCountriesData_countries {
  @override
  final String G__typename;
  @override
  final String code;
  @override
  final String name;
  @override
  final String emoji;
  @override
  final String native;

  factory _$GQueryCountriesData_countries(
          [void Function(GQueryCountriesData_countriesBuilder)? updates]) =>
      (new GQueryCountriesData_countriesBuilder()..update(updates)).build();

  _$GQueryCountriesData_countries._(
      {required this.G__typename,
      required this.code,
      required this.name,
      required this.emoji,
      required this.native})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GQueryCountriesData_countries', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        code, 'GQueryCountriesData_countries', 'code');
    BuiltValueNullFieldError.checkNotNull(
        name, 'GQueryCountriesData_countries', 'name');
    BuiltValueNullFieldError.checkNotNull(
        emoji, 'GQueryCountriesData_countries', 'emoji');
    BuiltValueNullFieldError.checkNotNull(
        native, 'GQueryCountriesData_countries', 'native');
  }

  @override
  GQueryCountriesData_countries rebuild(
          void Function(GQueryCountriesData_countriesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GQueryCountriesData_countriesBuilder toBuilder() =>
      new GQueryCountriesData_countriesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GQueryCountriesData_countries &&
        G__typename == other.G__typename &&
        code == other.code &&
        name == other.name &&
        emoji == other.emoji &&
        native == other.native;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, G__typename.hashCode), code.hashCode),
                name.hashCode),
            emoji.hashCode),
        native.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GQueryCountriesData_countries')
          ..add('G__typename', G__typename)
          ..add('code', code)
          ..add('name', name)
          ..add('emoji', emoji)
          ..add('native', native))
        .toString();
  }
}

class GQueryCountriesData_countriesBuilder
    implements
        Builder<GQueryCountriesData_countries,
            GQueryCountriesData_countriesBuilder> {
  _$GQueryCountriesData_countries? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _emoji;
  String? get emoji => _$this._emoji;
  set emoji(String? emoji) => _$this._emoji = emoji;

  String? _native;
  String? get native => _$this._native;
  set native(String? native) => _$this._native = native;

  GQueryCountriesData_countriesBuilder() {
    GQueryCountriesData_countries._initializeBuilder(this);
  }

  GQueryCountriesData_countriesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _code = $v.code;
      _name = $v.name;
      _emoji = $v.emoji;
      _native = $v.native;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GQueryCountriesData_countries other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GQueryCountriesData_countries;
  }

  @override
  void update(void Function(GQueryCountriesData_countriesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GQueryCountriesData_countries build() {
    final _$result = _$v ??
        new _$GQueryCountriesData_countries._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, 'GQueryCountriesData_countries', 'G__typename'),
            code: BuiltValueNullFieldError.checkNotNull(
                code, 'GQueryCountriesData_countries', 'code'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, 'GQueryCountriesData_countries', 'name'),
            emoji: BuiltValueNullFieldError.checkNotNull(
                emoji, 'GQueryCountriesData_countries', 'emoji'),
            native: BuiltValueNullFieldError.checkNotNull(
                native, 'GQueryCountriesData_countries', 'native'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
