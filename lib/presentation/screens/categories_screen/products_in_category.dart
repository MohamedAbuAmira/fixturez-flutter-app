import 'package:fixturez/business_logic/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../presentation/screens/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/constants.dart';
import '../../../data/models/models.dart';
import '../../router/app_router.dart';

class ProductsInCategory extends StatefulWidget {
  const ProductsInCategory({Key? key, required this.subCategory})
      : super(key: key);
  final SubCategory subCategory;

  @override
  _ProductsInCategoryState createState() => _ProductsInCategoryState();
}

class _ProductsInCategoryState extends State<ProductsInCategory> {
  late List<Product> subCategoryProducts;
  late List<Product> searchedForProducts;
  bool _isSearching = false;
  final _searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<SubCategoryProductsCubit>(context)
        .getAllSubCategoryProducts();
  }

  Widget _buildBlocWidget() {
    return BlocBuilder<SubCategoryProductsCubit, SubCategoryProductsState>(
      builder: (context, state) {
        if (state is SubCategoryProductsLoaded) {
          subCategoryProducts = (state).subCategoryProducts;
          return _buildLoadedGridViewWidget();
        } else {
          return _showloadingLoaded();
        }
      },
    );
  }

  Widget _showloadingLoaded() {
    return const Center(
      child: CircularProgressIndicator(color: AppColors.secondaryColor),
    );
  }

  Widget _buildTextField() {
    return SearchField(
        onChange: (searchedCharacters) {
          addSearchedItemsToSearchedList(searchedCharacters);
        },
        searchTextController: _searchTextController);
  }

  void addSearchedItemsToSearchedList(String searchedCharacters) {
    searchedForProducts = subCategoryProducts
        .where((product) =>
            product.nameEn.toLowerCase().contains(searchedCharacters))
        .toList();
    setState(() {});
  }

  List<Widget> _buildAppBarActions() {
    if (_isSearching) {
      return [
        IconButton(
          onPressed: () {
            _clearSearching();
            Navigator.pop(context);
          },
          icon: AppIcons.customIcon(iconName: "ic_close"),
        ),
      ];
    } else {
      return [
        InkWell(
          onTap: _startSearch,
          child: AppIcons.customIcon(iconName: "ic_Search"),
        ),
        SizedBox(width: 26.w),
        AppIcons.customIcon(iconName: "ic_Notification"),
        SizedBox(
          width: 20.w,
        ),
      ];
    }
  }

  Text _buildAppBarTitle() {
    return Text(widget.subCategory.nameEn,
        style: AppTextStyles.PoppinsH3(textColor: AppColors.darkColor));
  }

  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _removeSearching));
    setState(() {
      _isSearching = true;
    });
  }

  void _removeSearching() {
    _clearSearching();
    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearching() {
    setState(() {
      _searchTextController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: _isSearching
              ? const BackButton(color: AppColors.primaryGreyColor)
              : IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: AppIcons.customIcon(iconName: "ic_back"),
                ),
          actions: _buildAppBarActions(),
          title: _isSearching ? _buildTextField() : _buildAppBarTitle(),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SectionDivider(),
              SizedBox(
                height: 52.h,
              ),
              _buildBlocWidget(),
            ],
          ),
        ));
  }

  Widget _buildLoadedGridViewWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: subCategoryProducts.isNotEmpty
          ? ProductsGridView(
              products: _searchTextController.text.isEmpty
                  ? subCategoryProducts
                  : searchedForProducts,
              productsCount: _searchTextController.text.isEmpty
                  ? subCategoryProducts.length
                  : searchedForProducts.length,
            )
          : Center(
              child: Text('There are no products yet',
                  style: AppTextStyles.PoppinsH3(
                      textColor: AppColors.secondaryColor)),
            ),
    );
  }
}

class ProductsGridView extends StatelessWidget {
  ProductsGridView(
      {Key? key, required this.products, required this.productsCount})
      : super(key: key);
  final List<Product> products;
  final int productsCount;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 11.h,
          mainAxisSpacing: 16.w),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: productsCount,
      scrollDirection: Axis.vertical,
      itemBuilder: (ctx, index) {
        return ProductCard(product: products[index]);
      },
    );
  }
}
