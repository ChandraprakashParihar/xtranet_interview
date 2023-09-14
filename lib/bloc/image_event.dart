import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ImageEvent extends Equatable {
  const ImageEvent();
}

class LoadImagesEvent extends ImageEvent {
  const LoadImagesEvent();
  @override
  List<Object?> get props => [];
}
