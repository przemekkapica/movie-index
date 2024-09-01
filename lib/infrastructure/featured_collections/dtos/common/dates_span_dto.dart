import 'package:freezed_annotation/freezed_annotation.dart';

part 'dates_span_dto.g.dart';

@JsonSerializable(createToJson: false)
class DatesSpanDTO {
  DatesSpanDTO({
    required this.minimum,
    required this.maximum,
  });

  factory DatesSpanDTO.fromJson(Map<String, dynamic> json) =>
      _$DatesSpanDTOFromJson(json);

  final String minimum;
  final String maximum;
}
