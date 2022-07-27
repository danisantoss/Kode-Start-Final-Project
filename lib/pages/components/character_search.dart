import 'package:flutter/material.dart';
import '../../src/models/character.dart';
import '../details_page.dart';

class CharacterSearchDelegate extends SearchDelegate {
  CharacterSearchDelegate(this.searchTerms, this.searchCharacters);
  final List<String> searchTerms;
  final List<Character> searchCharacters;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var characterName in searchTerms) {
      if (characterName.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(characterName);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    List<Character> matchCard = [];

    for (var characterName in searchTerms) {
      if (characterName.toLowerCase().contains(query.toLowerCase()) && 
      !matchQuery.contains(characterName)) {
        matchQuery.add(characterName);
      }
    }

    for (var characterName in matchQuery) {
      for (var chSearch in searchCharacters) {
        if (characterName.toLowerCase().compareTo(chSearch.name.toLowerCase()) == 0) {
          matchCard.add(chSearch);
        }
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        var resultCharacter = matchCard[index];
        return ListTile(
          title: Text(result),
          onTap: () {
            Navigator.of(context).pushNamed(
              DetailsPage.routeId,
              arguments: resultCharacter,
            );
          },
        );
      },
    );
  }
}
