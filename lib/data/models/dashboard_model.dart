import 'package:json_annotation/json_annotation.dart';

part 'dashboard_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DashboardModel {
  final Balance? balance;
  final Usage? usage;
  final Cards? cards;

  DashboardModel({
    this.balance,
    this.usage,
    this.cards,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardModelFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardModelToJson(this);
}

@JsonSerializable()
class Balance {
  final int? id;
  final int? balanceThreshold;
  final String? name;
  final String? updatedAt;
  final double? balance;

  Balance({
    this.id,
    this.balanceThreshold,
    this.name,
    this.updatedAt,
    this.balance,
  });

  factory Balance.fromJson(Map<String, dynamic> json) =>
      _$BalanceFromJson(json);

  Map<String, dynamic> toJson() => _$BalanceToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Usage {
  final UsageDetails? current;
  final UsageDetails? prevMonth;

  Usage({
    this.current,
    this.prevMonth,
  });

  factory Usage.fromJson(Map<String, dynamic> json) => _$UsageFromJson(json);

  Map<String, dynamic> toJson() => _$UsageToJson(this);
}

@JsonSerializable()
class UsageDetails {
  final double? volume;
  final double? amount;
  final int? trxnCount;

  UsageDetails({
    this.volume,
    this.amount,
    this.trxnCount,
  });

  factory UsageDetails.fromJson(Map<String, dynamic> json) =>
      _$UsageDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$UsageDetailsToJson(this);
}

@JsonSerializable()
class Cards {
  final int? total;
  final int? active;
  final int? frozen;
  final int? deactivated;
  final int? suspended;
  final int? expired;

  Cards({
    this.total,
    this.active,
    this.frozen,
    this.deactivated,
    this.suspended,
    this.expired,
  });

  factory Cards.fromJson(Map<String, dynamic> json) => _$CardsFromJson(json);

  Map<String, dynamic> toJson() => _$CardsToJson(this);
}
