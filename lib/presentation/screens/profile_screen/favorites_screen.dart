import 'package:fixturez/business_logic/cubit.dart';
import 'package:fixturez/core/constants/constants.dart';
import 'package:fixturez/core/constants/icons.dart';
import 'package:fixturez/data/models/models.dart';
import 'package:fixturez/presentation/router/app_router.dart';
import 'package:fixturez/presentation/screens/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  late List<Product> favoritesProducts;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<FavoritesCubit>(context).getAllSubCategoryProducts();
  }

  dynamic _buildBlocWidget() {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        if (state is FavoritesLoaded) {
          favoritesProducts = (state).favoritesProduct;
          return _buildFavoritesWidget();
        } else {
          return showloadingLoaded();
        }
      },
    );
  }

  Widget showloadingLoaded() {
    return const Center(
      child: CircularProgressIndicator(color: AppColors.secondaryColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favorites Products",
          style: AppTextStyles.PoppinsH3(textColor: AppColors.darkColor),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: AppIcons.customIcon(iconName: "ic_back"),
        ),
      ),
      body: _buildBlocWidget(),
    );
  }

  Widget _buildFavoritesWidget() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: favoritesProducts.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (ctx, index) {
        return _ProductItems(
          product: favoritesProducts[index],
        );
      },
    );
  }
}

class _ProductItems extends StatelessWidget {
  const _ProductItems({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, AppRouter.product,
              arguments: product.id);
        },
        isThreeLine: true,
        leading: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r)),
          width: 100.w,
          height: 200.h,
          margin: EdgeInsetsDirectional.fromSTEB(4.w, 0, 4.w, 0),
          child: PictureProvider(image: product.imageUrl),
        ),
        title: Text(
          product.nameEn,
          style: AppTextStyles.PoppinsSubtitle(textColor: AppColors.darkColor),
        ),
        subtitle: RichText(
          text: TextSpan(
            style: AppTextStyles.PoppinsCaption(
                textColor: AppColors.secondaryGreyColor),
            children: <TextSpan>[
              const TextSpan(text: 'Start at '),
              TextSpan(
                text: '\$${product.price}',
                style: AppTextStyles.PoppinsCaption(
                    textColor: const Color(0xFF34A853)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
