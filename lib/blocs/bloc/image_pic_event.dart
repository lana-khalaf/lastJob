part of 'image_pic_bloc.dart';

sealed class ImagePicEvent extends Equatable {
  const ImagePicEvent();

  @override
  List<Object> get props => [];
}

class GitImage extends  ImagePicEvent{}
class DeleteImage extends ImagePicEvent {}