// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardModel _$DashboardModelFromJson(Map<String, dynamic> json) =>
    DashboardModel(
      balance: json['balance'] == null
          ? null
          : Balance.fromJson(json['balance'] as Map<String, dynamic>),
      usage: json['usage'] == null
          ? null
          : Usage.fromJson(json['usage'] as Map<String, dynamic>),
      cards: json['cards'] == null
          ? null
          : Cards.fromJson(json['cards'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DashboardModelToJson(DashboardModel instance) =>
    <String, dynamic>{
      'balance': instance.balance?.toJson(),
      'usage': instance.usage?.toJson(),
      'cards': instance.cards?.toJson(),
    };

Balance _$BalanceFromJson(Map<String, dynamic> json) => Balance(
      id: (json['id'] as num?)?.toInt(),
      balanceThreshold: (json['balanceThreshold'] as num?)?.toInt(),
      name: json['name'] as String?,
      updatedAt: json['updatedAt'] as String?,
      balance: (json['balance'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$BalanceToJson(Balance instance) => <String, dynamic>{
      'id': instance.id,
      'balanceThreshold': instance.balanceThreshold,
      'name': instance.name,
      'updatedAt': instance.updatedAt,
      'balance': instance.balance,
    };

Usage _$UsageFromJson(Map<String, dynamic> json) => Usage(
      current: json['current'] == null
          ? null
          : UsageDetails.fromJson(json['current'] as Map<String, dynamic>),
      prevMonth: json['prevMonth'] == null
          ? null
          : UsageDetails.fromJson(json['prevMonth'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UsageToJson(Usage instance) => <String, dynamic>{
      'current': instance.current?.toJson(),
      'prevMonth': instance.prevMonth?.toJson(),
    };

UsageDetails _$UsageDetailsFromJson(Map<String, dynamic> json) => UsageDetails(
      volume: (json['volume'] as num?)?.toDouble(),
      amount: (json['amount'] as num?)?.toDouble(),
      trxnCount: (json['trxnCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UsageDetailsToJson(UsageDetails instance) =>
    <String, dynamic>{
      'volume': instance.volume,
      'amount': instance.amount,
      'trxnCount': instance.trxnCount,
    };

Cards _$CardsFromJson(Map<String, dynamic> json) => Cards(
      total: (json['total'] as num?)?.toInt(),
      active: (json['active'] as num?)?.toInt(),
      frozen: (json['frozen'] as num?)?.toInt(),
      deactivated: (json['deactivated'] as num?)?.toInt(),
      suspended: (json['suspended'] as num?)?.toInt(),
      expired: (json['expired'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CardsToJson(Cards instance) => <String, dynamic>{
      'total': instance.total,
      'active': instance.active,
      'frozen': instance.frozen,
      'deactivated': instance.deactivated,
      'suspended': instance.suspended,
      'expired': instance.expired,
    };
