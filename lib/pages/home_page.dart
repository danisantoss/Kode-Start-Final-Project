import 'package:api/pages/components/character_search.dart';
import 'package:flutter/material.dart';
import '../src/data/get_characters_service.dart';
import '../src/models/character.dart';
import '../src/theme/app_colors.dart';
import 'components/app_bar_widget.dart';
import 'components/character_card.dart';
import 'details_page.dart';

class HomePage extends StatefulWidget {
  static const routeId = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  Future<List<Character>>? characters;
  List<String> searchTerms = [];
  List<Character> searchCharacters = [];

  @override
  void initState() {
    characters = CharacterService().getAllCharacters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        leftIcon: InkWell(
          child: const Icon(
            Icons.search,
            color: AppColors.white,
          ),
          onTap: () {
            showSearch(
              context: context,
              delegate: CharacterSearchDelegate(searchTerms, searchCharacters),
            );
          },
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
                searchTerms.add(character.name);
                searchCharacters.add(character);

                return CharacterCard(
                  character: character,
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      DetailsPage.routeId,
                      arguments: character,
                    );
                  },
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemCount: dataResults.length,
            );
          }
          return Container();
        },
      ),
    );
  }
}
