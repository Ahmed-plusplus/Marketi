import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/routes/routes_name.dart';
import 'package:marketi/features/auth/presentation/viewmodel/cubit/auth_cubit.dart';
import 'package:marketi/features/auth/presentation/views/change_password_view.dart';
import 'package:marketi/features/auth/presentation/views/forget_password_with_email_view.dart';
import 'package:marketi/features/auth/presentation/views/forget_password_with_phone_view.dart';
import 'package:marketi/features/auth/presentation/views/login_view.dart';
import 'package:marketi/features/auth/presentation/views/signup_view.dart';
import 'package:marketi/features/auth/presentation/views/update_password_successful_view.dart';
import 'package:marketi/features/auth/presentation/views/verification_code_with_email_view.dart';
import 'package:marketi/features/auth/presentation/views/verification_code_with_phone_view.dart';
import 'package:marketi/features/home/presentation/viewmodel/home_cubit.dart';
import 'package:marketi/features/home/presentation/views/all_brands_view.dart';
import 'package:marketi/features/home/presentation/views/all_categories_view.dart';
import 'package:marketi/features/home/presentation/views/best_for_you_view.dart';
import 'package:marketi/features/home/presentation/views/brands_view.dart';
import 'package:marketi/features/home/presentation/views/buy_again_view.dart';
import 'package:marketi/features/home/presentation/views/cart_view.dart';
import 'package:marketi/features/home/presentation/views/categories_view.dart';
import 'package:marketi/features/home/presentation/views/checkout_view.dart';
import 'package:marketi/features/home/presentation/views/favorites_view.dart';
import 'package:marketi/features/home/presentation/views/home_view.dart';
import 'package:marketi/features/home/presentation/views/offer_view.dart';
import 'package:marketi/features/home/presentation/views/popular_product_view.dart';
import 'package:marketi/features/home/presentation/views/product_details_view.dart';
import 'package:marketi/features/home/presentation/views/product_view.dart';
import 'package:marketi/features/home/presentation/views/search_view.dart';
import 'package:marketi/features/home/presentation/views/success_view.dart';
import 'package:marketi/features/menu/presentation/views/my_order_view.dart';
import 'package:marketi/features/menu/presentation/views/support_view.dart';
import 'package:marketi/features/menu/presentation/views/vouchers_view.dart';
import 'package:marketi/features/onboarding/presentation/viewmodel/cubit/on_boarding_cubit.dart';
import 'package:marketi/features/onboarding/presentation/views/on_boarding_view.dart';
import 'package:marketi/features/portfolio/presentation/views/account_setting_view.dart';
import 'package:marketi/features/portfolio/presentation/views/profile_view.dart';
import 'package:marketi/features/splash/presentation/views/splash_view.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: RoutesName.onBoarding,
      builder: (context, state) => BlocProvider(
        create: (context) => OnBoardingCubit(),
        child: const OnBoardingView(),
      ),
    ),
    GoRoute(
      path: RoutesName.signIn,
      builder: (context, state) => BlocProvider(
        create: (context) => AuthCubit(),
        child: const LoginView(),
      ),
    ),
    GoRoute(
      path: RoutesName.signUp,
      builder: (context, state) => BlocProvider(
        create: (context) => AuthCubit(),
        child: const SignupView(),
      ),
    ),
    GoRoute(
      path: RoutesName.changePassword,
      builder: (context, state) => BlocProvider(
        create: (context) => AuthCubit(),
        child: const ChangePasswordView()
      ),
    ),
    GoRoute(
      path: RoutesName.passwordUpdated,
      builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: const UpdatePasswordSuccessfulView()
      ),
    ),
    GoRoute(
      path: RoutesName.forgetPasswordWithEmail,
      builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: const ForgetPasswordWithEmailView()
      ),
    ),
    GoRoute(
      path: RoutesName.forgetPasswordWithPhone,
      builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: const ForgetPasswordWithPhoneView()
      ),
    ),
    GoRoute(
      path: RoutesName.verificationCodeWithEmail,
      builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: const VerificationCodeWithEmailView()
      ),
    ),
    GoRoute(
      path: RoutesName.verificationCodeWithPhone,
      builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: const VerificationCodeWithPhoneView()
      ),
    ),
    GoRoute(
      path: RoutesName.home,
      builder: (context, state) => BlocProvider(
        create: (context) => HomeCubit()..fetchHomeData(),
        child: const HomeView()
      ),
    ),
    GoRoute(
      path: RoutesName.favorite,
      builder: (context, state) => const FavoritesView(),
    ),
    GoRoute(
      path: RoutesName.offer,
      builder: (context, state) => const OfferView(),
    ),
    GoRoute(
      path: RoutesName.search,
      builder: (context, state) => const SearchView(),
    ),
    GoRoute(
      path: RoutesName.popularProduct,
      builder: (context, state) => const PopularProductView(),
    ),
    GoRoute(
      path: RoutesName.categories,
      builder: (context, state) => const CategoriesView(),
    ),
    GoRoute(
      path: RoutesName.brands,
      builder: (context, state) => const BrandsView(),
    ),
    GoRoute(
      path: RoutesName.allCategories,
      builder: (context, state) => const AllCategoriesView(),
    ),
    GoRoute(
      path: RoutesName.allBrands,
      builder: (context, state) => const AllBrandsView(),
    ),
    GoRoute(
      path: RoutesName.bestForYou,
      builder: (context, state) => const BestForYouView(),
    ),
    GoRoute(
      path: RoutesName.buyAgain,
      builder: (context, state) => const BuyAgainView(),
    ),
    GoRoute(
      path: RoutesName.cart,
      builder: (context, state) => const CartView(),
    ),
    GoRoute(
      path: RoutesName.checkout,
      builder: (context, state) => const CheckoutView(),
    ),
    GoRoute(
      path: RoutesName.success,
      builder: (context, state) => const SuccessView(),
    ),
    GoRoute(
      path: RoutesName.product,
      builder: (context, state) => const ProductView(),
    ),
    GoRoute(
      path: RoutesName.productDetails,
      builder: (context, state) => const ProductDetailsView(),
    ),
// static const myOrder = '/myOrder';
    GoRoute(
      path: RoutesName.myOrder,
      builder: (context, state) => const MyOrderView(),
    ),
// static const support = '/support';
    GoRoute(
      path: RoutesName.support,
      builder: (context, state) => const SupportView(),
    ),
// static const vouchers = '/vouchers';
    GoRoute(
      path: RoutesName.vouchers,
      builder: (context, state) => const VouchersView(),
    ),
// static const profile = '/profile';
    GoRoute(
      path: RoutesName.profile,
      builder: (context, state) => const ProfileView(),
    ),
// static const accountSetting = '/accountSetting';
    GoRoute(
      path: RoutesName.accountSetting,
      builder: (context, state) => const AccountSettingView(),
    ),

//

  ]
);