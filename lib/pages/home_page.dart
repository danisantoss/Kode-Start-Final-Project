import 'package:api/src/data/get_characters.dart';
import 'package:api/src/models/character.dart';
import 'package:flutter/material.dart';
//import '../src/data/repository.dart';
//import '../src/models/paginated_characters.dart';
import '../src/theme/app_colors.dart';

class HomePage extends StatefulWidget {
  static const routeId = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  Future<List<Character>>? characters;

  @override
  void initState() {
    characters = CharacterService().getAllCharacters();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: AppColors.backgroundColor,
      body: FutureBuilder(
        future: characters,
        builder: (_, AsyncSnapshot<List<Character>> snapshot) {
          if (snapshot.hasData) {
            final dataResults = snapshot.data!;

            return ListView.separated(
              itemBuilder: (_, index) {
                final character = dataResults[index];

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
                        onTap: () {},
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(character.image),
                          ],
                        ),
                      ),
                    );
                // ignore: avoid_unnecessary_containers
              },
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemCount: 900,
            );
          }
          return Container();
        },
      ),
    );
  }
}
