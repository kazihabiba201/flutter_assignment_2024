import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'application/state_holder_binder.dart';
import 'presentation/ui/main_bottom_nav_screen.dart';

void main() {Intl.defaultLocale = 'bn';
 initializeDateFormatting('bn', null).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo', 
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),debugShowCheckedModeBanner: false,
      home: const MainBottomNavScreen(),initialBinding: StateHolderBinder(),
    );
  }
}

