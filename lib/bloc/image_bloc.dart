import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview/bloc/image_event.dart';
import 'package:interview/bloc/image_state.dart';
import 'package:interview/model/image_data_model.dart';
import 'package:interview/services/api_services.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  ImageBloc() : super(const ImagesLoadingState()) {
    on<LoadImagesEvent>(_loadImagesEvent);
  }

  FutureOr<void> _loadImagesEvent(
      LoadImagesEvent event, Emitter<ImageState> emit) async {
    emit(const ImagesLoadingState());
    try {
      final List<ImageDataModel> images = await ApiServices.getImages();
      print(images);
      emit(ImagesLoadedState(images: images));
    } catch (e) {
      emit(ImageErrorState(error: e.toString()));
    }
  }
}
