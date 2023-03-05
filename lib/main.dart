import 'package:flutter/cupertino.dart';
import 'package:flutter_application_icerock/data/repositories/auth_repository.dart';
import 'package:flutter_application_icerock/router.dart';
import 'package:flutter_application_icerock/ui/screens/repository_details_page/repository_details_page.dart';
import 'package:flutter_application_icerock/ui/screens/repository_page/repository_page.dart';
import 'package:flutter_application_icerock/ui/common/widgets/custom_progress_indicator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:the_splash/the_splash.dart';

import 'data/services/network_status_service.dart';
import 'ui/screens/login_page/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SplashScreenData.preload();
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, widget as Widget),
          maxWidth: 1200,
          minWidth: 450,
          defaultScale: true,
          breakpoints: const [
            ResponsiveBreakpoint.resize(450, name: MOBILE,),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            ResponsiveBreakpoint.autoScale(1200, name: DESKTOP),
            ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],
          background: Container(color: Color(0xFF0D1117))),
      title: 'Flutter Demo',
      theme: CupertinoThemeData(
        scaffoldBackgroundColor: Color(0xFF0D1117),
      ),
      home: Stack(
        children: [
          FutureBuilder(
              future: ref.read(internetConnection.future),
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!) {
                    return ref.watch(userDataAuthProvider).when(
                        data: (token) {
                          if (token == null) {
                            return LoginPage();
                          }
                          ref.read(authRepositoryProvider.notifier).setToken(token);
                          return RepositoryPage();
                        },
                        error: (error, trace) {
                          return RepositoryPage();
                        },
                        loading: () => CupertinoPageScaffold(
                              child: Center(
                                child:
                                    Image.asset('assets/images/Splash.png'), //ssssssssssssssssssssssssssssssssssssssssssssssssss
                              ),
                            ));
                  }else{
                    return RepositoryPage();
                  }
                }
                return CupertinoPageScaffold(
                    child: Center(
                      child:
                          Image.asset('assets/images/Splash.png'), //ssssssssssssssssssssssssssssssssssssssssssssssssss
                    ),
                  );
              }),

        ],
      ),
      onGenerateRoute: generateRoute,
    );
  }
}
