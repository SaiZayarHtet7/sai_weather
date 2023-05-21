import '../../../domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'condition_model.g.dart';

@JsonSerializable()
class ConditionModel implements Condition {
  @override
  final int code;

  @override
  final String icon;

  @override
  final String text;

  ConditionModel(this.code, this.icon, this.text);

  factory ConditionModel.fromJson(Map<String, dynamic> json) =>
      _$ConditionModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionModelToJson(this);
}
