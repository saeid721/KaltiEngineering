import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../custom_drawer_screen.dart';
import '../global/constants/colors_resources.dart';
import '../global/constants/images.dart';
import '../global/model.dart';
import '../global/widget/global_app_bar.dart';
import '../global/widget/global_container.dart';
import '../global/widget/home_menu_widget.dart';
import 'service_screen/commercial_residential_floor_screen.dart';
import 'service_screen/construction_chemicals_screen.dart';
import 'service_screen/damp_proofing_screen.dart';
import 'service_screen/epoxy_floor_screen.dart';
import 'service_screen/etp_protective_coating_screen.dart';
import 'service_screen/expansion_joint_screen.dart';
import 'service_screen/fair_face_plaster_screen.dart';
import 'service_screen/floor_hardener_screen.dart';
import 'service_screen/kalti_home_screen.dart';
import 'service_screen/polished_concrete_screen.dart';
import 'service_screen/pu_floor_screen.dart';
import 'service_screen/three_d_epoxy_screen.dart';
import 'service_screen/vinyl_floor_screen.dart';
import 'service_screen/waterproofing_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();

  List<GlobalMenuModel> menuItem = [
    GlobalMenuModel(img: Images.serviceInc, text: 'Home'),
    GlobalMenuModel(img: Images.serviceInc, text: 'Fair Face Plaster'),
    GlobalMenuModel(img: Images.serviceInc, text: 'Vinyl Flooring Solution'),
    GlobalMenuModel(img: Images.serviceInc, text: 'Epoxy Flooring Solution'),
    GlobalMenuModel(img: Images.serviceInc, text: 'PU Flooring Solution'),
    GlobalMenuModel(img: Images.serviceInc, text: 'Floor Hardener Solution'),
    GlobalMenuModel(img: Images.serviceInc, text: 'Polished Concrete'),
    GlobalMenuModel(img: Images.serviceInc, text: 'Waterproofing Solution'),
    GlobalMenuModel(img: Images.serviceInc, text: 'Damp Proofing Solution'),
    GlobalMenuModel(img: Images.serviceInc, text: '3D Epoxy Flooring Solution'),
    GlobalMenuModel(img: Images.serviceInc, text: 'Expansion Joint Sealant'),
    GlobalMenuModel(img: Images.serviceInc, text: 'ETP Protective Coating'),
    GlobalMenuModel(img: Images.serviceInc, text: 'Construction Chemicals'),
    GlobalMenuModel(img: Images.serviceInc, text: 'Commercial & Residential Floor'),

  ];

  int currentIndex = 0;
  final CarouselController buttonCarouselController = CarouselController();

  final List<String> sliderImage = [
    'assets/images/1.jpg',
    'assets/images/2.jpg',
    'assets/images/3.jpg',
    'assets/images/4.jpg',
    'assets/images/5.jpg',
    'assets/images/6.jpg',
    'assets/images/7.jpg',
    'assets/images/8.jpg',
    'assets/images/9.jpg',
    'assets/images/10.jpg',
    'assets/images/11.jpg',
    'assets/images/12.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: GlobalAppBar(
          title: 'Kalti Engineering',
          notiOnTap: () {},
          leading: GestureDetector(
            onTap: () {
              if (drawerKey.currentState!.isDrawerOpen) {
                drawerKey.currentState!.closeDrawer();
              } else {
                drawerKey.currentState!.openDrawer();
              }
            },
            child: const Icon(Icons.menu, color: ColorRes.white),
          ),
        ),
      ),
      key: drawerKey,
      drawer: const CustomDrawerScreen(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            spacing: 5,
            children: [
              // Carousel Slider
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, left: 10, right: 10, bottom: 5),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  child: CarouselSlider(
                    items: sliderImage.map((item) {
                      return GlobalContainer(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0)),
                          child: Image.asset(
                            item,
                            fit: BoxFit.fill,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      scrollPhysics: const BouncingScrollPhysics(),
                      autoPlay: true,
                      aspectRatio: 2,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: sliderImage.asMap().entries.map((entry) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: 2,
                    width: currentIndex == entry.key ? 15 : 7,
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: currentIndex == entry.key
                          ? ColorRes.primaryColor
                          : ColorRes.borderColor,
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 8),

              GridView.builder(
                  itemCount: menuItem.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      mainAxisExtent: 65),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  itemBuilder: (ctx, index) {
                    return GestureDetector(
                      onTap: () {
                        switch (index) {
                          case 0:
                            Get.to(() => const KaltiHomeScreen());
                            break;
                          case 1:
                            Get.to(() => const FairFacePlasterScreen());
                            break;
                          case 2:
                            Get.to(() => const VinylFlooringScreen());
                            break;
                          case 3:
                            Get.to(() => const EpoxyFlooringScreen());
                            break;
                          case 4:
                            Get.to(() => const PuFlooringScreen());
                            break;
                          case 5:
                            Get.to(() => const FloorHardenerScreen());
                            break;
                          case 6:
                            Get.to(() => const PolishedConcreteScreen());
                            break;
                          case 7:
                            Get.to(() => const WaterproofingScreen());
                            break;
                          case 8:
                            Get.to(() => const DampProofingScreen());
                            break;
                          case 9:
                            Get.to(() => const ThreeDEpoxyFlooringScreen());
                            break;
                          case 10:
                            Get.to(() => const ExpansionJointSealantScreen());
                            break;
                          case 11:
                            Get.to(() => const EtpProtectiveCoatingScreen());
                            break;
                          case 12:
                            Get.to(() => const ConstructionChemicalsScreen());
                            break;
                          case 13:
                            Get.to(() => const CommercialResidentialFloorScreen());
                            break;
                        }
                      },
                      child: HomeMenuWidget(
                        height: 30,
                        width: 30,
                        maxLines: 1,
                        imagePath: menuItem[index].img,
                        text: menuItem[index].text,
                        subText: menuItem[index].subText ?? "",
                      ),
                    );
                  }),

              //const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
