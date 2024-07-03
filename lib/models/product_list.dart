import 'package:ecom_ui/bloc/product_bloc.dart';
import 'package:ecom_ui/bloc/product_state.dart';
import 'package:ecom_ui/models/product_model.dart';
import 'package:ecom_ui/pages/favourites/bloc/favourites_bloc.dart';
import 'package:ecom_ui/pages/favourites/bloc/favourites_event.dart';
import 'package:ecom_ui/pages/favourites/bloc/favourites_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// // class ProductList extends StatelessWidget {
// //   const ProductList({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     final List<Product> products;
// //     return BlocBuilder<ProductBloc, ProductState>(
// //       builder: (context, state) {

// //         return ListView.separated(
// //           separatorBuilder: (context, index) => SizedBox(
// //             height: 20,
// //           ),
// //           scrollDirection: Axis.vertical,
// //           itemCount: products.length,
// //           itemBuilder: (context, index) {
// //             final product = products[index];
// //             return Column(
// //               children: [
// //                 Container(
// //                   decoration: BoxDecoration(
// //                     border: Border.all(width: 1),
// //                     color: Colors.grey.shade200,
// //                   ),
// //                   child: ListTile(
// //                       leading: Column(
// //                         children: [
// //                           Stack(children: [
// //                             Image.network(
// //                               product.image,
// //                             ),
// //                             Container(
// //                           height: 184,
// //                           width: 164,
// //                           decoration: BoxDecoration(
// //                               borderRadius: BorderRadius.circular(8),
// //                               color: Colors.amber),
// //                           child: Image.network(
// //                             product.image,
// //                             fit: BoxFit.fill,
// //                           ),
// //                         ),
// //                           ]),
// //                         ],
// //                       ),
// //                       title: Text(
// //                         product.title,
// //                         softWrap: true,
// //                         overflow: TextOverflow.ellipsis,
// //                         maxLines: 1,
// //                       ),
// //                       subtitle: Column(
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         children: [
// //                           Text('\$${product.price}'),
// //                           Row(
// //                             children: [
// //                               RatingBarIndicator(
// //                                 rating: product.rating.rate,
// //                                 itemBuilder: (context, index) => Icon(
// //                                   Icons.star,
// //                                   color: Colors.amber,
// //                                 ),
// //                                 itemCount: 5,
// //                                 itemSize: 20.0,
// //                                 direction: Axis.horizontal,
// //                               ),
// //                               Text(
// //                                 '(${product.rating.count} reviews)',
// //                                 style: TextStyle(fontSize: 12),
// //                               ),
// //                             ],
// //                           )
// //                         ],
// //                       )),
// //                 ),
// //               ],
// //             );
// //           },
// //         );
// //       },
// //     );
// //   }
// // }
// // import 'package:ecom_ui/bloc/product_bloc.dart';
// // import 'package:ecom_ui/bloc/product_state.dart';
// // import 'package:ecom_ui/models/product_model.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// // class ProductList extends StatelessWidget {
// //   const ProductList({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return BlocBuilder<ProductBloc, ProductState>(
// //       builder: (context, state) {
// //         if (state is ProductLoading) {
// //           return Center(child: CircularProgressIndicator());
// //         } else if (state is ProductLoading) {
// //           final products = state.products;
// //           return ListView.separated(
// //             separatorBuilder: (context, index) => SizedBox(height: 20),
// //             itemCount: products.length,
// //             itemBuilder: (context, index) {
// //               final product = products[index];
// //               return Container(
// //                 decoration: BoxDecoration(
// //                   border: Border.all(width: 1),
// //                   color: Colors.grey.shade200,
// //                 ),
// //                 child: ListTile(
// //                   leading: Image.network(
// //                     product.image,
// //                     fit: BoxFit.cover,
// //                     width: 50,
// //                     height: 50,
// //                   ),
// //                   title: Text(
// //                     product.title,
// //                     softWrap: true,
// //                     overflow: TextOverflow.ellipsis,
// //                     maxLines: 1,
// //                   ),
// //                   subtitle: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Text('\$${product.price}'),
// //                       Row(
// //                         children: [
// //                           RatingBarIndicator(
// //                             rating: product.rating.rate,
// //                             itemBuilder: (context, index) => Icon(
// //                               Icons.star,
// //                               color: Colors.amber,
// //                             ),
// //                             itemCount: 5,
// //                             itemSize: 20.0,
// //                             direction: Axis.horizontal,
// //                           ),
// //                           Text(
// //                             '(${product.rating.count} reviews)',
// //                             style: TextStyle(fontSize: 12),
// //                           ),
// //                         ],
// //                       )
// //                     ],
// //                   ),
// //                 ),
// //               );
// //             },
// //           );
// //         } else if (state is ProductError) {
// //           return Center(child: Text('Failed to load products'));
// //         } else {
// //           return Center(child: Text('No products available'));
// //         }
// //       },
// //     );
// //   }
// // }
// import 'package:ecom_ui/pages/favourites/bloc/favourites_bloc.dart';
// import 'package:ecom_ui/pages/favourites/bloc/favourites_event.dart';
// import 'package:ecom_ui/pages/favourites/bloc/favourites_state.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:ecom_ui/models/product_model.dart';

// // class ProductList extends StatelessWidget {
// //   final List<Product> products;

// //   const ProductList({Key? key, required this.products}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return ListView.separated(
// //       scrollDirection: Axis.horizontal,
// //       separatorBuilder: (context, index) => const SizedBox(width: 20),
// //       itemCount: products.length,
// //       itemBuilder: (context, index) {
// //         final product = products[index];
// //         return Container(
// //           width: 150,
// //           decoration: BoxDecoration(
// //             border: Border.all(width: 1),
// //             color: Colors.grey.shade200,
// //           ),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Image.network(
// //                 product.image,
// //                 fit: BoxFit.cover,
// //                 width: 150,
// //                 height: 100,
// //               ),
// //               Padding(
// //                 padding: const EdgeInsets.all(8.0),
// //                 child: Text(
// //                   product.title,
// //                   softWrap: true,
// //                   overflow: TextOverflow.ellipsis,
// //                   maxLines: 1,
// //                 ),
// //               ),
// //               Padding(
// //                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
// //                 child: Text('\$${product.price}'),
// //               ),
// //               Padding(
// //                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
// //                 child: Row(
// //                   children: [
// //                     RatingBarIndicator(
// //                       rating: product.rating.rate,
// //                       itemBuilder: (context, index) => const Icon(
// //                         Icons.star,
// //                         color: Colors.amber,
// //                       ),
// //                       itemCount: 5,
// //                       itemSize: 20.0,
// //                       direction: Axis.horizontal,
// //                     ),
// //                     Text(
// //                       '(${product.rating.count} reviews)',
// //                       style: const TextStyle(fontSize: 12),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ],
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }

