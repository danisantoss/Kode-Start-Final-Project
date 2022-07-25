import 'package:api/pages/components/app_bar_widget.dart';
import 'package:api/src/models/character.dart';
import 'package:flutter/material.dart';
import '../src/theme/app_colors.dart';
import 'components/character_card.dart';

class DetailsPage extends StatefulWidget {
  static const routeId = '/details';
  final Character detailedCharacter;
  const DetailsPage({Key? key, required this.detailedCharacter}) : super(key: key);

  @override
  State<DetailsPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        leftIcon: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: AppColors.white,
          ),
        ),
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          CharacterCard(character: widget.detailedCharacter),
        ],
      ),
    );
  }
}
