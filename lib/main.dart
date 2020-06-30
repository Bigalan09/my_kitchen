import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_kitchen/localization/localization.dart';
import 'package:my_kitchen/screens/dashboard/bloc/dashboard_bloc.dart';
import 'package:my_kitchen/screens/dashboard/dashboard.dart';
import 'package:my_kitchen/screens/recipe/recipe.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(
      MyKitchenApp(),
    );
  });
}

class MyKitchenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterError.onError = (FlutterErrorDetails error) {
      printException(error.exception, error.stack, error.context.toString());
    };

    return BlocProvider(
      create: (context) => DashboardBloc(),
      child: MaterialApp(
        title: 'My Kitchen',
        localizationsDelegates: [
          const MyKitchenLocalizationDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en'),
        ],
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => DashboardPage(),
          DashboardPage.tag: (context) => DashboardPage(),
          RecipePage.tag: (context) => RecipePage(),
        },
      ),
    );
  }

  void printException(exception, StackTrace stack, String string) {}
}
