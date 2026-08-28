import 'package:dartz/dartz.dart';
import 'package:marketi/core/network/api/api_consumer.dart';
import 'package:marketi/core/network/api/end_ponits.dart';
import 'package:marketi/core/network/errors/exceptions.dart';
import 'package:marketi/core/network/errors/failure.dart';
import 'package:marketi/features/home/data/models/brandsModel.dart';
import 'package:marketi/features/home/data/models/categories_model.dart';
import 'package:marketi/features/home/data/models/product_params.dart';
import 'package:marketi/features/home/data/models/products_model.dart';

class HomeRemoteDataSource {
  ApiConsumer api;

  HomeRemoteDataSource(this.api);

  Future<Either<CategoriesModel, Failure>> getCategories() async{
    try{
      var response = await api.get(EndPoint.categories);
      return Left(CategoriesModel.fromJson(response));
    } on ServerException catch(e){
      return Right(Failure(errMessage: e.errModel.errorMessage));
    }
  }

  Future<Either<ProductsModel, Failure>> getProducts({required ProductParams params}) async{
    try{
      var response = await api.get(EndPoint.products, queryParameters: params.toJson());
      return Left(ProductsModel.fromJson(response));
    } on ServerException catch(e){
      return Right(Failure(errMessage: e.errModel.errorMessage));
    }
  }

  Future<Either<BrandsModel, Failure>> getBrands() async{
    try{
      var response = await api.get(EndPoint.brands);
      return Left(BrandsModel.fromJson(response));
    } on ServerException catch(e){
      return Right(Failure(errMessage: e.errModel.errorMessage));
    }
  }
}