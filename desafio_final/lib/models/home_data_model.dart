import 'event_model.dart';
import 'full_data_model.dart';

class HomeDataModel {
  final FullDataModel fullData;
  final List<EventModel> eventsData;
  HomeDataModel({
    required this.fullData,
    required this.eventsData,
  });
}
