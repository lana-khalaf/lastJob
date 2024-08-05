// // // import 'dart:io';

// // // import 'package:bloc/bloc.dart';
// // // import 'package:equatable/equatable.dart';
// // // import 'package:file_picker/file_picker.dart';
// // // import 'package:flutter_jobs_app/service/image_change.dart';
// // // import 'package:image_picker/image_picker.dart';
// // // import 'package:shared_preferences/shared_preferences.dart';

// // // part 'image_pic_event.dart';
// // // part 'image_pic_state.dart';

// // // // // class ImagePicBloc extends Bloc<ImagePicEvent, ImagePicState> {
// // // // //   ImagePicBloc() : super(ImagePicInitial()) {
// // // // //     on<GitImage>((event, emit)async {
// // // // //           emit(LoadingImagePic());
// // // // //         print("loadingg");
// // // // //       // String result =await login(event.usermodel);
// // // // //        SharedPreferences prefs = await SharedPreferences.getInstance();
// // // // //        String? token= prefs.getString("Token");
        

// // // // //         if (token != null ) {
// // // // //   dynamic result =await updateProfilePicture(token);
      
// // // // //       // if(result.isEmpty){
// // // // //       //   emit(Failed());
// // // // //       //    print("Failedd");
// // // // //       // }
     
// // // // //         if(result is String){
// // // // //            emit(SuccessImagePic());
     
// // // // //           print("successs");
// // // // //         }
// // // // //       else {
// // // // //           emit(FailedImagePic());
// // // // //           print("Failedd");
// // // // //         }
// // // // //         }
// // // // //         else {
// // // // //         emit(ErrorImagePic());
// // // // //         print("Error: Token is null");
// // // // //       }
// // // // //     });
// // // // //   }
// // // // // }
// // // // class ImagePicBloc extends Bloc<ImagePicEvent, ImagePicState> {
// // // //   ImagePicBloc() : super(ImagePicInitial()) {
// // // //     on<GitImage>((event, emit) async {
// // // //       emit(LoadingImagePic());
// // // //       print("loadingg");

// // // //       SharedPreferences prefs = await SharedPreferences.getInstance();
// // // //       String? token = prefs.getString("Token");

// // // //       if (token != null) {
// // // //         final picker = ImagePicker();
// // // //         final pickedFile = await picker.pickImage(source: ImageSource.gallery);

// // // //         if (pickedFile != null) {
// // // //           File imageFile = File(pickedFile.path);
// // // //           dynamic result = await updateProfilePicture(token);

// // // //           if (result is String) {
// // // //             emit(SuccessImagePic(pickedFile.path));
// // // //             print("successs");
// // // //           } else {
// // // //             emit(FailedImagePic());
// // // //             print("Failedd");
// // // //           }
// // // //         } else {
// // // //           emit(ErrorImagePic());
// // // //           print("Error: No image selected");
// // // //         }
// // // //       } else {
// // // //         emit(ErrorImagePic());
// // // //         print("Error: Token is null");
// // // //       }
// // // //     });
// // // //   }
// // // // // }
// // // // class ImagePicBloc extends Bloc<ImagePicEvent, ImagePicState> {
// // // //   ImagePicBloc() : super(ImagePicInitial()) {
// // // //     on<GitImage>((event, emit) async {
// // // //       emit(LoadingImagePic());
// // // //       print("loadingg");

// // // //       SharedPreferences prefs = await SharedPreferences.getInstance();
// // // //       String? token = prefs.getString("Token");

// // // //       if (token != null) {
// // // //         final picker = ImagePicker();
// // // //         try {
// // // //           final pickedFile = await picker.pickImage(source: ImageSource.gallery);

// // // //           if (pickedFile != null) {
// // // //             File imageFile = File(pickedFile.path);
// // // //             dynamic result = await updateProfilePicture(token);

// // // //             if (result is String) {
// // // //               emit(SuccessImagePic(pickedFile.path));
// // // //               print("successs");
// // // //             } else {
// // // //               emit(FailedImagePic());
// // // //               print("Failedd");
// // // //             }
// // // //           } else {
// // // //             emit(ErrorImagePic());
// // // //             print("Error: No image selected");
// // // //           }
// // // //         } catch (e) {
// // // //           emit(ErrorImagePic());
// // // //           print("Error: $e");
// // // //         }
// // // //       } else {
// // // //         emit(ErrorImagePic());
// // // //         print("Error: Token is null");
// // // //       }
// // // //     });
// // // //   }
// // // // }

// // // // import 'package:file_picker/file_picker.dart';

// // // class ImagePicBloc extends Bloc<ImagePicEvent, ImagePicState> {
// // //   ImagePicBloc() : super(ImagePicInitial()) {
// // //     on<GitImage>((event, emit) async {
// // //       emit(LoadingImagePic());
// // //       print("loadingg");

// // //       SharedPreferences prefs = await SharedPreferences.getInstance();
// // //       String? token = prefs.getString("Token");

// // //       if (token != null) {
// // //         try {
// // //           FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);

// // //           if (result != null) {
// // //             File imageFile = File(result.files.single.path!);
// // //             dynamic result = await updateProfilePicture(token);

