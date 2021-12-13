import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('tr', 'TR'), Locale('en', 'US')],
      path: 'assets/translations',
      startLocale: const Locale('tr', 'TR'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: true,
      title: "Material App",
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("app".tr()),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: Container(
                  alignment: Alignment.center,
                  child: Text("hello".tr()),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                if (context.locale.countryCode == "TR") {
                  await context.setLocale(const Locale("en", "US"));
                } else {
                  await context.setLocale(const Locale("tr", "TR"));
                }
                setState(() {});
              },
              child: Text("changelanguage".tr()),
            )
          ],
        ),
      ),
    );
  }
}
