import 'package:equatable/equatable.dart';

class Item extends Equatable {
  const Item({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      name: json['name'] as String,
      url: json['url'] as String,
    );
  }

  @override
  List<Object> get props => [name, url];
}
