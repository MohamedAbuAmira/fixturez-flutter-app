class SliderModel {
  late String imgUrl;
  // late String title;
  // late String description;

  void setImageUrl(String getImageUrl) {
    imgUrl = getImageUrl;
  }

  // void setgetTitle(String getTitle) {
  //   title = getTitle;
  // }

  // void setDescription(String getDescription) {
  //   description = getDescription;
  // }

  String getImageUrl() {
    return imgUrl;
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
  slideModel.setImageUrl(
      "https://images.unsplash.com/photo-1493663284031-b7e3aefcae8e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80");

  slides.add(slideModel);

  // Slider 2
  slideModel = SliderModel();
  slideModel.setImageUrl(
      "https://images.unsplash.com/photo-1524758631624-e2822e304c36?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80");

  slides.add(slideModel);

  // Slider 3
  slideModel = SliderModel();
  slideModel.setImageUrl(
      "https://images.unsplash.com/photo-1555041469-a586c61ea9bc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80");

  slides.add(slideModel);

  // Slider 4
  slideModel = SliderModel();
  slideModel.setImageUrl(
      "https://images.unsplash.com/photo-1538688525198-9b88f6f53126?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80");

  slides.add(slideModel);
  return slides;
}
