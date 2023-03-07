class EventModel {
  int? id;
  String? name;
  String? description;
  String? imageUrl;
  String? startDate;
  String? endDate;
  int? status;

  EventModel(
      {this.id,
      this.name,
      this.description,
      this.imageUrl,
      this.startDate,
      this.endDate,
      this.status});

  EventModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['imageUrl'] = imageUrl;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['status'] = status;
    return data;
  }
}
