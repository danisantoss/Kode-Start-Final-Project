import 'package:api/pages/components/app_bar_widget.dart';
import 'package:api/pages/details_page.dart';
import 'package:api/src/data/get_characters_service.dart';
import 'package:api/src/models/character.dart';
import 'package:flutter/material.dart';
import '../src/theme/app_colors.dart';
import 'components/character_card.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        leftIcon: Icon(
          Icons.menu,
          color: AppColors.white,
        ),
      ),
      backgroundColor: AppColors.backgroundColor,
      body: FutureBuilder(
        future: characters,
        builder: (_, AsyncSnapshot<List<Character>> snapshot) {
          if (snapshot.hasData) {
            final dataResults = snapshot.data!;

            return ListView.separated(
              itemBuilder: (_, index) {
                final character = dataResults[index];

                return CharacterCard(
                  character: character,
                  onTap: () => Navigator.of(context).pushNamed(
                    DetailsPage.routeId,
                    arguments: character.id,
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
