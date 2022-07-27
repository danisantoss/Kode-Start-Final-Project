import 'package:flutter/material.dart';
import '../../src/data/get_episodes_service.dart';
import '../../src/models/episode.dart';
import '../../src/theme/app_colors.dart';

class FirstSeen extends StatefulWidget {
  final List<String> characterEpisodes;
  const FirstSeen({Key? key, required this.characterEpisodes})
      : super(key: key);

  @override
  State<FirstSeen> createState() => _FirstSeenState();
}

class _FirstSeenState extends State<FirstSeen> {
  Future<List<Episode>>? episodes;

  @override
  void initState() {
    episodes = EpisodeService().getAllEpisodes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: FutureBuilder(
        future: episodes,
        builder: (_, AsyncSnapshot<List<Episode>> snapshot) {
          if (snapshot.hasData) {
            final dataResults = snapshot.data!;

            return ListView.separated(
              itemBuilder: (_, index) {
                final episode = dataResults[index];
                final firstEpisodeUrl = widget.characterEpisodes.first;
                final size = firstEpisodeUrl.length;
                final int id = int.parse(firstEpisodeUrl[size - 1]);
                final String episodeName;

                if (id == episode.id) {
                  episodeName = episode.name;
                  return Text(
                    episodeName,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 12.5,
                      fontWeight: FontWeight.w900,
                    ),
                  );
                }
                return const SizedBox(width: 0, height: 0);
              },
              separatorBuilder: (context, index) => const SizedBox(height: 0),
              itemCount: dataResults.length,
            );
          }
          return Container();
        },
      ),
    );
  }
}
