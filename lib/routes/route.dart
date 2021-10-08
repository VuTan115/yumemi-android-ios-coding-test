import 'package:android_ios_test/pages/blank.dart';
import 'package:android_ios_test/pages/home.dart';
import 'package:flutter/material.dart';

class PageViewTransition<T> extends MaterialPageRoute<T> {
  PageViewTransition({required WidgetBuilder builder, RouteSettings? settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (animation.status == AnimationStatus.reverse)
      return super
          .buildTransitions(context, animation, secondaryAnimation, child);
    return FadeTransition(opacity: animation, child: child);
  }
}

class AppRoute {
  static const String homePage = '/';
  static const String repostoryDetailPage = '/repository-detail';
  static Route<dynamic> generateRoute(settings) {
    switch (settings.name) {
      case homePage:
        return PageViewTransition(builder: (_) => Home());

      default:
        return PageViewTransition(builder: (_) => BlankPage());
    }
  }
}
