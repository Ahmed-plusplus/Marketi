abstract class HomeStates {}

class HomeInitStates extends HomeStates {}

class LoadingCategoriesStates extends HomeStates {}
class SuccessCategoriesStates extends HomeStates {}
class FailedCategoriesStates extends HomeStates {
  String message;

  FailedCategoriesStates(this.message);
}

class LoadingProductsStates extends HomeStates {}
class SuccessProductsStates extends HomeStates {}
class FailedProductsStates extends HomeStates {
  String message;

  FailedProductsStates(this.message);
}

class LoadingBrandsStates extends HomeStates {}
class SuccessBrandsStates extends HomeStates {}
class FailedBrandsStates extends HomeStates {
  String message;

  FailedBrandsStates(this.message);
}
