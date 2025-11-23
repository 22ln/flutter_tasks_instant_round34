
import 'package:provider/provider.dart';
import 'package:r34_01/core/routes/names.dart';
import 'package:r34_01/core/routes/pages.dart';
import 'package:r34_01/widgets/cart_page/cart_provider.dart';
import 'package:r34_01/widgets/favourite_page/favourite_provider.dart';

import 'core/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, ch) => DismissKeyboard(
        
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_)=> CartProvider()),
            ChangeNotifierProvider(create: (_)=> FavouriteProvider())
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppRouter.generateRoute,
            initialRoute: RoutesName.entryPointUi,
            
          ),
        ),
      ),
    );
  }
}
