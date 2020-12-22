import 'package:equatable/equatable.dart';

class News {
  bool _isFavorite;
  String _title,
      _author,
      _description,
      _imglink,
      _content,
      _source,
      _publishedAt,
      _id;

  News(
      {String id,
      String title,
      String author,
      String description,
      String imglink,
      String content,
      String source,
      String publishedAt,
      bool isFavorite}) {
    setID(id);
    setTitle(title);
    setAuthor(author);
    setDescription(description);
    setImgLink(imglink);
    setContent(content);
    setSource(source);
    setPublishedAt(publishedAt);
    setFavorite(isFavorite);
  }

  setID(id) => this._id = id;
  setTitle(title) => this._title = title;
  setAuthor(author) => this._author = author;
  setDescription(description) => this._description = description;
  setImgLink(imglink) => this._imglink = imglink;
  setContent(content) => this._content = content;
  setSource(source) => this._source = source;
  setPublishedAt(publishedat) => this._publishedAt = publishedat;
  setFavorite(favorite) => this._isFavorite = favorite;

  getId() => this._id;
  getTitle() => this._title;
  getAuthor() => this._author;
  getDescription() => this._description;
  getImgLink() => this._imglink;
  getContent() => this._content;
  getSource() => this._source;
  getPublishedAt() => this._publishedAt;
  getFavorite() => this._isFavorite;

  Map<String, dynamic> toMap() {
    return {
      'id': getId(),
      'title': getTitle(),
      'author': getAuthor(),
      'description': getDescription(),
      'imglink': getImgLink(),
      'content': getContent(),
      'source': getSource(),
      'publishedAt': getPublishedAt(),
      'favorite': getFavorite()
    };
  }
}
