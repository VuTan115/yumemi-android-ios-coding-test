import 'package:json_annotation/json_annotation.dart';

part 'owner.g.dart';

@JsonSerializable(explicitToJson: true)
class Owner {
  final String ownerName;
  final String? ownerIcon;
  Owner({required this.ownerName, required this.ownerIcon});

  Owner.def()
      : ownerName = '',
        ownerIcon = '';

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);
  Map<String, dynamic> toJson() => _$OwnerToJson(this);
}
