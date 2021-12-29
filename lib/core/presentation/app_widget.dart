import 'package:flutter/material.dart';
import 'package:shared_purchase_list/core/app_router.dart';
import 'package:shared_purchase_list/core/shared/colors.dart';

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({Key? key, required this.appRouter}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shared Purshases List',
      theme: ThemeData(fontFamily: 'jost-regular', primaryColor: kPurpilColor),
      onGenerateRoute: appRouter.onGenerateRoute,
    );
  }
}
