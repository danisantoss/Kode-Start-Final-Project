import 'package:flutter/material.dart';
import '../../src/models/character.dart';
import '../../src/theme/app_colors.dart';

class DetailedCharacterCard extends StatelessWidget {
  const DetailedCharacterCard({
    Key? key,
    required this.detailedCharacter,
  }) : super(key: key);

  final Character detailedCharacter;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.primaryLightColor,
      clipBehavior: Clip.antiAlias,
      margin:
          const EdgeInsets.symmetric(horizontal: 20, vertical: 7.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            detailedCharacter.image,
            width: 320,
            height: 160,
            fit: BoxFit.fitWidth,
          ),
        ],
      ),
    );
  }
}