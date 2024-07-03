// import 'package:flutter/material.dart';

// class Favourites extends StatelessWidget {
//   const Favourites({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: Column(
//           children: [Text('Favs')],
//         ),
//       ),
//     );
//   }
// }
import 'package:ecom_ui/models/product_list.dart';
import 'package:ecom_ui/pages/favourites/bloc/favourites_bloc.dart';
import 'package:ecom_ui/pages/favourites/bloc/favourites_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class FavoritePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Favorites'),
//       ),
//       body: BlocBuilder<FavoriteBloc, FavoriteState>(
//         builder: (context, state) {
//           if (state is FavoriteInitial) {
//             return Center(child: Text('No favorites yet'));
//           } else if (state is FavoriteLoaded) {
//             return ProductList(products: state.favoriteProducts);
//           } else {
//             return Container();
//           }
//         },
//       ),
//     );
//   }
// }

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) {
          if (state is FavoriteInitial) {
            return Center(child: Text('No favorites yet'));
          } else if (state is FavoriteLoaded) {
            return ProductList(products: state.favoriteProducts);
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
