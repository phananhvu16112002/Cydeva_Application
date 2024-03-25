import 'package:carousel_slider/carousel_slider.dart';
import 'package:cydeva_application/common/Colors/AppColors.dart';
import 'package:cydeva_application/common/bases/CustomText.dart';
import 'package:cydeva_application/common/bases/CustomTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  TextEditingController searchController = TextEditingController();
  List<String> imageUrls = [
    'assets/images/image.png',
    'assets/images/image2.png',
    'assets/images/image3.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutral02,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [appBar(), body()],
            ),
          ),
        ),
      ),
    );
  }

  Widget body() {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomText(
                      message: 'Hot Camp',
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary3),
                  Row(
                    children: [
                      const CustomText(
                          message: 'See more',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primary3),
                      const SizedBox(
                        width: 4,
                      ),
                      SvgPicture.asset('assets/icons/more.svg',
                          fit: BoxFit.none)
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 16 / 13,
                  viewportFraction: 0.7,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  // autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
                items: imageUrls.map((e) {
                  return Container(
                    width: 250,
                    height: 300,
                    decoration: const BoxDecoration(
                      color: AppColors.primary3,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            e,
                            width: 220,
                            height: 190,
                            fit: BoxFit.cover, // Đảm bảo hình ảnh không bị cắt
                          ),
                          SizedBox(height: 16),
                          const CustomText(
                            message: 'Himalayaa mountain peak',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.colorText,
                          ),
                          SizedBox(height: 2),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/location.svg',
                                fit: BoxFit.none,
                              ),
                              SizedBox(width: 2),
                              const CustomText(
                                message: 'Himalayan',
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: AppColors.colorText,
                              ),
                            ],
                          ),
                          SizedBox(height: 2),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/star.svg',
                                fit: BoxFit.none,
                              ),
                              SizedBox(width: 2),
                              const CustomText(
                                message: '4.5  ',
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: AppColors.colorText,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ));
  }

  Widget appBar() {
    return Container(
      height: 190,
      width: double.infinity,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16)),
          image: DecorationImage(
            image: AssetImage(
              'assets/images/appbar.png',
            ),
            fit: BoxFit.cover,
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        message: "Let's start a new adventure",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.neutralWhite),
                    CustomText(
                        message: "Tasha",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.neutralWhite)
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/notice.svg',
                        color: AppColors.neutralWhite),
                    const SizedBox(
                      width: 9,
                    ),
                    Container(
                      width: 42,
                      height: 42,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: Image.asset('assets/images/avatar.png'),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Container(
                  width: 290,
                  height: 55,
                  decoration: BoxDecoration(
                      color: AppColors.neutralWhite,
                      borderRadius: const BorderRadius.all(Radius.circular(32)),
                      border: Border.all(color: AppColors.borderColor)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      SvgPicture.asset(
                        'assets/icons/search.svg',
                        fit: BoxFit.none,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                              message: 'Where are you going',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.neutral06),
                          SizedBox(
                            height: 4,
                          ),
                          CustomText(
                              message: 'Explore new lands, conquer big...',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.neutral05),
                        ],
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      SvgPicture.asset(
                        'assets/icons/mic.svg',
                        fit: BoxFit.none,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Container(
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(26)),
                        border: Border.all(color: AppColors.neutral05)),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/icons/filter.svg',
                        fit: BoxFit.none,
                      ),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget customTextFormField(
    double width,
    double height,
    bool readOnly,
    TextEditingController controller,
    TextInputType textInputType,
    bool obscureText,
    Color colorHintText,
    SvgPicture prefixIcon,
    SvgPicture suffixIcon,
    String hintText,
  ) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(32)),
      child: TextFormField(
        readOnly: readOnly,
        controller: controller,
        keyboardType: textInputType,
        style: const TextStyle(
            color: AppColors.primaryText,
            fontWeight: FontWeight.normal,
            fontSize: 15),
        obscureText: obscureText,
        decoration: InputDecoration(
            hintStyle: TextStyle(color: colorHintText, fontSize: 16),
            border: const OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: AppColors.borderColor),
                borderRadius: BorderRadius.all(Radius.circular(32))),
            contentPadding: const EdgeInsets.all(20),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            hintText: hintText, // change here hinttext
            // label: const SizedBox(
            //   width: 188,
            //   height: 40,
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       CustomText(
            //           message: 'Where are you going ?',
            //           fontSize: 16,
            //           fontWeight: FontWeight.w600,
            //           color: AppColors.neutral06),
            //     ],
            //   ),
            // ),
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(32)),
                borderSide: BorderSide(width: 1, color: AppColors.borderColor)),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32)),
              borderSide: BorderSide(width: 1, color: AppColors.borderColor),
            )),
      ),
    );
  }
}
