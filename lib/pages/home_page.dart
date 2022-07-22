import 'package:api/data/repository.dart';
import 'package:api/models/character.dart';
import 'package:api/models/paginated_characters.dart';
import 'package:api/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const routeId = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  Future<PaginatedCharacters>? characters;

  @override
  void initState() {
    characters = Repository.getCharacters();
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
        builder: (_, AsyncSnapshot<PaginatedCharacters> snapshot) {
          if (snapshot.hasData) {
            final dataResults = snapshot.data!.results;

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
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                itemCount: dataResults.length);
          }
          return Container();
        },
      ),
    );
  }
}
