part of 'image_pic_bloc.dart';

// sealed class ImagePicState extends Equatable {
//   const ImagePicState();
  
//   @override
//   List<Object> get props => [];
// }

// final class ImagePicInitial extends ImagePicState {}

// class SuccessImagePic extends ImagePicState{
  
// }
// class FailedImagePic extends ImagePicState {}
// class ErrorImagePic extends ImagePicState{
// }
// class LoadingImagePic extends ImagePicState {}
sealed class ImagePicState extends Equatable {
  const ImagePicState();
  
  @override
  List<Object?> get props => [];
}

final class ImagePicInitial extends ImagePicState {}

class SuccessImagePic extends ImagePicState {
  final String imagePath;
  SuccessImagePic(this.imagePath);

  @override
  List<Object?> get props => [imagePath];
}

class FailedImagePic extends ImagePicState {}


class ErrorImagePic extends ImagePicState {}

class LoadingImagePic extends ImagePicState {}
class SuccessImageDeleted extends ImagePicState {}

