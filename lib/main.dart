import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_purchase_list/core/presentation/widgets/app_router.dart';
import 'package:shared_purchase_list/core/shared/service_locator.dart';
import 'core/presentation/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await setUpServiceLocator();
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}
