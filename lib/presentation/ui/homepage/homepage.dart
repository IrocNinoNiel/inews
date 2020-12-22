import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice4/data/model/news.dart';
import 'package:practice4/presentation/bloc/news/news_bloc.dart';
import 'package:practice4/presentation/color/Color.dart';
import 'package:practice4/presentation/ui/global/newscard.dart';
import 'package:practice4/presentation/ui/global/newscardhorizontal.dart';
import 'package:practice4/presentation/ui/newspage/newspage.dart';
import 'package:practice4/presentation/ui/searchpage/searchpage.dart';
import 'package:practice4/repository/newsrepository.dart';

import 'appbarmenu.dart';

class MyHomePageState extends StatefulWidget {
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePageState> {
  PageController _myPage = PageController(initialPage: 0);
  int curridx = 0;
  NewsBloc newsBloc;
  @override
  Widget build(BuildContext context) {
    newsBloc = BlocProvider.of<NewsBloc>(context);
    return Scaffold(
      appBar: appBarMenu(() {
        navigationToSearchPage(context);
      }),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60,
          color: PrimaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              iconBtnAppbar(Icon(Icons.home), "Home", 0, 'all'),
              iconBtnAppbar(Icon(Icons.favorite), "Favorites", 1, 'favorites'),
            ],
          ),
        ),
      ),
      body: BlocListener<NewsBloc, NewsState>(
        listener: (context, state) {
          if (state is NewsError) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        child: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            if (state is NewsInitial) {
              return buildInitialUI(context);
            } else if (state is NewsLoading) {
              return buildLoadingUI();
            } else if (state is NewsLoaded) {
              return buildNewsList(state.newsHeadline, context);
            }

            return buildInitialUI(context);
          },
        ),
      ),
    );
  }

  Widget buildLoadingUI() {
    return Center(child: CircularProgressIndicator());
  }

  Widget buildInitialUI(BuildContext context) {
    return Container();
  }

  Widget buildNewsList(List<News> newsHeadline, BuildContext context) {
    return Column(
      children: <Widget>[
        upperMenu(),
        Expanded(
            child: newsHeadline.isEmpty
                ? Center(child: Text("List is Empty"))
                : _buildList(newsHeadline, context))
      ],
    );
  }

  Widget _buildList(List<News> newsHeadline, BuildContext context) {
    return ListView.builder(itemBuilder: (BuildContext context, int index) {
      if (index == newsHeadline.length) return null;
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
        child: NewsCard(
          news: newsHeadline[index],
          item: newsHeadline[index],
          navigationToNewsPage: () {
            navigationToNewsPage(context, newsHeadline[index]);
          },
          addToFavorite: () {
            addFavoriteNews(newsHeadline, newsHeadline[index]);
          },
        ),
      );
    });
  }

  Widget upperMenu() {
    return Container(
      constraints: BoxConstraints(
          minHeight: 20, minWidth: double.infinity, maxHeight: 50),
      child: ListView(
        // This next line does the trick.
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.red)),
              color: Colors.white,
              textColor: Colors.red,
              child: Text('All'),
              onPressed: () {
                findTypeNews('all');
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.red)),
                color: Colors.white,
                textColor: Colors.red,
                child: Text('Sports'),
                onPressed: () {
                  findTypeNews('sports');
                }),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.red)),
              color: Colors.white,
              textColor: Colors.red,
              child: Text('Fashion'),
              onPressed: () {
                findTypeNews('fashion');
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.red)),
              color: Colors.white,
              textColor: Colors.red,
              child: Text('Philippines'),
              onPressed: () {
                findTypeNews('philippines');
              },
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector iconBtnAppbar(
      Icon icon, String title, int index, String type) {
    return GestureDetector(
      onTap: () {
        setState(() {
          curridx = index;
          findTypeNews(type);
          // _myPage.jumpToPage(index);
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          icon,
          SizedBox(
            height: 3,
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: 9,
                fontWeight:
                    curridx == index ? FontWeight.w700 : FontWeight.w600,
                color: curridx == index ? Bgcolor : BottomIcon),
          )
        ],
      ),
    );
  }

  void findTypeNews(String type) {
    if (type == 'favorites') {
      getFavoriteNews();
    } else {
      newsBloc.add(GetTypeNews(type: type));
    }
  }

  void getFavoriteNews() {
    newsBloc.add(GetFavoriteNews());
  }

  void addFavoriteNews(List<News> newsList, News news) {
    newsBloc.add(ToggleNews(newsList: newsList, news: news));
  }

  void navigationToSearchPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return SearchPage();
    }));
  }

  void navigationToNewsPage(BuildContext context, News newsHeadline) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NewsPage(
        news: newsHeadline,
      );
    }));
  }
}