// class ProductList extends StatefulWidget {
//   final List<Product> products;

//   const ProductList({Key? key, required this.products}) : super(key: key);

//   @override
//   State<ProductList> createState() => _ProductListState();
// }

// class _ProductListState extends State<ProductList> {
//   bool liked = false;
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 270, // Adjust this value as needed
//       child: ListView.separated(
//         scrollDirection: Axis.horizontal,
//         separatorBuilder: (context, index) => const SizedBox(width: 10),
//         itemCount: widget.products.length,
//         itemBuilder: (context, index) {
//           final product = widget.products[index];
//           return Container(
//             width: 164,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Stack(children: [
//                   Container(
//                     height: 184,
//                     width: 164,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(8),
//                         color: Colors.amber),
//                     child: Image.network(
//                       product.image,
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                   Positioned(
//                     bottom: 0,
//                     right: 0,
//                     child: CircleAvatar(
//                       backgroundColor: Colors.white,
//                       child: IconButton(
//                         icon: Icon(
//                           Icons.favorite,
//                           color: liked ? Colors.red : Colors.black,
//                         ),
//                         onPressed: () {
//                           setState(() {
//                             liked = !liked;
//                           });
//                         },
//                       ),
//                     ),
//                   )
//                 ]),
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       product.title,
//                       softWrap: true,
//                       overflow: TextOverflow.ellipsis,
//                       maxLines: 1,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                   child: Text('\$${product.price}'),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                   child: Column(
//                     children: [
//                       RatingBarIndicator(
//                         rating: product.rating.rate,
//                         itemBuilder: (context, index) => const Icon(
//                           Icons.star,
//                           color: Colors.amber,
//                         ),
//                         itemCount: 5,
//                         itemSize: 10.0,
//                         direction: Axis.horizontal,
//                       ),
//                       Text(
//                         '(${product.rating.count} reviews)',
//                         style: const TextStyle(fontSize: 12),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
// import 'package:ecom_ui/pages/favourites/bloc/favourites_bloc.dart';
// import 'package:ecom_ui/pages/favourites/bloc/favourites_event.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:ecom_ui/models/product_model.dart';

// class ProductList extends StatefulWidget {
//   final List<Product> products;

//   const ProductList({Key? key, required this.products}) : super(key: key);

//   @override
//   State<ProductList> createState() => _ProductListState();
// }

// class _ProductListState extends State<ProductList> {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 270, // Adjust this value as needed
//       child: ListView.separated(
//         scrollDirection: Axis.horizontal,
//         separatorBuilder: (context, index) => const SizedBox(width: 10),
//         itemCount: widget.products.length,
//         itemBuilder: (context, index) {
//           final product = widget.products[index];
//           return Container(
//             width: 164,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Stack(children: [
//                   Container(
//                     height: 184,
//                     width: 164,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8),
//                       color: Colors.amber,
//                     ),
//                     child: Image.network(
//                       product.image,
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                   Positioned(
//                     bottom: 0,
//                     right: 0,
//                     child: CircleAvatar(
//                       backgroundColor: Colors.white,
//                       child: IconButton(
//                         icon: Icon(
//                           Icons.favorite,
//                           color: context.watch<FavoriteBloc>().state
//                                       is FavoriteLoaded &&
//                                   (context.watch<FavoriteBloc>().state
//                                           as FavoriteLoaded)
//                                       .favoriteProducts
//                                       .contains(product)
//                               ? Colors.red
//                               : Colors.black,
//                         ),
//                         onPressed: () {
//                           final favoriteBloc = context.read<FavoriteBloc>();
//                           favoriteBloc.add(
//                             (favoriteBloc.state is FavoriteLoaded &&
//                                     (favoriteBloc.state as FavoriteLoaded)
//                                         .favoriteProducts
//                                         .contains(product))
//                                 ? RemoveFromFavorites(product)
//                                 : AddToFavorites(product),
//                           );
//                         },
//                       ),
//                     ),
//                   )
//                 ]),
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       product.title,
//                       softWrap: true,
//                       overflow: TextOverflow.ellipsis,
//                       maxLines: 1,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                   child: Text('\$${product.price}'),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                   child: Column(
//                     children: [
//                       RatingBarIndicator(
//                         rating: product.rating.rate,
//                         itemBuilder: (context, index) => const Icon(
//                           Icons.star,
//                           color: Colors.amber,
//                         ),
//                         itemCount: 5,
//                         itemSize: 10.0,
//                         direction: Axis.horizontal,
//                       ),
//                       Text(
//                         '(${product.rating.count} reviews)',
//                         style: const TextStyle(fontSize: 12),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:ecom_ui/pages/favourites/bloc/favourites_bloc.dart';
import 'package:ecom_ui/pages/favourites/bloc/favourites_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ecom_ui/models/product_model.dart';

class ProductList extends StatefulWidget {
  final List<Product> products;

  const ProductList({Key? key, required this.products}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270, // Adjust this value as needed
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: widget.products.length,
        itemBuilder: (context, index) {
          final product = widget.products[index];
          return Container(
            width: 164,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 184,
                      width: 164,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: Image.network(
                        product.image,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: Icon(
                            Icons.favorite,
                            color: context.watch<FavoriteBloc>().state
                                        is FavoriteLoaded &&
                                    (context.watch<FavoriteBloc>().state
                                            as FavoriteLoaded)
                                        .favoriteProducts
                                        .contains(product)
                                ? Colors.red
                                : Colors.black,
                          ),
                          onPressed: () {
                            final favoriteBloc = context.read<FavoriteBloc>();
                            favoriteBloc.add(
                              (favoriteBloc.state is FavoriteLoaded &&
                                      (favoriteBloc.state as FavoriteLoaded)
                                          .favoriteProducts
                                          .contains(product))
                                  ? RemoveFromFavorites(product)
                                  : AddToFavorites(product),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      product.title,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('\$${product.price}'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      RatingBarIndicator(
                        rating: product.rating.rate,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 10.0,
                        direction: Axis.horizontal,
                      ),
                      Text(
                        '(${product.rating.count} reviews)',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
