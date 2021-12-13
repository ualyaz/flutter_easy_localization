# multi_language (tr/en)

A new Flutter project.

## Getting started

install easy_localization package and define assets folder for language json files.

```Dart
dependencies:
  flutter:
    sdk: flutter

  ...
  easy_localization: ^3.0.0
  ...

flutter:
  ...
  assets:
    - assets/translations/
  ...


```

easy_localization package generate this file automatically

```Dart
//
// Generated file. Do not edit.
//

// ignore_for_file: directives_ordering
// ignore_for_file: lines_longer_than_80_chars

import 'package:shared_preferences_web/shared_preferences_web.dart';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

// ignore: public_member_api_docs
void registerPlugins(Registrar registrar) {
  SharedPreferencesPlugin.registerWith(registrar);
  registrar.registerMessageHandler();
}

```

inside main function

```Dart
...
runApp(
    EasyLocalization(
      supportedLocales: const [Locale('tr', 'TR'), Locale('en', 'US')], //language list
      path: 'assets/translations', // path of language files
      startLocale: const Locale('tr', 'TR'),//default language file
      child: const MyApp(),
    ),
  );
...

```

usage of localization "language_key".tr()

```Dart
...
  return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: true,
      title: "Material App",
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("app".tr()),// usage language key
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: Container(
                  alignment: Alignment.center,
                  child: Text("hello".tr()), // usage language key
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                //change context local state
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
    ...
```

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
