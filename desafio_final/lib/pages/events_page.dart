import 'package:desafio_final/models/event_model.dart';
import 'package:flutter/material.dart';
import '../widgets/primary_screen.dart';
import '../widgets/big_card.dart';
import '../resources/strings.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({required this.events, Key? key}) : super(key: key);
  final List<EventModel> events;

  @override
  Widget build(BuildContext context) {
    return PrimaryScreen(
      title: Strings.events,
      onPressed: () {
        Navigator.pop(context);
      },
      children: [
        ListView.builder(
          itemCount: events.length,
          itemBuilder: ((context, index) {
            return BigCard(
                title: events[index].name!,
                description: events[index].description!,
                image: events[index].imageUrl!,
                onPressed: () => Navigator.pushNamed(context, Strings.routeDetails, arguments: events[index]),
            );
          }),
          shrinkWrap: true,
        )
      ],
    );
  }
}