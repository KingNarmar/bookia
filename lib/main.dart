import 'package:bookia/app_root/app_root.dart';
import 'package:bookia/core/services/api/dio_provider.dart';
import 'package:flutter/material.dart';

void main() {
  DioProvider.init();
  runApp(const Bookia());
}
