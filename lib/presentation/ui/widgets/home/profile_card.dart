import 'package:flutter/material.dart';
import 'package:flutter_assignment_2024/presentation/ui/utility/Pallets.dart';
import 'package:gap/gap.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String company;
  final String location;
  final String imagePath;

  const ProfileCard({
    super.key,
    required this.name,
    required this.company,
    required this.location,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;

    return Card(
      surfaceTintColor: Pallets.surfaceColor,
      color: Pallets.surfaceColor,
      elevation: 1,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(deviceSize.width * 0.04), 
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: deviceSize.width * 0.1, 
                backgroundImage: AssetImage(imagePath),
              ),
              SizedBox(width: deviceSize.width * 0.03), 
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontFamily: 'Noto Serif Bengali',
                      fontSize: deviceSize.width * 0.05,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    company,
                    style: TextStyle(
                      fontFamily: 'Noto Serif Bengali',
                      fontSize: deviceSize.width * 0.035, 
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Iconsax.location_copy, size: deviceSize.width * 0.04), 
                      const Gap(4),
                      Text(
                        location,
                        style: TextStyle(
                          fontFamily: 'Noto Serif Bengali',
                          fontSize: deviceSize.width * 0.035, 
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
