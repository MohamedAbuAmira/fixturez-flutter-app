class SliderModel {
  late String imgPath;
  // late String title;
  // late String description;

  void setImagePath(String getImagePath) {
    imgPath = getImagePath;
  }

  // void setgetTitle(String getTitle) {
  //   title = getTitle;
  // }

  // void setDescription(String getDescription) {
  //   description = getDescription;
  // }

  String getImagePath() {
    return imgPath;
  }

  // String getTitle() {
  //   return title;
  // }

  // String getdescription() {
  //   return description;
  // }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = <SliderModel>[];
  SliderModel slideModel = SliderModel();

  // Slider 1
  slideModel.setImagePath("assets/images/slider1.jpg");

  slides.add(slideModel);

  // Slider 2
  slideModel = SliderModel();
  slideModel.setImagePath("assets/images/slider2.jpg");

  slides.add(slideModel);

  // Slider 3
  slideModel = SliderModel();
  slideModel.setImagePath("assets/images/slider3.jpg");

  slides.add(slideModel);

  // Slider 4
  slideModel = SliderModel();
  slideModel.setImagePath("assets/images/slider4.jpg");

  slides.add(slideModel);
  return slides;
}
