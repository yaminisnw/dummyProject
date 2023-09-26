import 'package:movie/views/navigation/app_routes.dart';

import 'intl/i18n.dart';
import 'ui.dart';
import 'view_model/app_view_model.dart';
import 'views/widgets/app_theme.dart';

void main() {
  runApp(
    const AppProvider(child: MyApp()),
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
    return MaterialApp.router(
      title: 'Template',
      theme: getLightTheme(),
      routerConfig: appRouter,
      locale: AppStringsDelegate.english,
      supportedLocales: AppStringsDelegate.appSupportedLocales,
      localizationsDelegates: AppStringsDelegate.delegates,
    );
  }
}
