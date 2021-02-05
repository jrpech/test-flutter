// GENERATED CODE - DO NOT MODIFY BY HAND

part of cast;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cast _$CastFromJson(Map<String, dynamic> json) {
  return Cast(
    json['label'] as String,
    (json['value'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$CastToJson(Cast instance) => <String, dynamic>{
      'label': instance.label,
      'value': instance.value,
    };
