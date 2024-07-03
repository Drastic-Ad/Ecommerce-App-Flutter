import 'package:ecom_ui/models/product_model.dart';
import 'package:equatable/equatable.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class AddToFavorites extends FavoriteEvent {
  final Product product;

  const AddToFavorites(this.product);

  @override
  List<Object> get props => [product];
}

class RemoveFromFavorites extends FavoriteEvent {
  final Product product;

  const RemoveFromFavorites(this.product);

  @override
  List<Object> get props => [product];
}
