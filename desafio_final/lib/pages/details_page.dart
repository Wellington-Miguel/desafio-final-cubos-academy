import 'package:flutter/material.dart';
import '../widgets/primary_screen.dart';
import '../widgets/big_card.dart';
import '../widgets/button.dart';
import '../resources/strings.dart';
import '../resources/colours.dart';
import '../models/event_model.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key, required this.event}) : super(key: key);
  final EventModel event;

  @override
  Widget build(BuildContext context) {
    return PrimaryScreen(
      title: Strings.detailsTitle,
      onPressed: () {
        Navigator.pop(context);
      },
      children: [
        BigCard(
          details: true,
          title: event.name!,
          description:
              event.description!,
          image: event.imageUrl!,
        ),
        Button(
          onPressed: () {
            Navigator.pushNamed(context, Strings.routeCredentials);
          },
          child: const Text(
            Strings.credentialButton,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          disabledText: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.check, color: Colours.white),
              SizedBox(width: 20),
              Text(
                Strings.disabledCredentialButton,
                style: TextStyle(
                  color: Colours.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500
                ),
              ),
            ]
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}