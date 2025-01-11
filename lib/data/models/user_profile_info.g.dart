// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileInfo _$UserProfileInfoFromJson(Map<String, dynamic> json) =>
    UserProfileInfo(
      id: (json['id'] as num?)?.toInt(),
      tenantId: (json['tenantId'] as num?)?.toInt(),
      externalUserId: json['externalUserId'] as String?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      email: json['email'] as String?,
      mobile: json['mobile'] as String?,
      profilePicture: json['profilePicture'] == null
          ? null
          : ProfilePicture.fromJson(
              json['profilePicture'] as Map<String, dynamic>),
      accounts: (json['accounts'] as List<dynamic>?)
          ?.map((e) => Account.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      language: json['language'] as String?,
      identificationType: json['identificationType'] as String?,
      identificationNo: json['identificationNo'] as String?,
    );

Map<String, dynamic> _$UserProfileInfoToJson(UserProfileInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tenantId': instance.tenantId,
      'externalUserId': instance.externalUserId,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'email': instance.email,
      'mobile': instance.mobile,
      'profilePicture': instance.profilePicture?.toJson(),
      'accounts': instance.accounts?.map((e) => e.toJson()).toList(),
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'language': instance.language,
      'identificationType': instance.identificationType,
      'identificationNo': instance.identificationNo,
    };

ProfilePicture _$ProfilePictureFromJson(Map<String, dynamic> json) =>
    ProfilePicture(
      id: (json['id'] as num?)?.toInt(),
      uuid: json['uuid'] as String?,
      filename: json['filename'] as String?,
      link: json['link'] as String?,
      source: json['source'] as String?,
      sourceId: json['sourceId'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$ProfilePictureToJson(ProfilePicture instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'filename': instance.filename,
      'link': instance.link,
      'source': instance.source,
      'sourceId': instance.sourceId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      role: json['role'] == null
          ? null
          : Role.fromJson(json['role'] as Map<String, dynamic>),
      org: json['org'] == null
          ? null
          : Org.fromJson(json['org'] as Map<String, dynamic>),
      orgId: (json['orgId'] as num?)?.toInt(),
      roleId: (json['roleId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'role': instance.role?.toJson(),
      'org': instance.org?.toJson(),
      'orgId': instance.orgId,
      'roleId': instance.roleId,
    };

Role _$RoleFromJson(Map<String, dynamic> json) => Role(
      id: (json['id'] as num?)?.toInt(),
      tenantId: (json['tenantId'] as num?)?.toInt(),
      settings: json['settings'] as Map<String, dynamic>?,
      permissions: json['permissions'] as List<dynamic>?,
    );

Map<String, dynamic> _$RoleToJson(Role instance) => <String, dynamic>{
      'id': instance.id,
      'tenantId': instance.tenantId,
      'settings': instance.settings,
      'permissions': instance.permissions,
    };

Org _$OrgFromJson(Map<String, dynamic> json) => Org(
      id: (json['id'] as num?)?.toInt(),
      balanceThreshold: (json['balanceThreshold'] as num?)?.toInt(),
      name: json['name'] as String?,
      balance: (json['balance'] as num?)?.toDouble(),
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$OrgToJson(Org instance) => <String, dynamic>{
      'id': instance.id,
      'balanceThreshold': instance.balanceThreshold,
      'name': instance.name,
      'balance': instance.balance,
      'updatedAt': instance.updatedAt,
    };
