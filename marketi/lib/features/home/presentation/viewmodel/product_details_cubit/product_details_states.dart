abstract class ProductDetailsStates {}

class ProductDetailsInitStates extends ProductDetailsStates {}

class ProductDetailsLoadingStates extends ProductDetailsStates {}
class ProductDetailsSuccessStates extends ProductDetailsStates {

}
class ProductDetailsErrorStates extends ProductDetailsStates {
  final String errorMessage;

  ProductDetailsErrorStates(this.errorMessage);
}