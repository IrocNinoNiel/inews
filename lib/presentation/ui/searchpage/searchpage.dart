import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice4/data/model/news.dart';
import 'package:practice4/presentation/bloc/search/search_bloc.dart';
import 'package:practice4/presentation/color/Color.dart';
import 'package:practice4/presentation/ui/global/newscard.dart';
import 'package:practice4/presentation/ui/newspage/newspage.dart';
import 'package:practice4/repository/searchrepository.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(SearchRepository()),
      child: _SearchPage(),
    );
  }
}

class _SearchPage extends StatelessWidget {
  SearchBloc searchBloc;
  @override
  Widget build(BuildContext context) {
    searchBloc = BlocProvider.of<SearchBloc>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        title: TextField(
          onSubmitted: (value) => searchValue(value),
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            hintText: "Search News Title...",
          ),
        ),
      ),
      body: BlocListener<SearchBloc, SearchState>(
        listener: (context, state) {
          if (state is SearchError) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        child: BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
          if (state is SearchInitial) {
            return buildInitialUI(context);
          } else if (state is SearchLoading) {
            return buildLoadingUI();
          } else if (state is SearchLoaded) {
            return loadSearchResult(state.newsSearch, context);
          } else if (state is SearchNoResult) {
            return buildNoResultUI(state.message);
          } else if (state is SearchError) {
            return buildInitialUI(context);
          }

          return buildInitialUI(context);
        }),
      ),
    );
  }

  Widget buildInitialUI(BuildContext context) {
    return Container();
  }

  Widget buildLoadingUI() {
    return Center(child: CircularProgressIndicator());
  }

  Widget buildNoResultUI(String message) {
    return Center(
      child: Text(message),
    );
  }

  Widget loadSearchResult(List<News> newsSearch, BuildContext context) {
    return ListView.builder(itemBuilder: (BuildContext context, int index) {
      if (index == newsSearch.length) return null;
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
        child: NewsCard(
          news: newsSearch[index],
          item: newsSearch[index],
          navigationToNewsPage: () {
            navigationToNewsPage(context, newsSearch[index]);
          },
        ),
      );
    });
  }

  void navigationToNewsPage(BuildContext context, News newsHeadline) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NewsPage(
        news: newsHeadline,
      );
    }));
  }

  void searchValue(String value) {
    searchBloc.add(GetSearchNews(search: value));
  }
}
