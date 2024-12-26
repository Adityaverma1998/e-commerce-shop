import 'package:ecoomerce_shop/core/di/service_locator.dart';
import 'package:ecoomerce_shop/features/app/main_app.dart';
import 'package:ecoomerce_shop/features/home/presentation/screen/home.dart';
import 'package:flutter/material.dart';

void main() async{
  await ServiceLocator.configureDependencies();

  runApp(const MainApp());
}


