import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview/bloc/image_bloc.dart';
import 'package:interview/bloc/image_event.dart';
import 'package:interview/bloc/image_state.dart';
import 'package:interview/model/image_data_model.dart';
import 'package:interview/widgets/image_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<ImageBloc>(context).add(const LoadImagesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MyApp"),
      ),
      body: BlocConsumer<ImageBloc, ImageState>(
        listener: (context, state) {
          if (state is ImageErrorState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          if (state is ImagesLoadedState) {
            final List<ImageDataModel> images = List.from(state.images);
            return SafeArea(
              child: ListView.builder(
                itemCount: images.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final ImageDataModel imageData = images[index];
                  return InkWell(
                    onTap: () => showDialog(
                        context: context,
                        builder: (context) => AlertDialog.adaptive(
                              content: ClipRRect(
                                  child: Image.network(imageData.url)),
                              actions: [
                                IconButton(
                                    onPressed: () {
                                      if (imageData.isLiked) {
                                        //DisLike
                                      } else {
                                        //Like
                                      }
                                    },
                                    icon: imageData.isLiked
                                        ? const Icon(
                                            CupertinoIcons.hand_thumbsdown_fill)
                                        : const Icon(
                                            CupertinoIcons.hand_thumbsup))
                              ],
                            )),
                    child: ImageCard(
                      imageData: imageData,
                    ),
                  );
                },
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        },
      ),
    );
  }
}
