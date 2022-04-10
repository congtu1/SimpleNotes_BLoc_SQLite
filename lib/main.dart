import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_travel_ui/common/bloc_observer.dart';
import 'package:flutter_travel_ui/common/injector.dart';
import 'package:flutter_travel_ui/presentation/home/bloc/home_bloc.dart';
import 'package:flutter_travel_ui/presentation/home/bloc/home_event.dart';
import 'package:flutter_travel_ui/presentation/newtask/bloc/newtask_cubit.dart';
import 'package:flutter_travel_ui/presentation/splash/splash_screen.dart';
import 'package:flutter_travel_ui/common/routes.dart';


void main()  {
  WidgetsFlutterBinding.ensureInitialized();
  setup();

  BlocOverrides.runZoned(
        () => runApp(MyApp()),
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HomeBloc()..add(HomeFetched())),
        BlocProvider(create: (_) => NewTaskCubit())
      ],
      child: MaterialApp(
        title: 'Flutter Travel UI',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xFFF1F8E9),
          scaffoldBackgroundColor: Color(0xFFF3F5F7),
          primarySwatch: Colors.blue,
        ),
        routes: routes,
        initialRoute: SplashScreen.routeName,
        home: SplashScreen()
      ),
    );
  }
}
