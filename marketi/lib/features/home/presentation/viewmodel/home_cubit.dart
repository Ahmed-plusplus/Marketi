import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/service/service_locator.dart';
import 'package:marketi/features/home/data/models/submodels/brand_model.dart';
import 'package:marketi/features/home/data/models/submodels/category_model.dart';
import 'package:marketi/features/home/data/models/submodels/product_model.dart';
import 'package:marketi/features/home/data/repositories/home_repository.dart';
import 'package:marketi/features/home/presentation/viewmodel/home_states.dart';

class HomeCubit extends Cubit<HomeStates>{
  HomeCubit() : super(HomeInitStates()){
    _repository = getIt<HomeRepository>();
  }

  static HomeCubit get(context) => BlocProvider.of(context);

  late HomeRepository _repository;

  final List<CategoryModel> categories = [];
  final List<ProductModel> products = [];
  final List<BrandModel> brands = [];

  bool isLoadingMore = false;

  int currentPage = 1;
  bool hasMore = true;

  Future<void> fetchHomeData() async{
    await fetchCategories();
    await fetchProducts();
    await fetchBrands();
  }

  Future<void> fetchCategories() async{
    emit(LoadingCategoriesStates());
    final response = await _repository.getCategories();
    response.fold(
            (categoriesResponse) {
              categories.addAll(categoriesResponse.list ?? []);
              emit(SuccessCategoriesStates());
            },
            (failure) => emit(FailedCategoriesStates(failure.errMessage))
    );
  }

  Future<void> fetchProducts() async{
    emit(LoadingProductsStates());
    final response = await _repository.getProducts(page: currentPage);
    response.fold(
            (productsResponse) {
          products.addAll(productsResponse.list ?? []);
          currentPage++;
          emit(SuccessProductsStates());
        },
            (failure) => emit(FailedProductsStates(failure.errMessage))
    );
  }

  Future<void> fetchBrands() async{
    emit(LoadingBrandsStates());
    final response = await _repository.getBrands();
    response.fold(
            (brandsResponse) {
          brands.addAll(brandsResponse.list ?? []);
          emit(SuccessBrandsStates());
        },
            (failure) => emit(FailedBrandsStates(failure.errMessage))
    );
  }

}