import 'package:flutter/material.dart';
import 'package:movie_admin/models/movies.dart';
import 'package:movie_admin/responsive/responsive_layout.dart';
import 'package:movie_admin/utils/colors.dart';
import 'package:movie_admin/view_models/my_movies_model.dart';
import 'package:movie_admin/widgets/elevated_button.dart';
import 'package:movie_admin/widgets/network_image.dart';
import 'package:movie_admin/widgets/spinner_widget.dart';
import 'package:provider/provider.dart';

class MovieList extends StatefulWidget {
  const MovieList({super.key});

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  dynamic provider;

  @override
  void initState() {
    super.initState();
    provider = Provider.of<MyMoviesModel>(context, listen: false);
    provider.getData(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Movies',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0.3,
      ),
      body: body(),
    );
  }

  SafeArea body() {
    return SafeArea(
      child: Consumer<MyMoviesModel>(builder: (context, viewModel, child) {
        return Column(
          children: [
            Expanded(
              child: (viewModel.movies.search != null)
                  ? ResponsiveLayout(
                      mobileScreenLayout: ListView.builder(
                        itemCount: viewModel.movies.search!.length,
                        itemBuilder: (context, i) {
                          Search item = viewModel.movies.search![i];
                          return _buildShopItem(item);
                        },
                      ),
                      webScreenLayout: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 600,
                            childAspectRatio: 2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                          ),
                          itemCount: viewModel.movies.search!.length,
                          itemBuilder: (BuildContext ctx, index) {
                            Search item = viewModel.movies.search![index];

                            return _buildShopItem(item);
                          }),
                    )
                  : const SpinnerWidget(),
            ),
            lowerKeypad(viewModel.pagenumber),
          ],
        );
      }),
    );
  }

  Widget _buildShopItem(Search item) {
    return TextButton(
      onPressed: () {},
      child: Row(
        children: <Widget>[
          PNetworkImage(
            item.poster!,
            height: 250,
            width: 167,
            fit: BoxFit.fill,
          ),
          Expanded(
            child: Container(
              height: 200,
              padding: const EdgeInsets.all(20.0),
              margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                  color: primaryColor,
                  boxShadow: [
                    BoxShadow(
                        color: secondaryColor,
                        offset: Offset(5.0, 5.0),
                        blurRadius: 10.0)
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    item.title!,
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    item.year!,
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    item.type!,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget lowerKeypad(int page) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Visibility(
          visible: (page != 1),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: PElevatedButton(
              width: MediaQuery.of(context).size.width * 0.38,
              text: "Back \nGo to page: ${page - 1}",
              onPressed: () {
                provider.getData(page - 1);
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: PElevatedButton(
            width: MediaQuery.of(context).size.width * 0.38,
            text: "Next \nGo to page: ${page + 1}",
            onPressed: () {
              provider.getData(page + 1);
            },
          ),
        ),
      ],
    );
  }
}
