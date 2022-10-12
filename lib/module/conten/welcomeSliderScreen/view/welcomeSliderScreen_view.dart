import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controller/welcomeSliderScreen_controller.dart';

class WelcomeSliderScreenView extends ConsumerWidget {
  const WelcomeSliderScreenView({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    WelcomeSliderScreenController controller =
        ref.watch(welcomeSliderScreenController);
    controller.view = this;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.75,
                    decoration: BoxDecoration(
                      color: Colors.red[200],
                    ),
                    child: Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        var itemBanner = controller.banner[index];
                        return Image.network(
                          itemBanner,
                          fit: BoxFit.fill,
                        );
                      },
                      itemCount: controller.banner.length,
                      pagination: const SwiperPagination(),
                      viewportFraction: 1,
                      scale: 1,
                      autoplay: true,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.75,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10.0, right: 20),
                      child: Text(
                        "Skip",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 50,
                    left: 30,
                    right: 30,
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/image/logo-with-bg.png",
                          width: 200.0,
                          height: 200.0,
                          fit: BoxFit.fill,
                        ),
                        const Text(
                          "Easy Shoping",
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          "Fresh  Grocery at your doorstep in the next hour",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    const Spacer(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 50.0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12), // <-- Radius
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Next",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
