import 'package:json_annotation/json_annotation.dart';

part 'user_profile_info.g.dart';

@JsonSerializable(explicitToJson: true)
class UserProfileInfo {
  final int? id;
  final int? tenantId;
  final String? externalUserId;
  final String? firstname;
  final String? lastname;
  final String? email;
  final String? mobile;
  final ProfilePicture? profilePicture;
  final List<Account>? accounts;
  final String? createdAt;
  final String? updatedAt;
  final String? language;
  final String? identificationType;
  final String? identificationNo;

  UserProfileInfo({
    this.id,
    this.tenantId,
    this.externalUserId,
    this.firstname,
    this.lastname,
    this.email,
    this.mobile,
    this.profilePicture,
    this.accounts,
    this.createdAt,
    this.updatedAt,
    this.language,
    this.identificationType,
    this.identificationNo,
  });

  factory UserProfileInfo.fromJson(Map<String, dynamic> json) =>
      _$UserProfileInfoFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileInfoToJson(this);
}

@JsonSerializable()
class ProfilePicture {
  final int? id;
  final String? uuid;
  final String? filename;
  final String? link;
  final String? source;
  final String? sourceId;
  final String? createdAt;
  final String? updatedAt;

  ProfilePicture({
    this.id,
    this.uuid,
    this.filename,
    this.link,
    this.source,
    this.sourceId,
    this.createdAt,
    this.updatedAt,
  });

  factory ProfilePicture.fromJson(Map<String, dynamic> json) =>
      _$ProfilePictureFromJson(json);

  Map<String, dynamic> toJson() => _$ProfilePictureToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Account {
  final Role? role;
  final Org? org;
  final int? orgId;
  final int? roleId;

  Account({
    this.role,
    this.org,
    this.orgId,
    this.roleId,
  });

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);
}

@JsonSerializable()
class Role {
  final int? id;
  final int? tenantId;
  final Map<String, dynamic>? settings;
  final List<dynamic>? permissions;

  Role({
    this.id,
    this.tenantId,
    this.settings,
    this.permissions,
  });

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);

  Map<String, dynamic> toJson() => _$RoleToJson(this);
}

@JsonSerializable()
class Org {
  final int? id;
  final int? balanceThreshold;
  final String? name;
  final double? balance;
  final String? updatedAt;

  Org({
    this.id,
    this.balanceThreshold,
    this.name,
    this.balance,
    this.updatedAt,
  });

  factory Org.fromJson(Map<String, dynamic> json) => _$OrgFromJson(json);

  Map<String, dynamic> toJson() => _$OrgToJson(this);
}
