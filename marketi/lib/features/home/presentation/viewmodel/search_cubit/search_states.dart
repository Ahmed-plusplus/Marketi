abstract class SearchStates {}

class SearchInitStates extends SearchStates {}

class SearchLoadingStates extends SearchStates {}
class SearchSuccessStates extends SearchStates {}
class SearchErrorStates extends SearchStates {
  String message;
  SearchErrorStates(this.message);
}

class SearchClearStates extends SearchStates {}
