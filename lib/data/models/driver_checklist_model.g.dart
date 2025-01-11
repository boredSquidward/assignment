// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_checklist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriverCheckListModel _$DriverCheckListModelFromJson(
        Map<String, dynamic> json) =>
    DriverCheckListModel(
      status: (json['status'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : DriverCheckListData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DriverCheckListModelToJson(
        DriverCheckListModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data?.toJson(),
    };

DriverCheckListData _$DriverCheckListDataFromJson(Map<String, dynamic> json) =>
    DriverCheckListData(
      sessions: (json['sessions'] as List<dynamic>?)
          ?.map((e) => Session.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: (json['count'] as num?)?.toInt(),
      criteria: json['criteria'] == null
          ? null
          : Criteria.fromJson(json['criteria'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DriverCheckListDataToJson(
        DriverCheckListData instance) =>
    <String, dynamic>{
      'sessions': instance.sessions?.map((e) => e.toJson()).toList(),
      'count': instance.count,
      'criteria': instance.criteria?.toJson(),
    };

Session _$SessionFromJson(Map<String, dynamic> json) => Session(
      id: (json['id'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      status: json['status'] as String?,
      startMileage: (json['startMileage'] as num?)?.toInt(),
      startTime: json['startTime'] as String?,
      endMileage: (json['endMileage'] as num?)?.toInt(),
      endMileagePhoto: json['endMileagePhoto'] == null
          ? null
          : MileagePhoto.fromJson(
              json['endMileagePhoto'] as Map<String, dynamic>),
      startMileagePhoto: json['startMileagePhoto'] == null
          ? null
          : MileagePhoto.fromJson(
              json['startMileagePhoto'] as Map<String, dynamic>),
      driver: json['driver'] == null
          ? null
          : Driver.fromJson(json['driver'] as Map<String, dynamic>),
      vehicle: json['vehicle'] == null
          ? null
          : Vehicle.fromJson(json['vehicle'] as Map<String, dynamic>),
      organization: json['organization'] == null
          ? null
          : Organization.fromJson(json['organization'] as Map<String, dynamic>),
      tasks: (json['tasks'] as List<dynamic>?)
          ?.map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList(),
      sysCheckoutTime: json['sysCheckoutTime'] as String?,
      expiredDateTime: json['expiredDateTime'] as String?,
      taskCompletionTime: json['taskCompletionTime'] as String?,
      attentionStatus: json['attentionStatus'] as String?,
      checkoutTime: json['checkoutTime'] as String?,
      allTaskEndorsed: json['allTaskEndorsed'] as bool?,
      checkIn: json['checkIn'] == null
          ? null
          : CheckLocation.fromJson(json['checkIn'] as Map<String, dynamic>),
      checkOut: json['checkOut'] == null
          ? null
          : CheckLocation.fromJson(json['checkOut'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SessionToJson(Session instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'status': instance.status,
      'startMileage': instance.startMileage,
      'startTime': instance.startTime,
      'endMileage': instance.endMileage,
      'endMileagePhoto': instance.endMileagePhoto?.toJson(),
      'startMileagePhoto': instance.startMileagePhoto?.toJson(),
      'driver': instance.driver?.toJson(),
      'vehicle': instance.vehicle?.toJson(),
      'organization': instance.organization?.toJson(),
      'tasks': instance.tasks?.map((e) => e.toJson()).toList(),
      'sysCheckoutTime': instance.sysCheckoutTime,
      'expiredDateTime': instance.expiredDateTime,
      'taskCompletionTime': instance.taskCompletionTime,
      'attentionStatus': instance.attentionStatus,
      'checkoutTime': instance.checkoutTime,
      'allTaskEndorsed': instance.allTaskEndorsed,
      'checkIn': instance.checkIn?.toJson(),
      'checkOut': instance.checkOut?.toJson(),
    };

MileagePhoto _$MileagePhotoFromJson(Map<String, dynamic> json) => MileagePhoto(
      id: (json['id'] as num?)?.toInt(),
      uuid: json['uuid'] as String?,
      filename: json['filename'] as String?,
      link: json['link'] as String?,
      source: json['source'] as String?,
      sourceId: json['sourceId'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$MileagePhotoToJson(MileagePhoto instance) =>
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

Driver _$DriverFromJson(Map<String, dynamic> json) => Driver(
      id: (json['id'] as num?)?.toInt(),
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      profilePicture: json['profilePicture'] == null
          ? null
          : MileagePhoto.fromJson(
              json['profilePicture'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DriverToJson(Driver instance) => <String, dynamic>{
      'id': instance.id,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'profilePicture': instance.profilePicture?.toJson(),
    };

Vehicle _$VehicleFromJson(Map<String, dynamic> json) => Vehicle(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      plateNo: json['plateNo'] as String?,
    );

Map<String, dynamic> _$VehicleToJson(Vehicle instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'plateNo': instance.plateNo,
    };

Organization _$OrganizationFromJson(Map<String, dynamic> json) => Organization(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$OrganizationToJson(Organization instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      id: (json['id'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      data: json['data'] == null
          ? null
          : TaskData.fromJson(json['data'] as Map<String, dynamic>),
      form: json['form'] == null
          ? null
          : TaskForm.fromJson(json['form'] as Map<String, dynamic>),
      clientUniqueId: json['clientUniqueId'] as String?,
      settings: json['settings'] == null
          ? null
          : TaskSettings.fromJson(json['settings'] as Map<String, dynamic>),
      attentionStatus: json['attentionStatus'] as String?,
      isEndorsed: json['isEndorsed'] as bool?,
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'data': instance.data?.toJson(),
      'form': instance.form?.toJson(),
      'clientUniqueId': instance.clientUniqueId,
      'settings': instance.settings?.toJson(),
      'attentionStatus': instance.attentionStatus,
      'isEndorsed': instance.isEndorsed,
    };

TaskData _$TaskDataFromJson(Map<String, dynamic> json) => TaskData(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => KeyValue.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TaskDataToJson(TaskData instance) => <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };

KeyValue _$KeyValueFromJson(Map<String, dynamic> json) => KeyValue(
      key: json['key'] as String?,
      value: json['value'] as bool?,
    );

Map<String, dynamic> _$KeyValueToJson(KeyValue instance) => <String, dynamic>{
      'key': instance.key,
      'value': instance.value,
    };

TaskForm _$TaskFormFromJson(Map<String, dynamic> json) => TaskForm(
      name: json['name'] as String?,
      lang: json['lang'] as String?,
      id: (json['id'] as num?)?.toInt(),
      type: json['type'] as String?,
    );

Map<String, dynamic> _$TaskFormToJson(TaskForm instance) => <String, dynamic>{
      'name': instance.name,
      'lang': instance.lang,
      'id': instance.id,
      'type': instance.type,
    };

TaskSettings _$TaskSettingsFromJson(Map<String, dynamic> json) => TaskSettings(
      unmatchedCount: (json['unmatchedCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TaskSettingsToJson(TaskSettings instance) =>
    <String, dynamic>{
      'unmatchedCount': instance.unmatchedCount,
    };

CheckLocation _$CheckLocationFromJson(Map<String, dynamic> json) =>
    CheckLocation(
      lat: json['lat'] as String?,
      lng: json['lng'] as String?,
    );

Map<String, dynamic> _$CheckLocationToJson(CheckLocation instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

Criteria _$CriteriaFromJson(Map<String, dynamic> json) => Criteria(
      pageNumber: (json['pageNumber'] as num?)?.toInt(),
      pageSize: (json['pageSize'] as num?)?.toInt(),
      orgId: (json['orgId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CriteriaToJson(Criteria instance) => <String, dynamic>{
      'pageNumber': instance.pageNumber,
      'pageSize': instance.pageSize,
      'orgId': instance.orgId,
    };
