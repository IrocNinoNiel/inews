import 'package:http/http.dart';
import 'dart:convert';

import 'package:practice4/data/model/news.dart';

class NewsApiHelper {
  NewsApiHelper._privateConstructor();
  static final NewsApiHelper instance = NewsApiHelper._privateConstructor();

  List<News> newsHeadline = [
    News(
        id: "1",
        isFavorite: false,
        title:
            'Live updates: Biden to introduce health team members; Trump to tout progress on vaccines - The Washington Post',
        author: 'John Wagner',
        imglink:
            'https://www.washingtonpost.com/wp-apps/imrs.php?src=https://arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/HBB7HXHLXZHBLCJ7VNHMATDLNI.jpg&w=1440',
        description:
            'President-elect Joe Biden continues to build his cabinet. On Tuesday, he will introduce his picks for surgeon general, HHS secretary and CDC director, among others.',
        content:
            'The Arizona Republican Party, whose chairwoman has formally challenged Bidens victory in the state, is using its Twitter account to ask its followers whether they are willing to die for this fight.\r\n… [+1694 chars]',
        source: 'The Washington Post',
        publishedAt: '2020-12-08T14:31:38Z'),
    News(
        id: "2",
        isFavorite: false,
        title:
            'Lance Lynn traded from Rangers to White Sox for prospects - The Athletic',
        author: 'Ken Rosenthal',
        imglink:
            'https://cdn.theathletic.com/app/uploads/2020/12/08080928/lancelynn-1024x683.jpg',
        description:
            'Before the trade deadline, Lynn informed the Rangers he would opt out of the season if he was sent to a team he did not wish to join.',
        content:
            'No one in the industry could understand it. Why didn’t the Rangers move Lance Lynn at the Aug. 31 trade deadline, when his value might never have been higher?Turns out there was a reason.\r\nLynn and h… [+734 chars]',
        source: 'The Athletic',
        publishedAt: '2020-12-08T14:20:34Z'),
    News(
        id: "3",
        isFavorite: false,
        title:
            'Where to buy AMD RX 6900 XT graphics card - stock updates for the new AMD GPU - Gamesradar',
        author: 'Rob Dwiar',
        imglink:
            'https://cdn.mos.cms.futurecdn.net/9suth8u2FWB8QTqFUT7SJ4-1200-80.jpg',
        description:
            'Where to buy AMD RX 6900 XT graphics card - stock updates for the new AMD GPU - Gamesradar',
        content:
            "It's that time again, and knowing where to buy AMD RX 6900 XT cards is of the utmost importance today. Continuing 2020's relentless push to make competition for the best graphics card as intense as i… [+2720 chars]",
        source: 'GamesRadar+',
        publishedAt: '2020-12-08T14:12:00Z'),
  ];

  Future<List<dynamic>> getNewsHeadline() async {
    return Future.delayed(Duration(seconds: 2), () {
      return newsHeadline;
    });
  }

  Future<List<dynamic>> getSearchNews(String search) async {
    return Future.delayed(Duration(seconds: 2), () {
      List<News> searchNews = [];
      newsHeadline.forEach((e) {
        if (e.getTitle().contains(search)) {
          searchNews.add(e);
        }
      });
      return searchNews;
    });
  }

  Future<List<dynamic>> getTypeNews(String newsType) async {
    List<News> news = [
      News(
          id: "7",
          isFavorite: false,
          title:
              'Live updates: Biden to introduce health team members; Trump to tout progress on vaccines - The Washington Post',
          author: 'John Wagner',
          imglink:
              'https://www.washingtonpost.com/wp-apps/imrs.php?src=https://arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/HBB7HXHLXZHBLCJ7VNHMATDLNI.jpg&w=1440',
          description:
              'President-elect Joe Biden continues to build his cabinet. On Tuesday, he will introduce his picks for surgeon general, HHS secretary and CDC director, among others.',
          content:
              'The Arizona Republican Party, whose chairwoman has formally challenged Bidens victory in the state, is using its Twitter account to ask its followers whether they are willing to die for this fight.\r\n… [+1694 chars]',
          source: 'The Washington Post',
          publishedAt: '2020-12-08T14:31:38Z'),
      News(
          id: "8",
          isFavorite: false,
          title:
              'Live updates: Biden to introduce health team members; Trump to tout progress on vaccines - The Washington Post',
          author: 'John Wagner',
          imglink:
              'https://www.washingtonpost.com/wp-apps/imrs.php?src=https://arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/HBB7HXHLXZHBLCJ7VNHMATDLNI.jpg&w=1440',
          description:
              'President-elect Joe Biden continues to build his cabinet. On Tuesday, he will introduce his picks for surgeon general, HHS secretary and CDC director, among others.',
          content:
              'The Arizona Republican Party, whose chairwoman has formally challenged Bidens victory in the state, is using its Twitter account to ask its followers whether they are willing to die for this fight.\r\n… [+1694 chars]',
          source: 'The Washington Post',
          publishedAt: '2020-12-08T14:31:38Z'),
    ];

    return Future.delayed(Duration(seconds: 2), () {
      if (newsType == 'all') {
        return newsHeadline;
      }
      return news;
    });
  }
}
