import 'package:flutter_bloc/flutter_bloc.dart';
import 'favourites_event.dart';
import 'favourites_state.dart';

// class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
//   FavoriteBloc() : super(FavoriteInitial()) {
//     on<AddToFavorites>(_onAddToFavorites);
//     on<RemoveFromFavorites>(_onRemoveFromFavorites);
//   }

//   void _onAddToFavorites(AddToFavorites event, Emitter<FavoriteState> emit) {
//     if (state is FavoriteLoaded) {
//       final state = this.state as FavoriteLoaded;
//       emit(FavoriteLoaded(
//         favoriteProducts: List.from(state.favoriteProducts)..add(event.product),
//       ));
//     }
//   }

//   void _onRemoveFromFavorites(
//       RemoveFromFavorites event, Emitter<FavoriteState> emit) {
//     if (state is FavoriteLoaded) {
//       final state = this.state as FavoriteLoaded;
//       emit(FavoriteLoaded(
//         favoriteProducts: List.from(state.favoriteProducts)
//           ..remove(event.product),
//       ));
//     }
//   }

//   @override
//   void onChange(Change<FavoriteState> change) {
//     super.onChange(change);
//     print(change);
//   }
// }

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteLoaded(favoriteProducts: [])) {
    on<AddToFavorites>(_onAddToFavorites);
    on<RemoveFromFavorites>(_onRemoveFromFavorites);
  }

  void _onAddToFavorites(AddToFavorites event, Emitter<FavoriteState> emit) {
    if (state is FavoriteLoaded) {
      final state = this.state as FavoriteLoaded;
      emit(FavoriteLoaded(
        favoriteProducts: List.from(state.favoriteProducts)..add(event.product),
      ));
    }
  }

  void _onRemoveFromFavorites(
      RemoveFromFavorites event, Emitter<FavoriteState> emit) {
    if (state is FavoriteLoaded) {
      final state = this.state as FavoriteLoaded;
      emit(FavoriteLoaded(
        favoriteProducts: List.from(state.favoriteProducts)
          ..remove(event.product),
      ));
    }
  }

  @override
  void onChange(Change<FavoriteState> change) {
    super.onChange(change);
    print(change);
  }
}
