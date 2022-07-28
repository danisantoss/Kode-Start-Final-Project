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
        icon: const Icon(Icons.cancel),
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
      if (characterName.toLowerCase().contains(query.toLowerCase()) &&
          !matchQuery.contains(characterName)) {
        matchQuery.add(characterName);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        String result = matchQuery[index];
        Character resultCharacter = findCharacter(result, searchCharacters);

        return ListTile(
          title: Text(result),
          onTap: () {
            Navigator.of(context).pushNamed(
              DetailsPage.routeId,
              arguments: resultCharacter,
            );
          },
          leading: Image.network(resultCharacter.image),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];

    for (String characterName in searchTerms) {
      if (characterName.toLowerCase().contains(query.toLowerCase()) &&
          !matchQuery.contains(characterName)) {
        matchQuery.add(characterName);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        String result = matchQuery[index];
        Character resultCharacter = findCharacter(result, searchCharacters);

        return ListTile(
          title: Text(result),
          onTap: () {
            Navigator.of(context).pushNamed(
              DetailsPage.routeId,
              arguments: resultCharacter,
            );
          },
          leading: Image.network(resultCharacter.image),
        );
      },
    );
  }
}

Character findCharacter(String result, List<Character> searchCharacters) {
  Character character = searchCharacters.first;

  for (Character char in searchCharacters) {
    if (char.name.toLowerCase().compareTo(result.toLowerCase()) == 0) {
      character = char;
    }
  }

  return character;
}
