// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_generation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VideoGenerationState {
  Uint8List? get entranceImage => throw _privateConstructorUsedError;
  Uint8List? get parentImage => throw _privateConstructorUsedError;
  String get customPrompt => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  String? get generatedVideoUrl => throw _privateConstructorUsedError;

  /// Create a copy of VideoGenerationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VideoGenerationStateCopyWith<VideoGenerationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoGenerationStateCopyWith<$Res> {
  factory $VideoGenerationStateCopyWith(VideoGenerationState value,
          $Res Function(VideoGenerationState) then) =
      _$VideoGenerationStateCopyWithImpl<$Res, VideoGenerationState>;
  @useResult
  $Res call(
      {Uint8List? entranceImage,
      Uint8List? parentImage,
      String customPrompt,
      bool isLoading,
      String? errorMessage,
      String? generatedVideoUrl});
}

/// @nodoc
class _$VideoGenerationStateCopyWithImpl<$Res,
        $Val extends VideoGenerationState>
    implements $VideoGenerationStateCopyWith<$Res> {
  _$VideoGenerationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VideoGenerationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entranceImage = freezed,
    Object? parentImage = freezed,
    Object? customPrompt = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
    Object? generatedVideoUrl = freezed,
  }) {
    return _then(_value.copyWith(
      entranceImage: freezed == entranceImage
          ? _value.entranceImage
          : entranceImage // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      parentImage: freezed == parentImage
          ? _value.parentImage
          : parentImage // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      customPrompt: null == customPrompt
          ? _value.customPrompt
          : customPrompt // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      generatedVideoUrl: freezed == generatedVideoUrl
          ? _value.generatedVideoUrl
          : generatedVideoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VideoGenerationStateImplCopyWith<$Res>
    implements $VideoGenerationStateCopyWith<$Res> {
  factory _$$VideoGenerationStateImplCopyWith(_$VideoGenerationStateImpl value,
          $Res Function(_$VideoGenerationStateImpl) then) =
      __$$VideoGenerationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Uint8List? entranceImage,
      Uint8List? parentImage,
      String customPrompt,
      bool isLoading,
      String? errorMessage,
      String? generatedVideoUrl});
}

/// @nodoc
class __$$VideoGenerationStateImplCopyWithImpl<$Res>
    extends _$VideoGenerationStateCopyWithImpl<$Res, _$VideoGenerationStateImpl>
    implements _$$VideoGenerationStateImplCopyWith<$Res> {
  __$$VideoGenerationStateImplCopyWithImpl(_$VideoGenerationStateImpl _value,
      $Res Function(_$VideoGenerationStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of VideoGenerationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entranceImage = freezed,
    Object? parentImage = freezed,
    Object? customPrompt = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
    Object? generatedVideoUrl = freezed,
  }) {
    return _then(_$VideoGenerationStateImpl(
      entranceImage: freezed == entranceImage
          ? _value.entranceImage
          : entranceImage // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      parentImage: freezed == parentImage
          ? _value.parentImage
          : parentImage // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      customPrompt: null == customPrompt
          ? _value.customPrompt
          : customPrompt // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      generatedVideoUrl: freezed == generatedVideoUrl
          ? _value.generatedVideoUrl
          : generatedVideoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$VideoGenerationStateImpl implements _VideoGenerationState {
  const _$VideoGenerationStateImpl(
      {this.entranceImage = null,
      this.parentImage = null,
      this.customPrompt = '',
      this.isLoading = false,
      this.errorMessage = null,
      this.generatedVideoUrl = null});

  @override
  @JsonKey()
  final Uint8List? entranceImage;
  @override
  @JsonKey()
  final Uint8List? parentImage;
  @override
  @JsonKey()
  final String customPrompt;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String? errorMessage;
  @override
  @JsonKey()
  final String? generatedVideoUrl;

  @override
  String toString() {
    return 'VideoGenerationState(entranceImage: $entranceImage, parentImage: $parentImage, customPrompt: $customPrompt, isLoading: $isLoading, errorMessage: $errorMessage, generatedVideoUrl: $generatedVideoUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoGenerationStateImpl &&
            const DeepCollectionEquality()
                .equals(other.entranceImage, entranceImage) &&
            const DeepCollectionEquality()
                .equals(other.parentImage, parentImage) &&
            (identical(other.customPrompt, customPrompt) ||
                other.customPrompt == customPrompt) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.generatedVideoUrl, generatedVideoUrl) ||
                other.generatedVideoUrl == generatedVideoUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(entranceImage),
      const DeepCollectionEquality().hash(parentImage),
      customPrompt,
      isLoading,
      errorMessage,
      generatedVideoUrl);

  /// Create a copy of VideoGenerationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoGenerationStateImplCopyWith<_$VideoGenerationStateImpl>
      get copyWith =>
          __$$VideoGenerationStateImplCopyWithImpl<_$VideoGenerationStateImpl>(
              this, _$identity);
}

abstract class _VideoGenerationState implements VideoGenerationState {
  const factory _VideoGenerationState(
      {final Uint8List? entranceImage,
      final Uint8List? parentImage,
      final String customPrompt,
      final bool isLoading,
      final String? errorMessage,
      final String? generatedVideoUrl}) = _$VideoGenerationStateImpl;

  @override
  Uint8List? get entranceImage;
  @override
  Uint8List? get parentImage;
  @override
  String get customPrompt;
  @override
  bool get isLoading;
  @override
  String? get errorMessage;
  @override
  String? get generatedVideoUrl;

  /// Create a copy of VideoGenerationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VideoGenerationStateImplCopyWith<_$VideoGenerationStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
