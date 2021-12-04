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

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> with Helpers {
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
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: AppIcons.customIcon(iconName: "ic_back"),
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Create an account',
                        textAlign: TextAlign.start,
                        style: AppTextStyles.PoppinsH1(
                            textColor: AppColors.darkColor)),
                  ),
                  SizedBox(height: 16.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: 315.w,
                      height: 48.h,
                      child: Text(
                          'Give us some of your information for shopping to Fixturez store',
                          overflow: TextOverflow.fade,
                          style: AppTextStyles.PoppinsBody2(
                              textColor: AppColors.primaryGreyColor)),
                    ),
                  ),
                  SizedBox(height: 50.h),
                  SignUpForm(
                    cities: cities,
                  ),
                  SizedBox(height: 16.h),
                  termsAndConditionsText(),
                  SizedBox(height: 37.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  RichText termsAndConditionsText() {
    return RichText(
      text: TextSpan(
        style: AppTextStyles.PoppinsFootnote(textColor: AppColors.primaryColor),
        children: <TextSpan>[
          const TextSpan(text: 'By tapping “Sign Up” you accept our '),
          TextSpan(
              text: 'Terms of Service',
              style: AppTextStyles.PoppinsFootnote(
                  textColor: AppColors.secondaryColor),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  print('terms and condition');
                }),
        ],
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key, required this.cities}) : super(key: key);
  final List<City> cities;

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> with Helpers {
  late TextEditingController _emailTextcontroller;
  late TextEditingController _passwordTextcontroller;
  late TextEditingController _conformedPasswordTextcontroller;
  late TextEditingController _userNameTextcontroller;
  late TextEditingController _phoneNumberTextcontroller;
  late TextEditingController _nameTextcontroller;

  @override
  void initState() {
    super.initState();

    _emailTextcontroller = TextEditingController();
    _passwordTextcontroller = TextEditingController();
    _conformedPasswordTextcontroller = TextEditingController();
    _userNameTextcontroller = TextEditingController();
    _phoneNumberTextcontroller = TextEditingController();
    _nameTextcontroller = TextEditingController();
  }

  @override
  void dispose() {
    _emailTextcontroller.dispose();
    _passwordTextcontroller.dispose();
    _conformedPasswordTextcontroller.dispose();
    _userNameTextcontroller.dispose();
    _phoneNumberTextcontroller.dispose();
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
          controller: _userNameTextcontroller,
          hintText: "Enter your Username",
          labelText: "Username",
        ),
        SizedBox(height: 25.h),
        InputTextField(
          controller: _emailTextcontroller,
          hintText: "Enter your Email",
          labelText: "Email",
          textInputType: TextInputType.emailAddress,
        ),
        SizedBox(height: 25.h),
        InputTextField(
          controller: _nameTextcontroller,
          hintText: "Enter your Name",
          labelText: "Full Name",
          textInputType: TextInputType.name,
        ),
        SizedBox(height: 25.h),
        InputTextField(
          controller: _phoneNumberTextcontroller,
          hintText: "Enter your Phone Number",
          labelText: "Phone Number",
          textInputType: TextInputType.phone,
        ),
        SizedBox(height: 25.h),
        selectCityDropDownButton(),
        SizedBox(height: 25.h),
        selectGenderDropDownButton(),
        SizedBox(height: 25.h),
        InputTextField(
          controller: _passwordTextcontroller,
          hintText: "Enter your password",
          labelText: "Password",
          suffixIcon: AppIcons.customIcon(
            iconName: 'ic_eye_slash',
            iconColor: AppColors.primaryGreyColor,
          ),
          obscureText: true,
        ),
        SizedBox(height: 25.h),
        InputTextField(
          controller: _conformedPasswordTextcontroller,
          hintText: "Conform your password",
          labelText: "Password",
          suffixIcon: AppIcons.customIcon(
              iconName: 'ic_eye_slash', iconColor: AppColors.primaryGreyColor),
          obscureText: true,
        ),
        SizedBox(
          height: 20.h,
        ),
        DefaultButton(
            press: () async => await performSingup(), text: "Sign Up"),
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

    int getCityId(String cityName) {
      final City _city =
          widget.cities.firstWhere((element) => element.cityNameEn == cityName);
      return _city.id;
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

  Future<void> performSingup() async {
    if (chechData()) {
      await singup();
    }
  }

  bool chechData() {
    if (_emailTextcontroller.text.isNotEmpty &&
        _passwordTextcontroller.text.isNotEmpty &&
        _nameTextcontroller.text.isNotEmpty &&
        _conformedPasswordTextcontroller.text.isNotEmpty &&
        _phoneNumberTextcontroller.text.isNotEmpty &&
        _cityDropDownValue != null &&
        _genderDropDownValue != null) {
      return true;
    } else {
      showSnackBar(
          context: context, message: "Enter required data", error: true);
      return false;
    }
  }

  Future<void> singup() async {
    bool status = await UserWebService().register(context, user: user);
    print(status);
    // await SharedPrefController()
    //     .savePhoneNumber(phone: _phoneNumberTextcontroller.text);
    if (status) {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacementNamed(context, AppRouter.home);
      });
    } else {}
  }

  User get user {
    User user = User();
    user.name = _nameTextcontroller.text;
    user.mobile = _phoneNumberTextcontroller.text;
    user.password = _passwordTextcontroller.text;
    user.gender = _genderDropDownValue;
    // user.cityId = _cityDropDownValue;
    user.cityId = 2;
    return user;
  }
}
