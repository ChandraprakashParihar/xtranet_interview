// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class ImageDataModel extends Equatable {
  final String id;
  final String url;
  final int height;
  final int width;
  final bool isLiked;
  const ImageDataModel({
    required this.id,
    required this.url,
    required this.height,
    required this.width,
    this.isLiked = false,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'url': url,
      'height': height,
      'width': width,
      'isLiked': isLiked,
    };
  }

  factory ImageDataModel.fromMap(Map<String, dynamic> map) {
    return ImageDataModel(
      id: map['id'] as String,
      url: map['url'] as String,
      height: map['height'] as int,
      width: map['width'] as int,
      // isLiked: map['isLiked'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageDataModel.fromJson(String source) =>
      ImageDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object> get props {
    return [
      id,
      url,
      height,
      width,
      isLiked,
    ];
  }

  ImageDataModel copyWith({
    String? id,
    String? url,
    int? height,
    int? width,
    bool? isLiked,
  }) {
    return ImageDataModel(
      id: id ?? this.id,
      url: url ?? this.url,
      height: height ?? this.height,
      width: width ?? this.width,
      isLiked: isLiked ?? this.isLiked,
    );
  }
}
