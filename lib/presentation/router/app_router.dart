import 'package:fixturez/core/exceptions/route_exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/cubit.dart';
import '../../data/models/models.dart';
import '../../data/repository/repository.dart';
import '../../data/web_services/web_services.dart';
import '../screens/screens.dart';

class AppRouter {
  static const String launch = 'launch_screen';
  static const String login = '/login_screen';
  static const String forgotPassword = '/forgot_password_screen';
  static const String resetPassword = '/reset_password';
  static const String signup = '/signup_screen';
  static const String activateAccount = '/activate_account';
  static const String home = '/';
  static const String productsInSubCategory = 'products_in_category';
  static const String subCategories = 'sub_categories_screen';
  static const String product = 'product_screen';
  static const String updateProfile = 'update_profile_screen';
  static const String changePassword = 'change_password_screen';
  ///////////////////////////////////////////////////////////////

  // AppRouter() {}

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case launch:
        return MaterialPageRoute(
          builder: (_) => const LaunchScreen(),
        );
      case login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case forgotPassword:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordScreen(),
        );
      case resetPassword:
        final argResetPasswordDetails =
            settings.arguments as Map<String, String>;
        return MaterialPageRoute(
          builder: (_) => ResetPasswordScreen(
            resetPasswordDetails: argResetPasswordDetails,
          ),
        );
      case signup:
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(),
        );
      case activateAccount:
        final argsActivateAccountDetails =
            settings.arguments as Map<String, String>;
        return MaterialPageRoute(
          builder: (_) => ActivateAccountScreen(
            activateAccountDetails: argsActivateAccountDetails,
          ),
        );
      case home:
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );

      case subCategories:
        final argCategory = settings.arguments as Category;
        final subCategoryRepository = SubCategoryRepository(
            SubCategoriesWebService(categoryId: argCategory.id.toString()));
        final subCategoriesCubit = SubCategoriesCubit(subCategoryRepository);

        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext contex) => subCategoriesCubit,
                  child: SubCategoriesScreen(
                    category: argCategory,
                  ),
                ));

      case productsInSubCategory:
        final argSubCategory = settings.arguments as SubCategory;

        final subCategoryProductsRepository = SubCategoryProductsRepository(
            SubCategoryProductsWebService(
                subCategoryId: argSubCategory.id.toString()));
        final subCategoryProductsCubit =
            SubCategoryProductsCubit(subCategoryProductsRepository);

        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext contex) => subCategoryProductsCubit,
            child: ProductsInCategory(
              subCategory: argSubCategory,
            ),
          ),
        );

      case product:
        final argProductId = settings.arguments as int;

        final productRepository = ProductRepository(
            ProductsWebService(productId: argProductId.toString()));
        final productCubit = ProductCubit(productRepository);

        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext contex) => productCubit,
            child: ProductScreen(
                // product: argProduct,
                ),
          ),
        );
      case updateProfile:
        return MaterialPageRoute(
          builder: (_) => const UpdateProfileScreen(),
        );
      case changePassword:
        return MaterialPageRoute(
          builder: (_) => const ChangePasswordScreen(),
        );
      default:
        throw const RouteException('Route not found!');
    }
  }
}
