import 'package:flutter/material.dart';
import '../../src/models/character.dart';
import '../../src/theme/app_colors.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    Key? key,
    required this.character,
    this.onTap,
  }) : super(key: key);

  final Character character;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.primaryLightColor,
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 7.5,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              character.image,
              width: 320,
              height: 160,
              fit: BoxFit.fitWidth,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              child: Text(
                character.name.toUpperCase(),
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 14.5,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
