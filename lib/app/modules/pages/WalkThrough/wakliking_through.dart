import 'package:capar/app/modules/controllers/initializer_controller.dart';
import 'package:capar/core/values/assets.dart';
import 'package:capar/core/values/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WalkThrough extends StatefulWidget {
  @override
  _WalkThroughState createState() => _WalkThroughState();
}

class _WalkThroughState extends State<WalkThrough> {
  PageController _pageController = PageController();
  int currentIndex = 0;

  static const _kDuration = Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  // passed() {
  //   Get.find<InitializerController>().markPased();
  // }

  nextFunction() {
    _pageController.nextPage(duration: _kDuration, curve: _kCurve);
  }

  previousFunction() {
    _pageController.previousPage(duration: _kDuration, curve: _kCurve);
  }

  onChangedFunction(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget item(String image, String header, String descr) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        children: <Widget>[
          Text(
            header,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontSize: 25.sp,
                  color: Theme.of(context).primaryColor,
                ),
          ),
          Image.asset(
            image,
            fit: BoxFit.fitWidth,
            width: 350.h,
            alignment: Alignment.bottomCenter,
          ),
          SizedBox(height: 50.h),
          Text(
            descr,
            style: TextStyle(
                fontSize: 16.sp,
                color: Theme.of(context).colorScheme.secondary),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Stack(
        children: <Widget>[
          PageView(
            controller: _pageController,
            onPageChanged: onChangedFunction,
            children: <Widget>[
              item(
                MyAssetsImages.postBanner,
                "Çapar programmasyna \nhoş geldiňiz",
                "Poçta çaparçylyk hyzmaty Siziň üçin elmydama elýeterli",
              ),
              item(
                MyAssetsImages.pngPyggBanner,
                "PÝGG jerimeler",
                "Size gerek islendik bolan wagtda awtoulag jerimelerini görmek we tölemek mümkinçiligi bar",
              ),
              item(
                MyAssetsImages.toleglerBanner,
                "Ähli tölegler bir ýerde",
                "Döwlet hyzmatlaryň ählisini, telefon, internet, kabel TV we beýleki kommunal töleglerini aňsat usulda tölegini geçir",
              ),
            ],
          ),
          Positioned(
            bottom: 120.h,
            left: 150.w,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Indicator(
                  positionIndex: 0,
                  currentIndex: currentIndex,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Indicator(
                  positionIndex: 1,
                  currentIndex: currentIndex,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Indicator(
                  positionIndex: 2,
                  currentIndex: currentIndex,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 30.h,
            left: 30.h,
            child: Container(
              height: 50.h,
              width: 300.w,
              //padding: EdgeInsets.only(right: 30.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (currentIndex == 0)
                    SizedBox()
                  else
                    TextButton(
                      onPressed: () => previousFunction(),
                      child: Text("Öňki"),
                    ),
                  if (currentIndex == 2)
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Okadym",
                        style: TextStyle(color: Colors.grey.shade200),
                      ),
                      style: MyButtons.rounded(),
                    )
                  else
                    TextButton(
                      onPressed: () => nextFunction(),
                      child: Text("Indiki"),
                    )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final int positionIndex, currentIndex;
  const Indicator({required this.currentIndex, required this.positionIndex});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12,
      width: 12,
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).primaryColor),
          color: positionIndex == currentIndex
              ? Theme.of(context).primaryColor
              : Colors.transparent,
          borderRadius: BorderRadius.circular(100.r)),
    );
  }
}
