import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'mobx/controller_pages.dart';
import 'pages/credential_page.dart';
import 'pages/data_page.dart';
import 'pages/detailed_history_page.dart';
import 'pages/details_page.dart';
import 'pages/events_page.dart';
import 'pages/history_page.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/splash_page.dart';
import 'models/event_model.dart';
import 'models/full_data_model.dart';
import 'models/home_data_model.dart';
import 'resources/strings.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ControllerPage>(
          create: (context) => ControllerPage(),
        ),
      ],
      child: MaterialApp(
        initialRoute: Strings.routeSplash,
        onGenerateRoute: (settings) {
          if (settings.name != null) {
            if (settings.name == Strings.routeHome) {
              final _data = settings.arguments as HomeDataModel;
              return MaterialPageRoute(
                builder: (context) => HomePage(data: _data),
              );
            } else if (settings.name == Strings.routeEvents) {
              final _data = settings.arguments as List<EventModel>;
              return MaterialPageRoute(
                builder: (context) => EventsPage(events: _data),
              );
            }
            if (settings.name == Strings.routeData) {
              final _data = settings.arguments as FullDataModel;
              return MaterialPageRoute(
                  builder: (context) => DataPage(data: _data));
            }
            if (settings.name == Strings.routeDetails) {
              final _data = settings.arguments as EventModel;
              return MaterialPageRoute(
                  builder: (context) => DetailsPage(event: _data));
            }
          }
          return null;
        },
        routes: {
          Strings.routeSplash: (context) => const SplashScreen(),
          Strings.routeLogin: (context) => const LoginPage(),
          Strings.routeRegistration: (context) => const RegistrationPage(),
          Strings.routeCredentials: (context) => const CredentialPage(),
          Strings.routeHistory: (context) => const HistoryPage(),
          Strings.routeDetailedHistory: (context) => const DetailedHistoryPage(),
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Roboto'),
      ),
    );
  }
}
