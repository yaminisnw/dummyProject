import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie/views/content_page.dart';

import '../../ui.dart';
import '../home_page.dart';


part 'app_routes.g.dart';

final RouterConfig<Object> appRouter = GoRouter(
  routes: $appRoutes,
  redirect: (BuildContext c, GoRouterState s) {
    return null;
  },
  debugLogDiagnostics: true,
);

/// Home Page
@TypedGoRoute<HomePageRoute>(
  path: '/',
  routes: [
  /*  TypedGoRoute<ProfilePageRoute>(
      path: 'profile/:id',
    )*/
  ],
)
@immutable
class HomePageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}

///Content Page
@TypedGoRoute<ContentPageRoute>(
  path: '/content',
  routes:[]
)
@immutable
class ContentPageRoute extends GoRouteData{
  const ContentPageRoute({
    required this.id,
});
  final int id;
  @override
  Widget build(BuildContext context,GoRouterState state){
    print(id);
    return const ContentPage();
  }
}

/*@immutable
class ProfilePageRoute extends GoRouteData {
  const ProfilePageRoute({
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    print(id);
    return const ProfilePage();
  }
}

@TypedGoRoute<TermsPageRoute>(
  path: '/terms',
)
@immutable
class TermsPageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const TermsPage();
  }
}*/
