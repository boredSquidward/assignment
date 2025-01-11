import 'package:json_annotation/json_annotation.dart';

part 'fuel_transaction_model.g.dart';

@JsonSerializable(explicitToJson: true)
class FuelTransactionModel {
  final int? id;
  final String? externalId;
  final String? uuid;
  final String? hash;
  final String? date;
  final String? processDate;
  final String? invoiceDate;
  final String? cardNo;
  final int? cardId;
  final int? orgId;
  final String? rcptNo;
  final String? driverName;
  final String? driverCardNo;
  final String? odometer;
  final String? station;
  final int? productId;
  final String? vehNo;
  final String? unitPrice;
  final String? amount;
  final String? volume;
  final String? subsidy;
  final String? createdAt;
  final String? updatedAt;
  final String? productName;
  final String? orgName;

  final List<FuelTransactionModel>? transactions;
  final int? total;

  FuelTransactionModel({
    this.id,
    this.externalId,
    this.uuid,
    this.hash,
    this.date,
    this.processDate,
    this.invoiceDate,
    this.cardNo,
    this.cardId,
    this.orgId,
    this.rcptNo,
    this.driverName,
    this.driverCardNo,
    this.odometer,
    this.station,
    this.productId,
    this.vehNo,
    this.unitPrice,
    this.amount,
    this.volume,
    this.subsidy,
    this.createdAt,
    this.updatedAt,
    this.productName,
    this.orgName,
    this.transactions,
    this.total,
  });

  factory FuelTransactionModel.fromJson(Map<String, dynamic> json) =>
      _$FuelTransactionModelFromJson(json);

  Map<String, dynamic> toJson() => _$FuelTransactionModelToJson(this);
}
