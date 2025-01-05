// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_generation_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VideoGenerationRequest _$VideoGenerationRequestFromJson(
    Map<String, dynamic> json) {
  return _VideoGenerationRequest.fromJson(json);
}

/// @nodoc
mixin _$VideoGenerationRequest {
  String get entranceImage =>
      throw _privateConstructorUsedError; // base64エンコードされた画像
  String get parentImage =>
      throw _privateConstructorUsedError; // base64エンコードされた画像
  String get customPrompt => throw _privateConstructorUsedError;

  /// Serializes this VideoGenerationRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VideoGenerationRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VideoGenerationRequestCopyWith<VideoGenerationRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoGenerationRequestCopyWith<$Res> {
  factory $VideoGenerationRequestCopyWith(VideoGenerationRequest value,
          $Res Function(VideoGenerationRequest) then) =
      _$VideoGenerationRequestCopyWithImpl<$Res, VideoGenerationRequest>;
  @useResult
  $Res call({String entranceImage, String parentImage, String customPrompt});
}

/// @nodoc
class _$VideoGenerationRequestCopyWithImpl<$Res,
        $Val extends VideoGenerationRequest>
    implements $VideoGenerationRequestCopyWith<$Res> {
  _$VideoGenerationRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VideoGenerationRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entranceImage = null,
    Object? parentImage = null,
    Object? customPrompt = null,
  }) {
    return _then(_value.copyWith(
      entranceImage: null == entranceImage
          ? _value.entranceImage
          : entranceImage // ignore: cast_nullable_to_non_nullable
              as String,
      parentImage: null == parentImage
          ? _value.parentImage
          : parentImage // ignore: cast_nullable_to_non_nullable
              as String,
      customPrompt: null == customPrompt
          ? _value.customPrompt
          : customPrompt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VideoGenerationRequestImplCopyWith<$Res>
    implements $VideoGenerationRequestCopyWith<$Res> {
  factory _$$VideoGenerationRequestImplCopyWith(
          _$VideoGenerationRequestImpl value,
          $Res Function(_$VideoGenerationRequestImpl) then) =
      __$$VideoGenerationRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String entranceImage, String parentImage, String customPrompt});
}

/// @nodoc
class __$$VideoGenerationRequestImplCopyWithImpl<$Res>
    extends _$VideoGenerationRequestCopyWithImpl<$Res,
        _$VideoGenerationRequestImpl>
    implements _$$VideoGenerationRequestImplCopyWith<$Res> {
  __$$VideoGenerationRequestImplCopyWithImpl(
      _$VideoGenerationRequestImpl _value,
      $Res Function(_$VideoGenerationRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of VideoGenerationRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entranceImage = null,
    Object? parentImage = null,
    Object? customPrompt = null,
  }) {
    return _then(_$VideoGenerationRequestImpl(
      entranceImage: null == entranceImage
          ? _value.entranceImage
          : entranceImage // ignore: cast_nullable_to_non_nullable
              as String,
      parentImage: null == parentImage
          ? _value.parentImage
          : parentImage // ignore: cast_nullable_to_non_nullable
              as String,
      customPrompt: null == customPrompt
          ? _value.customPrompt
          : customPrompt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VideoGenerationRequestImpl implements _VideoGenerationRequest {
  const _$VideoGenerationRequestImpl(
      {required this.entranceImage,
      required this.parentImage,
      required this.customPrompt});

  factory _$VideoGenerationRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$VideoGenerationRequestImplFromJson(json);

  @override
  final String entranceImage;
// base64エンコードされた画像
  @override
  final String parentImage;
// base64エンコードされた画像
  @override
  final String customPrompt;

  @override
  String toString() {
    return 'VideoGenerationRequest(entranceImage: $entranceImage, parentImage: $parentImage, customPrompt: $customPrompt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoGenerationRequestImpl &&
            (identical(other.entranceImage, entranceImage) ||
                other.entranceImage == entranceImage) &&
            (identical(other.parentImage, parentImage) ||
                other.parentImage == parentImage) &&
            (identical(other.customPrompt, customPrompt) ||
                other.customPrompt == customPrompt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, entranceImage, parentImage, customPrompt);

  /// Create a copy of VideoGenerationRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoGenerationRequestImplCopyWith<_$VideoGenerationRequestImpl>
      get copyWith => __$$VideoGenerationRequestImplCopyWithImpl<
          _$VideoGenerationRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VideoGenerationRequestImplToJson(
      this,
    );
  }
}

abstract class _VideoGenerationRequest implements VideoGenerationRequest {
  const factory _VideoGenerationRequest(
      {required final String entranceImage,
      required final String parentImage,
      required final String customPrompt}) = _$VideoGenerationRequestImpl;

  factory _VideoGenerationRequest.fromJson(Map<String, dynamic> json) =
      _$VideoGenerationRequestImpl.fromJson;

  @override
  String get entranceImage; // base64エンコードされた画像
  @override
  String get parentImage; // base64エンコードされた画像
  @override
  String get customPrompt;

  /// Create a copy of VideoGenerationRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VideoGenerationRequestImplCopyWith<_$VideoGenerationRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
