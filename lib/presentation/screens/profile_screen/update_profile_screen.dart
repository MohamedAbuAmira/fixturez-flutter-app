import 'package:fixturez/core/helpers/helpers.dart';
import 'package:fixturez/data/repository/repository.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/constants.dart';
import '../../../core/prefs/shared_pref_controller.dart';
import '../../../data/models/models.dart';
import '../../../data/web_services/web_services.dart';
import '../../router/app_router.dart';
import '../widgets/widgets.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen>
    with Helpers {
  List<City> cities = [];
  void fetchCities() async {
    final CityRepository cityRepository = CityRepository(CityWebService());
    Future<List<City>> futureCities = cityRepository.getAllCities();

    List<City> _cities = await futureCities;
    setState(() {
      cities = [..._cities];
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      fetchCities();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile",
            style: AppTextStyles.PoppinsH3(textColor: AppColors.darkColor)),
        centerTitle: true,
        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Close",
              style: AppTextStyles.PoppinsBody2(
                  textColor: AppColors.secondaryGreyColor)),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text("Save",
                style: AppTextStyles.PoppinsBody2(
                    textColor: AppColors.secondaryColor)),
          ),
        ],
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 40.w,
                  ),
                  Stack(alignment: Alignment.center, children: [
                    Container(
                      height: 90.h,
                      width: 90.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r)),
                      child:
                          AppIcons.customIcon(iconName: "ic_user_placeholder"),
                    ),
                    Center(
                      child: AppIcons.customIcon(iconName: 'ic_photo_change'),
                    ),
                  ]),
                  SizedBox(height: 50.h),
                  UpdateProfileForm(
                    cities: cities,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class UpdateProfileForm extends StatefulWidget {
  const UpdateProfileForm({Key? key, required this.cities}) : super(key: key);
  final List<City> cities;

  @override
  _UpdateProfileFormState createState() => _UpdateProfileFormState();
}

class _UpdateProfileFormState extends State<UpdateProfileForm> with Helpers {
  late TextEditingController _nameTextcontroller;
  int getCityId(String cityName) {
    final City _city =
        widget.cities.firstWhere((element) => element.cityNameEn == cityName);
    return _city.id;
  }

  @override
  void initState() {
    super.initState();

    _nameTextcontroller = TextEditingController();
  }

  @override
  void dispose() {
    _nameTextcontroller.dispose();
    super.dispose();
  }

  dynamic _cityDropDownValue;
  dynamic _genderDropDownValue;
  Color buttonColor = AppColors.secondaryColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputTextField(
          controller: _nameTextcontroller,
          hintText: "Enter your Name",
          labelText: "Full Name",
          textInputType: TextInputType.name,
        ),
        SizedBox(height: 25.h),
        selectCityDropDownButton(),
        SizedBox(height: 25.h),
        selectGenderDropDownButton(),
        SizedBox(height: 25.h),
        DefaultButton(
            press: () async => await performUpdateProfile(),
            text: "Update Profile"),
      ],
    );
  }

  DropdownButton<String> selectGenderDropDownButton() {
    return DropdownButton<String>(
      isExpanded: true,
      hint: Text(
        'Select your Gender',
        style:
            AppTextStyles.PoppinsBody1(textColor: AppColors.secondaryGreyColor),
      ),
      value: _genderDropDownValue,
      elevation: 10,
      style: const TextStyle(color: AppColors.darkColor),
      underline: Container(
        height: 1,
        color: AppColors.primaryColor,
      ),
      iconEnabledColor: AppColors.primaryGreyColor,
      onChanged: (String? newValue) {
        setState(() {
          _genderDropDownValue = newValue!;
        });
      },
      items: const [
        DropdownMenuItem(
          child: Text("Male"),
          value: 'M',
        ),
        DropdownMenuItem(
          child: Text("Femal"),
          value: 'F',
        )
      ],
    );
  }

  DropdownButton<String> selectCityDropDownButton() {
    List<String> citiesNameEng = [];
    for (City city in widget.cities) {
      citiesNameEng.add(city.cityNameEn);
    }
    return DropdownButton<String>(
      isExpanded: true,
      hint: Text(
        'Select your City',
        style:
            AppTextStyles.PoppinsBody1(textColor: AppColors.secondaryGreyColor),
      ),
      value: _cityDropDownValue,
      elevation: 10,
      style: const TextStyle(color: AppColors.darkColor),
      underline: Container(
        height: 1,
        color: AppColors.primaryColor,
      ),
      iconEnabledColor: AppColors.primaryGreyColor,
      onChanged: (String? newValue) {
        setState(() {
          _cityDropDownValue = newValue!;
        });
      },
      items: citiesNameEng.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Future<void> performUpdateProfile() async {
    if (chechData()) {
      await updateProfile();
    }
  }

  bool chechData() {
    if (_nameTextcontroller.text.isNotEmpty &&
        _cityDropDownValue != null &&
        _genderDropDownValue != null) {
      return true;
    } else {
      showSnackBar(
          context: context, message: "Enter required data", error: true);
      return false;
    }
  }

  Future<void> updateProfile() async {
    final Map<String, String> updateProfileDetails = {};
    updateProfileDetails['name'] = _nameTextcontroller.text;
    updateProfileDetails['city_id'] = getCityId(_cityDropDownValue).toString();
    updateProfileDetails['gender'] = _genderDropDownValue;
    ;
    Map authBaseResponse = await UpdateProfileWebService()
        .updateProfile(context, updateProfileDetails: updateProfileDetails);
    if (authBaseResponse['status']) {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pop(context);
      });
    } else {}
  }
}
