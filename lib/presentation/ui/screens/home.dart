import 'package:flutter/material.dart';
import 'package:flutter_assignment_2024/presentation/state_holders/home_controller.dart';
import 'package:flutter_assignment_2024/presentation/ui/utility/extension.dart';
import 'package:flutter_assignment_2024/presentation/ui/utility/image_assets.dart';
import 'package:get/get.dart';
import 'package:flutter_assignment_2024/presentation/ui/utility/Pallets.dart';
import 'package:flutter_assignment_2024/presentation/ui/widgets/custom_appbar.dart';
import 'package:flutter_assignment_2024/presentation/ui/widgets/home/custom_double_container.dart';
import 'package:flutter_assignment_2024/presentation/ui/widgets/home/menu_item_container.dart';
import 'package:flutter_assignment_2024/presentation/ui/widgets/home/profile_card.dart';
import 'package:gap/gap.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Home extends GetView<HomeController> {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = context.deviceSize;
    double padding = size.width * 0.05; 
    double spacing = size.height * 0.02; 
final HomeController controller = Get.find<HomeController>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(padding),
              child: Image.asset(
               AssetsPath.logo,
                width: 37,
                height: 37,
              ),
            ),
            const Text(
              'Flutter Task',
              style: TextStyle(
                fontFamily: 'Noto Serif Bengali',
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        leadingIcon: Icons.menu,
        actionIcon: Iconsax.notification_copy,
        onLeadingPressed: () {},
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: padding),
        child: Column(
          children: [
            Gap(spacing),
            const ProfileCard(
              name: 'মোঃ মোহাইমেনুল রেজা',
              company: 'সফটবিডি লিমিটেড',
              location: 'ঢাকা',
              imagePath: AssetsPath.profile,
            ),
            Gap(spacing),
            Row(
              children: [
                Column(
                  children: [
                    CircularPercentIndicator(
                      radius: size.width * 0.15, 
                      animation: true,
                      animationDuration: 1200,
                      startAngle: 180,
                      lineWidth: size.width * 0.03, 
                      percent: 0.13,
                      center: const Text(
                        "৬ মাস ৬ দিন",
                        style: TextStyle(
                          fontFamily: 'Noto Serif Bengali',
                          fontWeight: FontWeight.w600,
                          fontSize: 14.0,
                        ),
                      ),
                      circularStrokeCap: CircularStrokeCap.butt,
                      backgroundColor: Pallets.circularProgressContainerColor,
                      linearGradient: const LinearGradient(
                        colors: [
                          Pallets.gredientColorB,
                          Pallets.gredientColorA
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      rotateLinearGradient: true,
                    ),
                    Gap(spacing * 0.25), // 25% of the calculated spacing
                    const Text(
                      'সময় অতিবাহিত',
                      style: TextStyle(
                        fontFamily: 'Noto Serif Bengali',
                        fontWeight: FontWeight.w700,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: padding * 0.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'মেয়াদকাল',
                        style: TextStyle(
                          fontFamily: 'Noto Serif Bengali',
                          fontWeight: FontWeight.w600,
                          fontSize: 14.0,
                        ),
                      ),
                      const Row(
                        children: [
                          Icon(Iconsax.calendar_1_copy, size: 14),
                          Gap(5),
                          Text(
                            '১ই জানুয়ারি ২০২৪ - ৩১ই জানুয়ারি ২০৩০',
                            style: TextStyle(
                              letterSpacing: -0.17,
                              fontFamily: 'Noto Serif Bengali',
                              fontWeight: FontWeight.w500,
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                      Gap(spacing * 0.25),
                      const Text(
                        'আরও বাকি',
                        style: TextStyle(
                          fontFamily: 'Noto Serif Bengali',
                          fontWeight: FontWeight.w700,
                          color: Pallets.secondaryFontColor,
                          fontSize: 16.0,
                        ),
                      ),
                      Gap(spacing * 0.2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customDoubleContainer('০', '৫', 'বছর', context),
                          Gap(spacing * 0.75),
                          customDoubleContainer('২', '২', 'মাস', context),
                          Gap(spacing * 0.75),
                          customDoubleContainer('০', '২', 'দিন', context),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Gap(spacing * 1.8),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: size.width > 600 ? 4 : 3,
                  mainAxisSpacing: spacing,
                  crossAxisSpacing: spacing,
                  childAspectRatio: size.width > 600 ? 0.85 : 0.76,
                ),
                itemCount: controller.menuItems.length,
                itemBuilder: (context, index) {
                  return menuItemContainer(
                    imagePath: controller.menuItems[index]['imagePath']!,
                    title: controller.menuItems[index]['title']!,
                    subtitle: controller.menuItems[index]['subtitle']!, context: context, 
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}