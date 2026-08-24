import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/features/onboarding/presentation/viewmodel/cubit/on_boarding_states.dart';

class OnBoardingCubit extends Cubit<OnBoardingStates>{
  OnBoardingCubit() : super(OnBoardingInitStates());

  static OnBoardingCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  void onPageChanged(int index){
    currentIndex = index;
    emit(OnPageChangedStates());
  }

}