import 'package:flutter/material.dart';
import 'package:flutter_assignment_2024/presentation/state_holders/main_bottom_nav_screen_controller.dart';
import 'package:flutter_assignment_2024/presentation/ui/utility/Pallets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';


class MainBottomNavScreen extends StatelessWidget {
  const MainBottomNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavScreenController>(
      init: MainBottomNavScreenController(),
      builder: (mainBottomNavScreenController) {
        return Scaffold(
          body: PageStorage(
            bucket: mainBottomNavScreenController.bucket,
            child: mainBottomNavScreenController.screens[mainBottomNavScreenController.currentTab],
          ),
          floatingActionButton: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  colors: [
                    Pallets.gredientColorA,
                    Pallets.gredientColorB
                  ], 
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.5, 1.0],
                  tileMode: TileMode.mirror),
            ),
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.transparent, 
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  'assets/images/camera.png',
                  fit: BoxFit.fill,
                ),
              ), // Remove elevation
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            height: 75,
            color: Pallets.surfaceColor,
            shape: const CircularNotchedRectangle(),
            notchMargin: 10,
            child: SizedBox(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 50,
                    onPressed: () {
                      mainBottomNavScreenController.changeScreen(0);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          mainBottomNavScreenController.currentTab == 0
                              ? Iconsax.home_2
                              : Iconsax.home_2_copy,
                          color: Pallets.onSurfaceColor,
                        ),
                        const Gap(5),
                        Container(
                          width: 4,
                          height: 4,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: mainBottomNavScreenController.currentTab == 0
                                ? const LinearGradient(
                                    colors: [
                                      Pallets.gredientColorA,
                                      Pallets.gredientColorB
                                    ], 
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  )
                                : null, 
                          ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 50,
                    onPressed: () {
                      mainBottomNavScreenController.changeScreen(1);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          mainBottomNavScreenController.currentTab == 1
                              ? Iconsax.calendar
                              : Iconsax.calendar_1_copy,
                          color: Pallets.onSurfaceColor,
                        ),
                        const Gap(5),
                        Container(
                          width: 4,
                          height: 4,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: mainBottomNavScreenController.currentTab == 1
                                ? const LinearGradient(
                                    colors: [
                                      Pallets.gredientColorA,
                                      Pallets.gredientColorB
                                    ], 
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  )
                                : null, 
                          ),
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  MaterialButton(
                    minWidth: 50,
                    onPressed: () {
                      mainBottomNavScreenController.changeScreen(2);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          mainBottomNavScreenController.currentTab == 2
                              ? Iconsax.clock
                              : Iconsax.clock_copy,
                          color: Pallets.onSurfaceColor,
                        ),
                        const Gap(5),
                        Container(
                          width: 4,
                          height: 4,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: mainBottomNavScreenController.currentTab == 2
                                ? const LinearGradient(
                                    colors: [
                                      Pallets.gredientColorA,
                                      Pallets.gredientColorB
                                    ], 
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  )
                                : null, 
                          ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 50,
                    onPressed: () {
                      mainBottomNavScreenController.changeScreen(3);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          mainBottomNavScreenController.currentTab == 3
                              ? Iconsax.user
                              : Iconsax.user_copy,
                          color: Pallets.onSurfaceColor,
                        ),
                        const Gap(5),
                        Container(
                          width: 4,
                          height: 4,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: mainBottomNavScreenController.currentTab == 3
                                ? const LinearGradient(
                                    colors: [
                                      Pallets.gredientColorA,
                                      Pallets.gredientColorB
                                    ], 
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  )
                                : null, 
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}