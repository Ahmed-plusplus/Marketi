import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/service/service_locator.dart';
import 'package:marketi/features/home/data/models/submodels/product_model.dart';
import 'package:marketi/features/home/data/repositories/home_repository.dart';

import 'product_details_states.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsStates> {
  ProductDetailsCubit() : super(ProductDetailsInitStates()){
    _repository = getIt.get<HomeRepository>();
  }

  static ProductDetailsCubit get(context) => BlocProvider.of(context);

  late HomeRepository _repository;
  ProductModel? productDetails;

  Future<void> fetchProductDetails({required int productId}) async {
    emit(ProductDetailsLoadingStates());
    final result = await _repository.getProductDetails(productId: productId);
    result.fold(
      (productDetails) {
        this.productDetails = productDetails;
        emit(ProductDetailsSuccessStates());
      },
      (failure) {
        emit(ProductDetailsErrorStates(failure.errMessage));
      },
    );
  }
}