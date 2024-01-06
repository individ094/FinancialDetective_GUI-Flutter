import 'package:bank_dashboard/ui/shared/colors.dart';
import 'package:bank_dashboard/views/main/main_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bank_dashboard/views/import_data/import_data_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bank Dashboard',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kWhiteColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: kSecondaryColor2,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const MainView(),
        '/ImportData': (context) => const ImportDataView(),
      },
      home: const MainView(),
    );
  }
}
