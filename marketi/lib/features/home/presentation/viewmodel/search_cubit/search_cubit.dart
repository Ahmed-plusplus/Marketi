import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/service/service_locator.dart';
import 'package:marketi/features/home/data/models/submodels/product_model.dart';
import 'package:marketi/features/home/data/repositories/home_repository.dart';
import 'package:marketi/features/home/presentation/viewmodel/search_cubit/search_states.dart';

class SearchCubit extends Cubit<SearchStates>{
  SearchCubit() : super(SearchInitStates()){
    _repository = getIt<HomeRepository>();
  }

  static SearchCubit get(context) => BlocProvider.of(context);

  late HomeRepository _repository;

  int page = 1;
  bool canLoadMore = true;
  List<ProductModel> products = [];

  Future<void> fetchProductsByName(String name) async {
    page = 1;
    canLoadMore = true;
    emit(SearchLoadingStates());
    final result = await _repository.getProductsByName(name: name, page: page);
    result.fold(
      (products) {
        this.products = products.list ?? [];
        emit(SearchSuccessStates());
      },
      (error) => emit(SearchErrorStates(error.errMessage)),
    );
  }

  Future<void> loadMoreProducts(String name) async {
    page++;
    emit(SearchLoadingStates());
    final result = await _repository.getProductsByName(name: name, page: page);
    result.fold(
      (products) {
        this.products.addAll(products.list ?? []);
        emit(SearchSuccessStates());
      },
      (error) {
        canLoadMore = false;
        emit(SearchErrorStates(error.errMessage));
      }
    );
  }

  void clearProducts() {
    products.clear();
    emit(SearchClearStates());
  }
}