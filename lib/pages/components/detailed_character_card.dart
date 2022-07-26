import 'package:api/src/data/get_episodes_service.dart';
import 'package:api/src/models/episode.dart';
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
                    Icon(
                      Icons.circle,
                      size: 8,
                      color: iconColor(detailedCharacter.status),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${detailedCharacter.status} - ${detailedCharacter.species}',
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 12.5,
                        fontWeight: FontWeight.w500,
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
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  detailedCharacter.location.name,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 12.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  'First seen in:',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 12.5,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(height: 4),
                firstSeen(detailedCharacter.episode),
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
    case 'Unknown':
      return AppColors.gray;
    default:
      return AppColors.black;
  }
}

Widget firstSeen(List<String> episodes) {
  final String firstEpisode = episodes.first;

  final Future<List<Episode>> allEpisodes = EpisodeService().getAllEpisodes();

  FutureBuilder(
    future: allEpisodes,
    builder: (_, AsyncSnapshot<List<Episode>> snapshot) {
      if (snapshot.hasData) {
        final dataResults = snapshot.data!;
        return ListView.separated(
          itemBuilder: (_, index) {
            final episode = dataResults[index];
            final String episodeName;

            if (firstEpisode == episode.url) {
              episodeName = episode.name;
            } else {
              episodeName = 'error';
            }

            return Text(
              episodeName,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 12.5,
                fontWeight: FontWeight.w500,
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemCount: dataResults.length,
        );
      }
      return Container();
    },
  );

  return Container();
}
