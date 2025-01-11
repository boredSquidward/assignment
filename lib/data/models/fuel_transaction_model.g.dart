// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fuel_transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FuelTransactionModel _$FuelTransactionModelFromJson(
        Map<String, dynamic> json) =>
    FuelTransactionModel(
      id: (json['id'] as num?)?.toInt(),
      externalId: json['externalId'] as String?,
      uuid: json['uuid'] as String?,
      hash: json['hash'] as String?,
      date: json['date'] as String?,
      processDate: json['processDate'] as String?,
      invoiceDate: json['invoiceDate'] as String?,
      cardNo: json['cardNo'] as String?,
      cardId: (json['cardId'] as num?)?.toInt(),
      orgId: (json['orgId'] as num?)?.toInt(),
      rcptNo: json['rcptNo'] as String?,
      driverName: json['driverName'] as String?,
      driverCardNo: json['driverCardNo'] as String?,
      odometer: json['odometer'] as String?,
      station: json['station'] as String?,
      productId: (json['productId'] as num?)?.toInt(),
      vehNo: json['vehNo'] as String?,
      unitPrice: json['unitPrice'] as String?,
      amount: json['amount'] as String?,
      volume: json['volume'] as String?,
      subsidy: json['subsidy'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      productName: json['productName'] as String?,
      orgName: json['orgName'] as String?,
      transactions: (json['transactions'] as List<dynamic>?)
          ?.map((e) => FuelTransactionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$FuelTransactionModelToJson(
        FuelTransactionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'externalId': instance.externalId,
      'uuid': instance.uuid,
      'hash': instance.hash,
      'date': instance.date,
      'processDate': instance.processDate,
      'invoiceDate': instance.invoiceDate,
      'cardNo': instance.cardNo,
      'cardId': instance.cardId,
      'orgId': instance.orgId,
      'rcptNo': instance.rcptNo,
      'driverName': instance.driverName,
      'driverCardNo': instance.driverCardNo,
      'odometer': instance.odometer,
      'station': instance.station,
      'productId': instance.productId,
      'vehNo': instance.vehNo,
      'unitPrice': instance.unitPrice,
      'amount': instance.amount,
      'volume': instance.volume,
      'subsidy': instance.subsidy,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'productName': instance.productName,
      'orgName': instance.orgName,
      'transactions': instance.transactions?.map((e) => e.toJson()).toList(),
      'total': instance.total,
    };
