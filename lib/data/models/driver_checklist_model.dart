import 'package:json_annotation/json_annotation.dart';

part 'driver_checklist_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DriverCheckListModel {
  final int? status;
  final String? message;
  final DriverCheckListData? data;

  DriverCheckListModel({this.status, this.message, this.data});

  factory DriverCheckListModel.fromJson(Map<String, dynamic> json) =>
      _$DriverCheckListModelFromJson(json);

  Map<String, dynamic> toJson() => _$DriverCheckListModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DriverCheckListData {
  final List<Session>? sessions;
  final int? count;
  final Criteria? criteria;

  DriverCheckListData({this.sessions, this.count, this.criteria});

  factory DriverCheckListData.fromJson(Map<String, dynamic> json) =>
      _$DriverCheckListDataFromJson(json);

  Map<String, dynamic> toJson() => _$DriverCheckListDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Session {
  final int? id;
  final String? createdAt;
  final String? status;
  final int? startMileage;
  final String? startTime;
  final int? endMileage;
  final MileagePhoto? endMileagePhoto;
  final MileagePhoto? startMileagePhoto;
  final Driver? driver;
  final Vehicle? vehicle;
  final Organization? organization;
  final List<Task>? tasks;
  final String? sysCheckoutTime;
  final String? expiredDateTime;
  final String? taskCompletionTime;
  final String? attentionStatus;
  final String? checkoutTime;
  final bool? allTaskEndorsed;
  final CheckLocation? checkIn;
  final CheckLocation? checkOut;

  Session({
    this.id,
    this.createdAt,
    this.status,
    this.startMileage,
    this.startTime,
    this.endMileage,
    this.endMileagePhoto,
    this.startMileagePhoto,
    this.driver,
    this.vehicle,
    this.organization,
    this.tasks,
    this.sysCheckoutTime,
    this.expiredDateTime,
    this.taskCompletionTime,
    this.attentionStatus,
    this.checkoutTime,
    this.allTaskEndorsed,
    this.checkIn,
    this.checkOut,
  });

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);

  Map<String, dynamic> toJson() => _$SessionToJson(this);
}

@JsonSerializable()
class MileagePhoto {
  final int? id;
  final String? uuid;
  final String? filename;
  final String? link;
  final String? source;
  final String? sourceId;
  final String? createdAt;
  final String? updatedAt;

  MileagePhoto({
    this.id,
    this.uuid,
    this.filename,
    this.link,
    this.source,
    this.sourceId,
    this.createdAt,
    this.updatedAt,
  });

  factory MileagePhoto.fromJson(Map<String, dynamic> json) =>
      _$MileagePhotoFromJson(json);

  Map<String, dynamic> toJson() => _$MileagePhotoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Driver {
  final int? id;
  final String? firstname;
  final String? lastname;
  final MileagePhoto? profilePicture;

  Driver({this.id, this.firstname, this.lastname, this.profilePicture});

  factory Driver.fromJson(Map<String, dynamic> json) => _$DriverFromJson(json);

  Map<String, dynamic> toJson() => _$DriverToJson(this);
}

@JsonSerializable()
class Vehicle {
  final int? id;
  final String? name;
  final String? plateNo;

  Vehicle({this.id, this.name, this.plateNo});

  factory Vehicle.fromJson(Map<String, dynamic> json) =>
      _$VehicleFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleToJson(this);
}

@JsonSerializable()
class Organization {
  final int? id;
  final String? name;

  Organization({this.id, this.name});

  factory Organization.fromJson(Map<String, dynamic> json) =>
      _$OrganizationFromJson(json);

  Map<String, dynamic> toJson() => _$OrganizationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Task {
  final int? id;
  final String? createdAt;
  final TaskData? data;
  final TaskForm? form;
  final String? clientUniqueId;
  final TaskSettings? settings;
  final String? attentionStatus;
  final bool? isEndorsed;

  Task({
    this.id,
    this.createdAt,
    this.data,
    this.form,
    this.clientUniqueId,
    this.settings,
    this.attentionStatus,
    this.isEndorsed,
  });

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}

@JsonSerializable(explicitToJson: true)
class TaskData {
  final List<KeyValue>? data;

  TaskData({this.data});

  factory TaskData.fromJson(Map<String, dynamic> json) =>
      _$TaskDataFromJson(json);

  Map<String, dynamic> toJson() => _$TaskDataToJson(this);
}

@JsonSerializable()
class KeyValue {
  final String? key;
  final bool? value;

  KeyValue({this.key, this.value});

  factory KeyValue.fromJson(Map<String, dynamic> json) =>
      _$KeyValueFromJson(json);

  Map<String, dynamic> toJson() => _$KeyValueToJson(this);
}

@JsonSerializable()
class TaskForm {
  final String? name;
  final String? lang;
  final int? id;
  final String? type;

  TaskForm({this.name, this.lang, this.id, this.type});

  factory TaskForm.fromJson(Map<String, dynamic> json) =>
      _$TaskFormFromJson(json);

  Map<String, dynamic> toJson() => _$TaskFormToJson(this);
}

@JsonSerializable()
class TaskSettings {
  final int? unmatchedCount;

  TaskSettings({this.unmatchedCount});

  factory TaskSettings.fromJson(Map<String, dynamic> json) =>
      _$TaskSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$TaskSettingsToJson(this);
}

@JsonSerializable()
class CheckLocation {
  final String? lat;
  final String? lng;

  CheckLocation({this.lat, this.lng});

  factory CheckLocation.fromJson(Map<String, dynamic> json) =>
      _$CheckLocationFromJson(json);

  Map<String, dynamic> toJson() => _$CheckLocationToJson(this);
}

@JsonSerializable()
class Criteria {
  final int? pageNumber;
  final int? pageSize;
  final int? orgId;

  Criteria({this.pageNumber, this.pageSize, this.orgId});

  factory Criteria.fromJson(Map<String, dynamic> json) =>
      _$CriteriaFromJson(json);

  Map<String, dynamic> toJson() => _$CriteriaToJson(this);
}
