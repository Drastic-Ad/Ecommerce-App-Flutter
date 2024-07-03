import 'package:ecom_ui/bloc/product_bloc.dart';
import 'package:ecom_ui/bloc/product_event.dart';
import 'package:ecom_ui/bloc/product_state.dart';
import 'package:ecom_ui/models/product_list.dart';
import 'package:ecom_ui/models/product_visulaizer.dart';
import 'package:ecom_ui/pages/newCollectionPage.dart';
import 'package:ecom_ui/services/product_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             mainBanner(),
//             const SizedBox(height: 10),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(14, 14, 20, 0),
//               child: Column(
//                 children: [
//                   const Align(
//                     alignment: Alignment.topLeft,
//                     child: Text(
//                       'New',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.w900,
//                         fontSize: 34,
//                       ),
//                     ),
//                   ),
//                   Align(
//                     alignment: Alignment.topRight,
//                     child: GestureDetector(
//                       onTap: () {
//                         Navigator.of(context).push(
//                           MaterialPageRoute(
//                             builder: (context) => const HomePage2(),
//                           ),
//                         );
//                       },
//                       child: const Text(
//                         'View all',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.w700,
//                           fontSize: 11,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const Align(
//                     alignment: Alignment.topLeft,
//                     child: Text(
//                       'You’ve never seen it before!',
//                       style: TextStyle(
//                           color: Colors.grey,
//                           fontWeight: FontWeight.w100,
//                           fontSize: 11),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   SizedBox(
//                     height: 230,
//                     child: BlocProvider(
//                       create: (context) =>
//                           ProductBloc(ProductService())..add(FetchProducts()),
//                       child: BlocBuilder<ProductBloc, ProductState>(
//                         builder: (context, state) {
//                           if (state is ProductInitial) {
//                             return Center(child: Text('Welcome'));
//                           } else if (state is ProductLoading) {
//                             return Center(child: CircularProgressIndicator());
//                           } else if (state is ProductsLoaded) {
//                             return ProductList(products: state.products);
//                           } else if (state is ProductError) {
//                             return Center(
//                               child: Text('Error: ${state.message}'),
//                             );
//                           } else {
//                             return Container();
//                           }
//                         },
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Stack mainBanner() {
//     return Stack(
//       children: [
//         Image.asset('assets/banner.png'),
//         Positioned(
//           bottom: 55,
//           left: 30,
//           child: ElevatedButton(
//             style: ButtonStyle(
//               backgroundColor: MaterialStateProperty.all(Colors.red),
//             ),
//             onPressed: () {},
//             child: const Text(
//               'Check',
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//         ),
//         Positioned(
//           left: 25,
//           bottom: 110,
//           child: Container(
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.yellow, width: 2),
//             ),
//             child: const Text(
//               'Fashion\nSale',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 68,
//                 fontWeight: FontWeight.bold,
//                 height: 1,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            mainBanner(),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 14, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'New',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                      fontSize: 34,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const HomePage2(),
                          ),
                        );
                      },
                      child: const Text(
                        'View all',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    'You’ve never seen it before!',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w100,
                        fontSize: 11),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 270,
                    // Match the height of the ProductList widget
                    child: BlocProvider(
                      create: (context) =>
                          ProductBloc(ProductService())..add(FetchProducts()),
                      child: BlocBuilder<ProductBloc, ProductState>(
                        builder: (context, state) {
                          if (state is ProductInitial) {
                            return Center(child: Text('Welcome'));
                          } else if (state is ProductLoading) {
                            return Center(child: CircularProgressIndicator());
                          } else if (state is ProductsLoaded) {
                            return ProductList(products: state.products);
                          } else if (state is ProductError) {
                            return Center(
                              child: Text('Error: ${state.message}'),
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Stack mainBanner() {
    return Stack(
      children: [
        Image.asset('assets/banner.png'),
        Positioned(
          bottom: 55,
          left: 30,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
            ),
            onPressed: () {},
            child: const Text(
              'Check',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Positioned(
          left: 25,
          bottom: 110,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.yellow, width: 2),
            ),
            child: const Text(
              'Fashion\nSale',
              style: TextStyle(
                color: Colors.white,
                fontSize: 68,
                fontWeight: FontWeight.bold,
                height: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
