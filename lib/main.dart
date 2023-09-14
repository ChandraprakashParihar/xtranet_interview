import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview/bloc/image_bloc.dart';
import 'package:interview/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Core());
}

class Core extends StatelessWidget {
  const Core({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [BlocProvider(create: (context)=>ImageBloc())],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "MyApp",
            themeMode: ThemeMode.system,
            home: child,
          ),
        );
      },
      child: const HomeScreen(),
    );
  }
}
