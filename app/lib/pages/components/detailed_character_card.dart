import 'package:flutter/material.dart';
import '../../src/models/character.dart';
import '../../src/theme/app_colors.dart';
import 'first_seen_widget.dart';
import 'package:icon_decoration/icon_decoration.dart';

class DetailedCharacterCard extends StatelessWidget {
  const DetailedCharacterCard({
    Key? key,
    required this.detailedCharacter,
  }) : super(key: key);

  final Character detailedCharacter;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.blue,
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 7.5,
      ),
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
          Padding(
            padding: const EdgeInsets.only(
              top: 12,
              left: 16,
              right: 16,
              bottom: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  detailedCharacter.name.toUpperCase(),
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 14.5,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 38),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    DecoratedIcon(
                      icon: Icon(
                        Icons.circle,
                        size: 8,
                        color: iconColor(detailedCharacter.status),
                      ),
                      decoration: const IconDecoration(
                        border: IconBorder(
                          color: AppColors.white,
                          width: 2,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${detailedCharacter.status} - ${detailedCharacter.species}',
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 12.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                const Text(
                  'Last know location:',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 12.5,
                    fontWeight: FontWeight.w100,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  detailedCharacter.location.name,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 12.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  'First seen in:',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 12.5,
                    fontWeight: FontWeight.w100,
                  ),
                ),
                const SizedBox(height: 4),
                FirstSeen(characterEpisodes: detailedCharacter.episode),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Color iconColor(String status) {
  switch (status) {
    case 'Alive':
      return AppColors.green;
    case 'Dead':
      return AppColors.red;
    case 'unknown':
      return AppColors.gray;
    default:
      return AppColors.black;
  }
}
