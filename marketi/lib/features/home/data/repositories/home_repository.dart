import 'package:dartz/dartz.dart';
import 'package:marketi/core/network/errors/failure.dart';
import 'package:marketi/features/home/data/datasource/home_remote_data_source.dart';
import 'package:marketi/features/home/data/models/brandsModel.dart';
import 'package:marketi/features/home/data/models/categories_model.dart';
import 'package:marketi/features/home/data/models/product_params.dart';
import 'package:marketi/features/home/data/models/products_model.dart';
import 'package:marketi/features/home/data/models/submodels/product_model.dart';

class HomeRepository {
  HomeRemoteDataSource remoteDataSource;

  HomeRepository(this.remoteDataSource);

  Future<Either<CategoriesModel, Failure>> getCategories() async{
    return remoteDataSource.getCategories();
  }

  Future<Either<ProductsModel, Failure>> getProducts({required int page}) async{
    return remoteDataSource.getProducts(params: ProductParams(skip: page * 10, limit: 10));
  }

  Future<Either<BrandsModel, Failure>> getBrands() async{
    return remoteDataSource.getBrands();
  }

  Future<Either<ProductModel, Failure>> getProductDetails({required int productId}) async {
    return remoteDataSource.getProductDetails(productId);
  }
}