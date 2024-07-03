import 'package:ecom_ui/bloc/product_bloc.dart';
import 'package:ecom_ui/bloc/product_event.dart';
import 'package:ecom_ui/pages/favourites/bloc/favourites_bloc.dart';
import 'package:ecom_ui/pages/favourites/bloc/favourites_event.dart';
import 'package:ecom_ui/pages/favourites/bloc/favourites_state.dart';
import 'package:ecom_ui/pages/homepage.dart';
import 'package:ecom_ui/services/product_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              ProductBloc(ProductService())..add(FetchProducts()),
        ),
        BlocProvider(
          create: (context) => FavoriteBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: NavigationPage(),
      ),
    );
  }
}
