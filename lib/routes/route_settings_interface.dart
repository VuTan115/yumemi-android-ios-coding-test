import 'package:flutter/material.dart';

abstract class RouteSettingConfig {
  Map<String, Object> routeSettingToMap(RouteSettings settings);
}
