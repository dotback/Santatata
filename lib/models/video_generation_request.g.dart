// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_generation_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VideoGenerationRequestImpl _$$VideoGenerationRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$VideoGenerationRequestImpl(
      entranceImage: json['entranceImage'] as String,
      parentImage: json['parentImage'] as String,
      customPrompt: json['customPrompt'] as String,
    );

Map<String, dynamic> _$$VideoGenerationRequestImplToJson(
        _$VideoGenerationRequestImpl instance) =>
    <String, dynamic>{
      'entranceImage': instance.entranceImage,
      'parentImage': instance.parentImage,
      'customPrompt': instance.customPrompt,
    };
