import 'package:equatable/equatable.dart';

class Choice extends Equatable {
  final String title, date, description, imglink;

  const Choice({this.title, this.date, this.description, this.imglink});

  List<Object> get props => throw UnimplementedError();
}
