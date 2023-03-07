import 'package:flutter/material.dart';
import '../widgets/primary_screen.dart';
import '../widgets/button.dart';
import '../resources/strings.dart';
import '../resources/colours.dart';

class DetailedHistoryPage extends StatelessWidget {
  const DetailedHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PrimaryScreen(
      title: Strings.detailedHistoryTitle,
      onPressed: () {
        Navigator.pop(context);
      },
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.8),
            Column(
              children: [
                Container(
                  width: double.maxFinite,
                  height: 210,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: NetworkImage(
                          'https://all.accor.com/magazine/imagerie/programacao-carnaval-salvador-por-que-passar-2d47.jpg'),
                      fit: BoxFit.cover,
                      alignment: Alignment(0, -0.5),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(height: 22),
                const Center(
                    child: Text(
                  'CARNAVAL 2020',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                )),
                const SizedBox(height: 33),
                Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          'NOME:',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colours.colorDescription,
                          ),
                        ),
                        const SizedBox(width: 27),
                        Text(
                          'Marlene Fernandes Gomes'.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colours.textColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 13),
                    Row(
                      children: [
                        const Text(
                          'LOCAL:',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colours.colorDescription,
                          ),
                        ),
                        const SizedBox(width: 27),
                        Text(
                          'Circuito Barra Ondina/Dodô'.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colours.textColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 13),
                    Row(
                      children: [
                        const Text(
                          'STATUS:',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colours.colorDescription,
                          ),
                        ),
                        const SizedBox(width: 27),
                        Text(
                          'lICENCIADA'.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colours.textColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 67),
                Button(
                  onPressed: () {},
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: const [
                      SizedBox(width: 220),
                      Positioned(
                        left: 0,
                        child: Icon(Icons.download),
                      ),
                      Text(Strings.downloadButton),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}