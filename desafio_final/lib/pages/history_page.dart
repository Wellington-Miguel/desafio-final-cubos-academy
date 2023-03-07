import 'package:flutter/material.dart';
import '../resources/colours.dart';
import '../resources/strings.dart';
import '../widgets/primary_screen.dart';
import '../models/history_model.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final history = {
      '2020': [
        History(
          title: 'Carnaval',
          subtitle: 'Carnaval dos Carnavais',
          image:
              'https://all.accor.com/magazine/imagerie/programacao-carnaval-salvador-por-que-passar-2d47.jpg',
        ),
        History(
          title: 'Yemanjá',
          subtitle: 'Festa de Yemanjá',
          image:
              'https://s.glbimg.com/jo/g1/f/original/2017/02/02/iemanja2.jpg',
        ),
        History(
          title: 'Lavagem do Bonfim',
          subtitle: 'Festa ao Nosso Senhor do Bonfim',
          image:
              'https://images.unsplash.com/photo-1581475319737-4ae69b8926c7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80',
        ),
      ],
      '2021': [
        History(
          title: 'Carnaval',
          subtitle: 'O mundo escolheu Salvador',
          image:
              'https://images.unsplash.com/photo-1588172322752-e13df881e89e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1473&q=80',
        ),
        History(
          title: 'Yemanjá',
          subtitle: 'Festa de Yemanjá',
          image:
              'https://s.glbimg.com/jo/g1/f/original/2017/02/02/iemanja2.jpg',
        ),
      ],
    };

    return PrimaryScreen(
      title: Strings.myHistory,
      onPressed: () {
        Navigator.pop(context);
      },
      children: [
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: history.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          history.keys.elementAt(index),
                          style: TextStyle(
                            color: Colours.black.withOpacity(0.65),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: history.values.elementAt(index).length,
                      shrinkWrap: true,
                      itemBuilder: (context, item) {
                        final content = history.values.elementAt(index)[item];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 1),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colours.white,
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: ListTile(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Strings.routeDetailedHistory);
                              },
                              leading: CircleAvatar(
                                  backgroundImage: NetworkImage(content.image)),
                              title: Text(content.title),
                              subtitle: Text(content.subtitle),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            }),
      ],
    );
  }
}