// // //             if (result is String) {
// // //               emit(SuccessImagePic(imageFile.path));
// // //               print("successs");
// // //             } else {
// // //               emit(FailedImagePic());
// // //               print("Failedd");
// // //             }
// // //           } else {
// // //             emit(ErrorImagePic());
// // //             print("Error: No image selected");
// // //           }
// // //         } catch (e) {
// // //           emit(ErrorImagePic());
// // //           print("Error: $e");
// // //         }
// // //       } else {
// // //         emit(ErrorImagePic());
// // //         print("Error: Token is null");
// // //       }
// // //     });
// // //   }
// // // }
// // import 'dart:io';

// // import 'package:bloc/bloc.dart';
// // import 'package:equatable/equatable.dart';
// // import 'package:file_picker/file_picker.dart';
// // import 'package:flutter_jobs_app/service/image_change.dart';
// // import 'package:image_picker/image_picker.dart';
// // import 'package:shared_preferences/shared_preferences.dart';

// // part 'image_pic_event.dart';
// // part 'image_pic_state.dart';

// // class ImagePicBloc extends Bloc<ImagePicEvent, ImagePicState> {
// //   ImagePicBloc() : super(ImagePicInitial()) {
// //     on<GitImage>((event, emit) async {
// //       emit(LoadingImagePic());
// //       print("loadingg");

// //       SharedPreferences prefs = await SharedPreferences.getInstance();
// //       String? token = prefs.getString("Token");

// //       if (token != null) {
// //         try {
// //           FilePickerResult? pickerResult = await FilePicker.platform.pickFiles(type: FileType.image);

// //           if (pickerResult != null) {
// //             File imageFile = File(pickerResult.files.single.path!);
// //             dynamic updateResult = await updateProfilePicture(token);

// //             if (updateResult is String) {
// //               emit(SuccessImagePic(imageFile.path));
// //               print("successs");
// //             } else {
// //               emit(FailedImagePic());
// //               print("Failedd");
// //             }
// //           } else {
// //             emit(ErrorImagePic());
// //             print("Error: No image selected");
// //           }
// //         } catch (e) {
// //           emit(ErrorImagePic());
// //           print("Error: $e");
// //         }
// //       } else {
// //         emit(ErrorImagePic());
// //         print("Error: Token is null");
// //       }
// //     });
// //   }
// // }
// import 'dart:io';

// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter_jobs_app/service/image_change.dart';

// part 'image_pic_event.dart';
// part 'image_pic_state.dart';

// class ImagePicBloc extends Bloc<ImagePicEvent, ImagePicState> {
//   ImagePicBloc() : super(ImagePicInitial()) {
//     on<GitImage>((event, emit) async {
//       emit(LoadingImagePic());
//       print("loadingg");

//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       String? token = prefs.getString("Token");

//       if (token != null) {
//         final picker = ImagePicker();
//         try {
//           final pickedFile = await picker.pickImage(source: ImageSource.gallery);

//           if (pickedFile != null) {
//             File imageFile = File(pickedFile.path);
//             dynamic result = await updateProfilePicture(token);

//             if (result is String) {
//               emit(SuccessImagePic(pickedFile.path));
//               print("successs");
//             } else {
//               emit(FailedImagePic());
//               print("Failedd");
//             }
//           } else {
//             emit(ErrorImagePic());
//             print("Error: No image selected");
//           }
//         } catch (e) {
//           emit(ErrorImagePic());
//           print("Error: $e");
//         }
//       } else {
//         emit(ErrorImagePic());
//         print("Error: Token is null");
//       }
//     });
//   }
// }
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_jobs_app/service/image_change.dart';
import 'package:flutter_jobs_app/service/image_delete.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:permission_handler/permission_handler.dart';

part 'image_pic_event.dart';
part 'image_pic_state.dart';

class ImagePicBloc extends Bloc<ImagePicEvent, ImagePicState> {
  ImagePicBloc() : super(ImagePicInitial()) {
    on<GitImage>((event, emit) async {
      emit(LoadingImagePic());
      print("loadingg");

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("Token");

      if (token != null) {
        if (await Permission.photos.request().isGranted) {
          try {
            FilePickerResult? pickerResult = await FilePicker.platform.pickFiles(type: FileType.image);

            if (pickerResult != null) {
              File imageFile = File(pickerResult.files.single.path!);
              dynamic updateResult = await updateProfilePicture(token);

              if (updateResult is String) {
                emit(SuccessImagePic(imageFile.path));
                print("successs");
              } else {
                emit(FailedImagePic());
                print("Failedd");
              }
            } else {
              emit(ErrorImagePic());
              print("Error: No image selected");
            }
          } catch (e) {
            emit(ErrorImagePic());
            print("Error: $e");
          }
        } else {
          emit(ErrorImagePic());
          print("Error: Permission denied");
        }
      } else {
        emit(ErrorImagePic());
        print("Error: Token is null");
      }
    });
     on<DeleteImage>((event, emit) async {
      emit(LoadingImagePic());
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("Token");

      if (token != null) {
        try {
          dynamic deleteResult = await deleteProfilePicture(token);

          if (deleteResult) {
            emit(SuccessImageDeleted());
          } else {
            emit(FailedImagePic());
          }
        } catch (e) {
          emit(ErrorImagePic());
        }
      } else {
        emit(ErrorImagePic());
      }
    });
  }
}
