import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../widgets/button.dart';
import '../widgets/primary_screen.dart';
import '../widgets/small_card.dart';
import '../resources/colours.dart';
import '../resources/strings.dart';
import '../models/home_data_model.dart';
import '../mobx/controller_event_list.dart';
import '../api/las_api.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.data}) : super(key: key);
  final HomeDataModel data;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final double menuWidth;
    final double menuFontSize;
    final double menuIconSize;

    final bool isDesktop = defaultTargetPlatform == TargetPlatform.windows ||
        defaultTargetPlatform == TargetPlatform.linux ||
        defaultTargetPlatform == TargetPlatform.macOS ||
        kIsWeb;

    if (isDesktop) {
      menuWidth = width * 0.94 > 423 ? 423 : width * 0.94;
    } else {
      menuWidth = width * 0.94;
    }

    menuFontSize = menuWidth * 0.053;
    menuIconSize = menuWidth * 0.138;

    final buttons = [
      ButtonContent(icon: Icons.event, text: Strings.events),
      ButtonContent(icon: Icons.account_circle, text: Strings.myData),
      ButtonContent(icon: Icons.chrome_reader_mode, text: Strings.myHistory),
      ButtonContent(icon: Icons.chat_rounded, text: Strings.contact),
    ];

    final api = API();
    final listEventController = ListEventController();

    return PrimaryScreen(
      avatar:
          data.fullData.userData.profilePictureUrl ?? Strings.alternativeImage,
      children: [
        Text(
          Strings.hello + data.fullData.userData.fullName.split(' ').first,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colours.textColor,
          ),
        ),
        const SizedBox(height: 56),
        SizedBox(
          width: menuWidth,
          child: GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 2,
            childAspectRatio: 1.925,
            mainAxisSpacing: 25,
            crossAxisSpacing: 11,
            children: List.generate(buttons.length, (index) {
              return Button(
                isMenuButton: true,
                onPressed: () {
                  switch (index) {
                    case 0:
                      listEventController.eventList(
                          api: api,
                          context: context,
                          token: data.fullData.token);
                      break;
                    case 1:
                      Navigator.pushNamed(context, Strings.routeData,
                          arguments: data.fullData);
                      break;
                    case 2:
                      Navigator.pushNamed(context, Strings.routeHistory);
                      break;
                    case 3:
                      break;
                  }
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(buttons[index].icon, size: menuIconSize),
                    Text(
                      buttons[index].text,
                      style: TextStyle(
                        fontSize: menuFontSize,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
        const SizedBox(height: 48),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          controller: ScrollController(),
          child: Row(
            children: List.generate(data.eventsData.length, (index) {
              return SmallCard(
                  title: data.eventsData[index].name!,
                  subTitle: 'Cadastramento liberado',
                  image: data.eventsData[index].imageUrl!,
                  onPressed: () => Navigator.pushNamed(context, Strings.routeDetails, arguments: data.eventsData[index]),
              );
            }),
          ),
        ),
        const SizedBox(height: 46),
      ],
    );
  }
}

class ButtonContent {
  ButtonContent({required this.icon, required this.text});

  final IconData icon;
  final String text;
}
