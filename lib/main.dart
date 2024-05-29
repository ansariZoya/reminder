// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:reminder_app/src/presentation/Screens/tab-screens.dart';

import 'package:reminder_app/src/presentation/bloc/switchblock/switch_bloc.dart';

import 'package:reminder_app/src/presentation/bloc/taskbloc/task_bloc.dart';
import 'package:reminder_app/src/presentation/bloc/my_bloc_observer.dart';

import 'package:reminder_app/core/services/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());

  Bloc.observer = MyBlocObserver();
  runApp(MyApp(
    appRoute: AppRoute(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.appRoute,
  }) : super(key: key);
  final AppRoute appRoute;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TaskBloc()),
        BlocProvider(create: (context) => SwitchBloc()),
      ],
      child: BlocBuilder<SwitchBloc, SwitchState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Reminder App',
            debugShowCheckedModeBanner: false,
            
            home: Tabscreen(),
            onGenerateRoute: appRoute.onGenerateRoute,
          );
        },
      ),
    );
  }
}
