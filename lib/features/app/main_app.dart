import 'package:ecoomerce_shop/features/app/routes.dart';
import 'package:flutter/material.dart';

class MainApp extends StatelessWidget{
  const MainApp({super.key});


  @override
  Widget build(BuildContext context) {
    
    return MaterialApp.router(
      title:'Home Screen',
      routerConfig: AppRouter().generateRouter(),
    );
  }
}