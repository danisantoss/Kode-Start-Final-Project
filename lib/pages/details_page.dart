import 'package:api/pages/components/app_bar_widget.dart';
import 'package:api/src/data/get_characters_service.dart';
import 'package:api/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../src/models/character.dart';

class DetailsPage extends StatefulWidget {
  static const routeId = '/details';
  final int characterId;

  const DetailsPage({Key? key, required this.characterId}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  Future<List<Character>>? character;

  @override
  void initState() {
    character = CharacterService().getDetailedCharacter(widget.characterId);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        leftIcon: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back,
            color: AppColors.white,
          ),
        ),
      ),
      backgroundColor: AppColors.backgroundColor,
      body: FutureBuilder(
        future: character,
        builder: (_, AsyncSnapshot<List<Character>> snapshot) {
          //if (snapshot.hasData) {
            final data = snapshot.data!;

            return ListView(
              children: [
                DetailedCharacterCard(detailedCharacter: data[widget.characterId]),
              ],
            );
          //}
          //return Container();
        },
      ),
    );
  }
}

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
