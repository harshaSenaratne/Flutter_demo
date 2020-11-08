import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/config/global_theme/theme.dart';
import 'package:flutter_demo/config/global_theme/theme_file.dart';
import 'package:flutter_demo/pages/home/bloc/home_bloc.dart';
import 'package:flutter_demo/pages/home/home.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    GlobalTheme globalTheme = GlobalTheme();
    // return Home();
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(),
      child: ChangeNotifierProvider<ThemeChanger>(
          create: (_) => ThemeChanger(globalTheme.lightTheme), child: Home()),
    );
  }
}


