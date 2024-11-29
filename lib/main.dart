import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/modules/location/view/location_screen.dart';
import 'app/modules/location/view_model/location_provider.dart';
import 'app/modules/location_details/view_model/datails_provider.dart';
import 'app/utils/extentions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: ((context) => LocationProvider())),
          ChangeNotifierProvider(create: ((context) => DetailsProvider())),
        ],
        builder: (context, child) {
          return LayoutBuilder(builder: (context, constraints) {
            return OrientationBuilder(builder: (context, orientation) {
              Responsive().init(constraints, orientation);
              return const MaterialApp(
                debugShowCheckedModeBanner: false,
                home: LocationScreen(),
              );
            });
          });
        });
  }
}
