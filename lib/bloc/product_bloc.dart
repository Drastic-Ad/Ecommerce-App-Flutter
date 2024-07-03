// product_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:ecom_ui/services/product_services.dart';
import 'product_event.dart';
import 'product_state.dart';

// class ProductBloc extends Bloc<ProductEvent, ProductState> {
//   final ProductService productService;

//   ProductBloc(this.productService) : super(ProductInitial()) {
//     on<FetchProduct>((event, emit) async {
//       emit(ProductLoading());
//       try {
//         final product = await productService.fetchProduct();
//         emit(ProductLoaded(product));
//       } catch (e) {
//         emit(ProductError(e.toString()));
//       }
//     });
//   }
// }

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductService productService;

  ProductBloc(this.productService) : super(ProductInitial()) {
    on<FetchProducts>((event, emit) async {
      emit(ProductLoading());
      try {
        final products = await productService.fetchProducts();
        emit(ProductsLoaded(products));
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });
  }
}
