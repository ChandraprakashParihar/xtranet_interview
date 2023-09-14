import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:interview/model/image_data_model.dart';


@immutable
abstract class ImageState extends Equatable {
  const ImageState();
}

class ImagesLoadingState extends ImageState {
  const ImagesLoadingState();
  @override
  List<Object?> get props => [];
}

class ImagesLoadedState extends ImageState {
  const ImagesLoadedState({required this.images});
  final List<ImageDataModel> images;
  @override
  List<Object?> get props => [images];
}

class ImageErrorState extends ImageState {
  const ImageErrorState({required this.error});
  final String error;
  @override
  List<Object?> get props => [error];
}
