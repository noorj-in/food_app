import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// [App] final variable to access the AppContext.
final app = AppContext();

/// AppContext contains the NavigatorState of the app.
class AppContext {
  /// [navigatorState] is the NavigatorState of the app.
  static final GlobalKey<NavigatorState> navigatorState = GlobalKey();
}

/// AppContext contains the NavigatorState of the app.
extension AppExt on AppContext {
  /// [ctx] is the context of the app.
  BuildContext? get ctx => AppContext.navigatorState.currentContext;

  /// [theme] is the theme of the app.
  ThemeData get theme {
    var theme = ThemeData.fallback();
    if (ctx != null) {
      theme = Theme.of(ctx!);
    }
    return theme;
  }

  /// [pixelRatio] is the pixel ratio of the device.
  double get _pixelRatio {
    var ratio =
        WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;
    if (ctx != null) {
      ratio = View.of(ctx!).devicePixelRatio;
    }
    return ratio;
  }

  /// [size] is the size of the device.
  Size get size {
    Size ratio =
        WidgetsBinding.instance.platformDispatcher.views.first.physicalSize /
            _pixelRatio;
    if (ctx != null) {
      ratio = View.of(ctx!).physicalSize / _pixelRatio;
    }
    return ratio;
  }

  /// [width] is the width of the device.
  double get width => size.width;

  /// [height] is the height of the device.
  double get height => size.height;

  /// [columnSpacer] is a Custom Spacer to add space between columns.
  Widget columnSpacer({double? height}) => SizedBox(
    height: height ?? width * 0.05,
  );

  /// [rowSpacer] is a Custom Spacer to add space between rows.
  Widget rowSpacer({double? width}) => SizedBox(
    width: width ?? height * 0.02,
  );

  /// [textTheme] is the text theme of the app.
  TextTheme get textTheme => theme.textTheme;

  /// push is a method to push a new widget.
  /// [page] will be the widget to be pushed.
  void go(String name, {Object? extra}) =>
      GoRouter.of(ctx!).go(name, extra: extra);

  /// push is a method to push a new widget.
  /// [page] will be the widget to be pushed.
  Future<Object?> push(String name, {Object? extra}) =>
      GoRouter.of(ctx!).push(name, extra: extra);

  /// pushReplacement is a method to push a new widget and replace the current widget.
  /// [page] will be the widget to be replaced.
  Future<Object?> pushReplacement(String name, {Object? extra}) =>
      GoRouter.of(ctx!).pushReplacement(name, extra: extra);

  /// canPop is a method to check if the current widget can be popped.
  bool canPop() => GoRouter.of(ctx!).canPop();

  /// refresh is a method to refresh the route.
  void refresh() => GoRouter.of(ctx!).refresh();

  /// pop is a method to pop the current widget.
  /// [result] will pass the data from the previous widget to current widget.
  void pop([Object? result]) {
    if (canPop()) {
      GoRouter.of(ctx!).pop(result);
    }
  }
}
