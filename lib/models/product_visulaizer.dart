import 'package:ecom_ui/bloc/product_bloc.dart';
import 'package:ecom_ui/bloc/product_event.dart';
import 'package:ecom_ui/bloc/product_state.dart';
import 'package:ecom_ui/services/product_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'product_model.dart';

class HomePage2 extends StatelessWidget {
  const HomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(ProductService())..add(FetchProducts()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Products'),
        ),
        body: Center(
          child: BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductInitial) {
                return Text('Welcome');
              } else if (state is ProductLoading) {
                return CircularProgressIndicator();
              } else if (state is ProductsLoaded) {
                return ProductList1(products: state.products);
              } else if (state is ProductError) {
                return Text('Error: ${state.message}');
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}

class ProductList1 extends StatelessWidget {
  final List<Product> products;

  const ProductList1({required this.products});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (164 / 260),
        ),
        itemBuilder: (context, index) {
          final product = products[index];
          return Padding(
              padding: EdgeInsets.all(5),
              child: GridTile(
                child: Column(children: [
                  Column(
                    children: [
                      Stack(children: [
                        Container(
                          height: 184,
                          width: 164,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.amber),
                          child: Image.network(
                            product.image,
                            fit: BoxFit.fill,
                          ),
                        ),
                        // Text(
                        //   product.title,
                        //   softWrap: true,
                        //   overflow: TextOverflow.ellipsis,
                        //   maxLines: 1,
                        // ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                              icon: Icon(
                                Icons.favorite_border,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        )
                      ]),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      product.title,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
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
                ]),
              ));
        },
      ),
    );
  }
}
