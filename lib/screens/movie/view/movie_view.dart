import 'package:fenix_case_movie_app/screens/movie/widget/movie_item_widget.dart';
import 'package:fenix_case_movie_app/utility/app_text/app_text.dart';
import 'package:flutter/material.dart';

import '../../../utility/widget/searchbar_widget.dart';

class MovieView extends StatelessWidget {
  const MovieView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppText.appName),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
              child: SearchbarWidget(
                controller: TextEditingController(),
              ),
            ),
            Expanded(
              child: CustomScrollView(
                primary: false,
                slivers: <Widget>[
                  SliverPadding(
                    padding: const EdgeInsets.all(20),
                    sliver: SliverGrid.count(
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                        children:
                            List.generate(10, (index) => MovieItemWidget())),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
