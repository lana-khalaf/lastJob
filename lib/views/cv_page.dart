
    import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_jobs_app/Model/education.dart';
import 'package:flutter_jobs_app/Model/experience.dart';
import 'package:flutter_jobs_app/Model/skill.dart';
import 'package:flutter_jobs_app/Model/user_taq_model.dart';
import 'package:flutter_jobs_app/blocs/bloc/education_bloc.dart';
import 'package:flutter_jobs_app/blocs/bloc/experience_bloc.dart';
import 'package:flutter_jobs_app/blocs/bloc/experience_event.dart';
import 'package:flutter_jobs_app/blocs/bloc/experience_state.dart';
import 'package:flutter_jobs_app/blocs/bloc/get_user_bloc.dart';
import 'package:flutter_jobs_app/blocs/skill/skill_bloc.dart';
import 'package:flutter_jobs_app/service/cv_create.dart';
import 'package:flutter_jobs_app/views/cv_view.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:flutter_jobs_app/config.dart';
import 'package:flutter_jobs_app/widgets/custom%20text.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CvPage extends StatefulWidget {
  const CvPage({Key? key}) : super(key: key);
  static String id = 'CvPage';

  @override
  State<CvPage> createState() => _CvPageState();
}

class _CvPageState extends State<CvPage> {
  String? _fileName;
  Uint8List? _fileBytes;
  num number = 0;
  
  List<String> _cvFiles = [];

  Future<Uint8List> createResume({
    required List<Skill> skills,
    required List<Experience> experiences,
    required List<Education> education,
     required User user,
  }) async {
    final pdf = pw.Document();
   

// استرجاع مسار الصورة من SharedPreferences
  final imagePath = await getImagePathFromSharedPreferences();
   final Uint8List imageBytes = await loadImage(imagePath);

    final fontData = await rootBundle.load('assets/fonts/Tajawal-Regular.ttf');
    final fontRegular = pw.Font.ttf(fontData);

    final fontBold = pw.Font.ttf(await rootBundle.load('assets/fonts/Tajawal-Bold.ttf'));

    final mdiFont = await rootBundle.load('assets/fonts/materialdesignicons-webfont.ttf');
    final mdiIcons = pw.Font.ttf(mdiFont);

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Container(
                color: PdfColor.fromInt(0xffC9D6E6),
                padding: pw.EdgeInsets.all(20),
                child: pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.SizedBox(width: 10),
                    pw.Container(
                      width: 140,
                      height: 140,
            //           decoration: pw.BoxDecoration(
            //             shape: pw.BoxShape.circle,
            //             image: 
            //             pw.DecorationImage(
            //   image: pw.MemoryImage(imageBytes),
            //   fit: pw.BoxFit.cover,
            // ),
            //         ),
            child: pw.ClipOval(
            child: pw.Image(
              pw.MemoryImage(imageBytes),
              fit: pw.BoxFit.cover,
              width: 104,
              height: 104,
            ),
          ),
                  ),
                    pw.SizedBox(width: 40),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        
                        pw.Text(
                         user.firstName + user.lastName,
                          style: pw.TextStyle(
                            fontSize: 37,
                            fontWeight: pw.FontWeight.bold,
                            color: PdfColor.fromInt(0xff213D63),
                          ),
                        ),
                        pw.SizedBox(height: 10),
                        pw.Text(
                          'I T E',
                          style: pw.TextStyle(
                            fontSize: 25,
                            color: PdfColor.fromInt(0xff213D63),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Flexible(
                    flex: 2,
                    child: pw.Container(
                      color: PdfColor.fromInt(0xffEDF4FF),
                      padding: pw.EdgeInsets.all(20),
                      child: pw.Flexible(
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text(
                              'CONTACT',
                              style: pw.TextStyle(
                                fontSize: 14,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColor.fromInt(0xff213D63),
                              ),
                            ),
                            pw.SizedBox(height: 10),
                            pw.Row(
                              children: [
                                pw.Text(
                                  String.fromCharCode(MdiIcons.phone.codePoint),
                                  style: pw.TextStyle(
                                    font: mdiIcons,
                                    fontSize: 12,
                                  ),
                                ),
                                pw.SizedBox(width: 5),
                                pw.Text(
                                 user.phoneNumber,
                                  style: pw.TextStyle(
                                    fontSize: 12,
                                    color: PdfColor.fromHex("#333333"),
                                  ),
                                ),
                              ],
                            ),
                            pw.SizedBox(height: 5),
                            pw.Row(
                              children: [
                                pw.Text(
                                  String.fromCharCode(MdiIcons.email.codePoint),
                                  style: pw.TextStyle(
                                    font: mdiIcons,
                                    fontSize: 12,
                                  ),
                                ),
                                pw.SizedBox(width: 5),
                                pw.Text(
                                user.email,
                                  style: pw.TextStyle(
                                    fontSize: 12,
                                    color: PdfColor.fromHex("#333333"),
                                  ),
                                ),
                              ],
                            ),
                            pw.SizedBox(height: 5),
                            pw.Row(
                              children: [
                                pw.Text(
                                  String.fromCharCode(MdiIcons.web.codePoint),
                                  style: pw.TextStyle(
                                    font: mdiIcons,
                                    fontSize: 12,
                                  ),
                                ),
                                pw.SizedBox(width: 5),
                                // pw.Text(
                                //   'www.sitioincreible.com',
                                //   style: pw.TextStyle(
                                //     fontSize: 12,
                                //     color: PdfColor.fromHex("#333333"),
                                //   ),
                                // ),
                              ],
                            ),
                            pw.SizedBox(height: 20),
                            pw.Text(
                              'SKILLS',
                              style: pw.TextStyle(
                                fontSize: 14,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColor.fromInt(0xff213D63),
                              ),
                            ),
                            pw.SizedBox(height: 10),
                            ...skills.map(
                              (skill) => pw.Bullet(
                                text: skill.title,
                                style: pw.TextStyle(
                                  fontSize: 12,
                                  color: PdfColor.fromHex("#333333"),
                                ),
                              ),
                            ).toList(),
                            pw.SizedBox(height: 20),
                            pw.Text(
                              'EDUCATION',
                              style: pw.TextStyle(
                                fontSize: 14,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColor.fromInt(0xff213D63),
                              ),
                            ),
                            pw.SizedBox(height: 10),
                            ...education.map(

                              (edu) { DateTime startedAt = DateTime.parse(edu.startedAt);
        DateTime? endedAt = edu.endedAt != null ? DateTime.parse(edu.endedAt!) : null; 
        return pw.Bullet(
                                text: '${edu.graduated != null && edu.graduated!? "graduated in":"" }\n${edu.title ?? ""}\n${edu.major}\n${edu.specialization} \n${startedAt.year.toString() }_${endedAt?.year.toString()??""}',
                                style: pw.TextStyle(
                                  fontSize: 12,
                                  color: PdfColor.fromHex("#333333"),
                                ),
                              );}
                               
                            ).toList(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  pw.SizedBox(width: 20),
                  pw.Flexible(
                    flex: 3,
                    child: pw.Padding(
                      padding: pw.EdgeInsets.all(20),
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(
                            'ABOUT ME',
                            style: pw.TextStyle(
                              fontSize: 14,
                              fontWeight: pw.FontWeight.bold,
                              color: PdfColor.fromInt(0xff213D63),
                            ),
                          ),
                          pw.SizedBox(height: 10),
                          pw.Text(
                           user.bio,
                            style: pw.TextStyle(
                              fontSize: 12,
                              color: PdfColor.fromHex("#333333"),
                            ),
                          ),
                          pw.SizedBox(height: 20),
                          pw.Text(
                            'WORK EXPERIENCE',
                            style: pw.TextStyle(
                              fontSize: 14,
                              fontWeight: pw.FontWeight.bold,
                              color: PdfColor.fromInt(0xff213D63),
                            ),
                          ),
                          pw.SizedBox(height: 10),
                          ...experiences.map(
                            (exp) {                      
                               DateTime startedAt = DateTime.parse(exp.startedAt);
        DateTime? endedAt = exp.endedAt != null ? DateTime.parse(exp.endedAt!) : null;
return pw.Bullet(
                              text: '${exp.title}\n${exp.excerpt ?? ""}\n${startedAt.year.toString()}_${endedAt?.year.toString()??""}\n ${exp.body}',
                              style: pw.TextStyle(
                                fontSize: 12,
                                color: PdfColor.fromHex("#333333"),
                              ),
                            );
                            }
      
                          ).toList(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );

    return pdf.save();
  }
Future<Uint8List> loadDefaultImage() async {
  final ByteData bytes = await rootBundle.load('assets/images/Default_pfp.jpg');
  return bytes.buffer.asUint8List();
}

Future<Uint8List> loadImage(String? imagePath) async {
  if (imagePath != null && File(imagePath).existsSync()) {
    return File(imagePath).readAsBytes();
  } else {
    return loadDefaultImage();
  }
}
  Future<Uint8List> createResumePremium({
    required List<Skill> skills,
    required List<Experience> experiences,
    required List<Education> education,
     required User user,
  }) async {
    final pdf = pw.Document();
// استرجاع مسار الصورة من SharedPreferences
  final imagePath = await getImagePathFromSharedPreferences();
  print(imagePath);
  
  final Uint8List imageBytes = await loadImage(imagePath);

  //   // قراءة الصورة من المسار
  
  // // قراءة الصورة من المسار
  // final File imageFile = File(imagePath ?? "");
  // print(imageFile.existsSync());
  // if (!imageFile.existsSync()) {
  //   print('Error: Image file does not exist.');
   
  // }
  // final Uint8List imageBytes = await imageFile.readAsBytes();
  // print('Image Bytes Length: ${imageBytes.length}');
  
    final fontData = await rootBundle.load('assets/fonts/Tajawal-Regular.ttf');
    final fontRegular = pw.Font.ttf(fontData);

    final fontBold = pw.Font.ttf(await rootBundle.load('assets/fonts/Tajawal-Bold.ttf'));

    final mdiFont = await rootBundle.load('assets/fonts/materialdesignicons-webfont.ttf');
    final mdiIcons = pw.Font.ttf(mdiFont);

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Container(
                color: PdfColor.fromInt(0xffC9D6E6),
                padding: pw.EdgeInsets.all(20),
                child: pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.SizedBox(width: 10),
                    pw.Container(
                      width: 140,
                      height: 140,
            //           decoration: pw.BoxDecoration(
            //             shape: pw.BoxShape.circle,
            //             image: 
            //             pw.DecorationImage(
            //   image: pw.MemoryImage(imageBytes),
            //   fit: pw.BoxFit.cover,
            // ),
            //         ),
            child: pw.ClipOval(
            child: pw.Image(
              pw.MemoryImage(imageBytes),
              fit: pw.BoxFit.cover,
              width: 104,
              height: 104,
            ),
          ),
                  ),
                    pw.SizedBox(width: 40),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        
                        pw.Text(
                         user.firstName + user.lastName,
                          style: pw.TextStyle(
                            fontSize: 37,
                            fontWeight: pw.FontWeight.bold,
                            color: PdfColor.fromInt(0xff213D63),
                          ),
                        ),
                        pw.SizedBox(height: 10),
                        pw.Text(
                          'I T E',
                          style: pw.TextStyle(
                            fontSize: 25,
                            color: PdfColor.fromInt(0xff213D63),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Flexible(
                    flex: 2,
                    child: pw.Container(
                    
                      padding: pw.EdgeInsets.all(20),
                      child: pw.Flexible(
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text(
                              'CONTACT',
                              style: pw.TextStyle(
                                fontSize: 14,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColor.fromInt(0xff213D63),
                              ),
                            ),
                            pw.SizedBox(height: 10),
                            pw.Row(
                              children: [
                                pw.Text(
                                  String.fromCharCode(MdiIcons.phone.codePoint),
                                  style: pw.TextStyle(
                                    font: mdiIcons,
                                    fontSize: 12,
                                  ),
                                ),
                                pw.SizedBox(width: 5),
                                pw.Text(
                                 user.phoneNumber,
                                  style: pw.TextStyle(
                                    fontSize: 12,
                                    color: PdfColor.fromHex("#333333"),
                                  ),
                                ),
                              ],
                            ),
                            pw.SizedBox(height: 5),
                            pw.Row(
                              children: [
                                pw.Text(
                                  String.fromCharCode(MdiIcons.email.codePoint),
                                  style: pw.TextStyle(
                                    font: mdiIcons,
                                    fontSize: 12,
                                  ),
                                ),
                                pw.SizedBox(width: 5),
                                pw.Text(
                                user.email,
                                  style: pw.TextStyle(
                                    fontSize: 12,
                                    color: PdfColor.fromHex("#333333"),
                                  ),
                                ),
                              ],
                            ),
                            pw.SizedBox(height: 5),
                            pw.Row(
                              children: [
                                pw.Text(
                                  String.fromCharCode(MdiIcons.web.codePoint),
                                  style: pw.TextStyle(
                                    font: mdiIcons,
                                    fontSize: 12,
                                  ),
                                ),
                                pw.SizedBox(width: 5),
                                // pw.Text(
                                //   'www.sitioincreible.com',
                                //   style: pw.TextStyle(
                                //     fontSize: 12,
                                //     color: PdfColor.fromHex("#333333"),
                                //   ),
                                // ),
                              ],
                            ),
                            pw.SizedBox(height: 20),
                            pw.Text(
                              'SKILLS',
                              style: pw.TextStyle(
                                fontSize: 14,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColor.fromInt(0xff213D63),
                              ),
                            ),
                            pw.SizedBox(height: 10),
                            ...skills.map(
                              (skill) => pw.Bullet(
                                text: skill.title,
                                style: pw.TextStyle(
                                  fontSize: 12,
                                  color: PdfColor.fromHex("#333333"),
                                ),
                              ),
                            ).toList(),
                            pw.SizedBox(height: 20),
                            pw.Text(
                              'EDUCATION',
                              style: pw.TextStyle(
                                fontSize: 14,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColor.fromInt(0xff213D63),
                              ),
                            ),
                            pw.SizedBox(height: 10),
                            ...education.map(

                              (edu) { DateTime startedAt = DateTime.parse(edu.startedAt);
        DateTime? endedAt = edu.endedAt != null ? DateTime.parse(edu.endedAt!) : null; 
        return pw.Bullet(
                                text: '${edu.graduated != null && edu.graduated!? "graduated in":"" }\n${edu.title ?? ""}\n${edu.major}\n${edu.specialization} \n${startedAt.year.toString() }_${endedAt?.year.toString()??""}',
                                style: pw.TextStyle(
                                  fontSize: 12,
                                  color: PdfColor.fromHex("#333333"),
                                ),
                              );}
                               
                            ).toList(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  pw.SizedBox(width: 20),
                  pw.Flexible(
                    flex: 3,
                    child: pw.Padding(
                      padding: pw.EdgeInsets.all(20),
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(
                            'ABOUT ME',
                            style: pw.TextStyle(
                              fontSize: 14,
                              fontWeight: pw.FontWeight.bold,
                              color: PdfColor.fromInt(0xff213D63),
                            ),
                          ),
                          pw.SizedBox(height: 10),
                          pw.Text(
                           user.bio,
                            style: pw.TextStyle(
                              fontSize: 12,
                              color: PdfColor.fromHex("#333333"),
                            ),
                          ),
                          pw.SizedBox(height: 20),
                          pw.Text(
                            'WORK EXPERIENCE',
                            style: pw.TextStyle(
                              fontSize: 14,
                              fontWeight: pw.FontWeight.bold,
                              color: PdfColor.fromInt(0xff213D63),
                            ),
                          ),
                          pw.SizedBox(height: 10),
                          ...experiences.map(
                            (exp) {                      
                               DateTime startedAt = DateTime.parse(exp.startedAt);
        DateTime? endedAt = exp.endedAt != null ? DateTime.parse(exp.endedAt!) : null;
return pw.Bullet(
                              text: '${exp.title}\n${exp.excerpt ?? ""}\n${startedAt.year.toString()}_${endedAt?.year.toString()??""}\n ${exp.body}',
                              style: pw.TextStyle(
                                fontSize: 12,
                                color: PdfColor.fromHex("#333333"),
                              ),
                            );
                            }
      
                          ).toList(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );

    return pdf.save();
  }

//   Future<Uint8List> getImageData(String url) async {
//     if (!url.startsWith('http')) {
//      url = 'https://example.com' + url;
//   }

//     final response = await http.get(Uri.parse(url));
//   if (response.statusCode == 200) {
//      print('Request was successful');
//       print(response.body);
//     return response.bodyBytes;
    
//   } else {
//      print('Request failed with status: ${response.statusCode}');
//     throw Exception('Failed to load image');
//   }
// }
// Future<Uint8List> getImageData(String url) async {
//   // أضف سجل لمعرفة الـ URL قبل التعديل
//   print('Original URL: $url');

//   // تأكد من أن URL يحتوي على المضيف الصحيح
//   if (!url.startsWith('http')) {
//     url = 'https://example.com' + url; // استبدل 'https://example.com' بالمضيف الصحيح
//   }

//   // أضف سجل لمعرفة الـ URL بعد التعديل
//   print('Final URL: $url');

//   final response = await http.get(Uri.parse(url));

//   // أضف سجل لمعرفة حالة الاستجابة
//   print('Response status: ${response.statusCode}');

//   if (response.statusCode == 200) {
//     return response.bodyBytes;
//   } else {
//     throw Exception('Failed to load image: ${response.statusCode}');
//   }
// }

  Future<void> savePdfFile(String fileName, Uint8List byteList) async {
    final path = (await getApplicationDocumentsDirectory()).path;
    final file = File('$path/$fileName.pdf');
    await file.writeAsBytes(byteList);
    setState(() {
      _cvFiles.add(file.path);
    saveCvFiles(_cvFiles);
    });
  }

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        _fileName = result.files.first.name;
        _fileBytes = result.files.first.bytes;
      });
    }
  }


Future<String?> getBase64ImageFromSharedPreferences() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('profile_picture'); // اسم المفتاح الذي خزنت فيه الصورة
}


Future<Uint8List?> readImageFromFile(String path) async {
  try {
    final file = File(path);
    return await file.readAsBytes();
  } catch (e) {
    print('Error reading image file: $e');
    return null;
  }
}


Future<String?> getImagePathFromSharedPreferences() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('profile_picture'); // استخدم المفتاح الصحيح لمسار الصورة
}


Uint8List? base64ToUint8List(String base64String) {
  try {
    return base64Decode(base64String);
  } catch (e) {
    print('Error decoding Base64: $e');
    return null;
  }
}

// استرجاع الصورة من SharedPreferences
Future<Uint8List?> getImageFromSharedPreferences() async {

   final base64Image = config.get<SharedPreferences>().getString("profile_picture");
  if (base64Image != null) {
    return base64Decode(base64Image);
  } else {
    return null; // أو التعامل مع حالة عدم وجود صورة
  }
}
Future<void> saveCvFiles(List<String> files) async {
  final prefs = await SharedPreferences.getInstance();
String? userId = prefs.getString("id");
  await prefs.setStringList('cv_files $userId', files);
}


// تحويل الـ Uint8List إلى صورة في PDF





//   Future<Uint8List> _generateResume(BuildContext context) async {
//     final skillState = BlocProvider.of<SkillBloc>(context).state;
//     final experienceState = BlocProvider.of<ExperienceBloc>(context).state;
//     final educationState = BlocProvider.of<EducationBloc>(context).state;
//      List<Skill> skills = [];
//                                     List<Experience> experiences = [];
//                                     List<Education> education = [];
// if (skillState is Success) {
//   print("SkillSuccess");
//   skills = skillState.skills;
// } else {
//   print("Skill State: $skillState");
// }

// if (experienceState is ExperienceSuccess) {
//   print("ExperienceSuccess");
//   experiences = experienceState.experiences;
// } else {
//   print("Experience State: $experienceState");
// }

// if (educationState is EducationSuccess) {
//   print("EducationSuccess");
//   education = educationState.educations;
// } else {
//   print("Education State: $educationState");
// }


//  final pdfBytes = await createResume(
//     skills: skills,
//     experiences: experiences,
//     education: education,
//   );

//   return pdfBytes;
//   }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
       
         BlocProvider(create: (context) => SkillBloc()..add(GetSkills())),
           BlocProvider(create: (context) => GetUserBloc()..add(GetUser())),
         BlocProvider(create: (context) => ExperienceBloc()..add(GetExperiences())),
          BlocProvider(create: (context) => EducationBloc()..add(GetEducation())),
    
      ],
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Theme.of(context).brightness == Brightness.light
                      ? AssetImage('assets/images/light.bg.png')
                      : AssetImage('assets/images/dark_bg.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 26, right: 26),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 19),
                          child: Image.asset("assets/images/back.png"),
                        ),
                        Spacer(),
                      //   Padding(
                      //     padding: const EdgeInsets.only(top: 19),
                      //     child: Text(
                      //       "Skip",
                      //       style: TextStyle(
                      //         fontWeight: FontWeight.w400,
                      //         fontSize: 14,
                      //         color: Theme.of(context).colorScheme.primaryContainer,
                      //         fontFamily: "Poppins",
                      //       ),
                      //     ),
                      //   ),
                      ],
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 32),
                    //   child: CustomText(
                    //     family: "Poppins",
                    //     color: Theme.of(context).colorScheme.onTertiary,
                    //     size: 16,
                    //     text: "Resume or Cv",
                    //     weight: FontWeight.w600,
                    //   ),
                    // ),
                    SizedBox(height: 10),
                    Center(
                      child: CustomText(
                        family: "Poppins",
                        color: Theme.of(context).colorScheme.onTertiary,
                        size: 13,
                        text: "Upload your CV or Resume and \n use it when you apply for jobs".tr(),
                        weight: FontWeight.w400,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 56),
                      child: Center(
                        child: Container(
                          width: 293,
                          height: 73,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Theme.of(context).colorScheme.onPrimaryContainer,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/Vector (15).png"),
                              SizedBox(width: 10),
                              Center(
                                child: Text(
                                  "Upload a Doc/Docx/PDF".tr(),
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.primaryContainer,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Poppins",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 56),
                      child: InkWell(
                        onTap: () {
                          print(config.get<SharedPreferences>().getString("Token"));
                          _pickFile();
                        },
                        child: Center(
                          child: Container(
                            width: 184,
                            height: 56,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Theme.of(context).colorScheme.primaryContainer,
                            ),
                            child: Center(
                              child: Text(
                                "Upload".tr(),
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Poppins",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                    Center(
                      child: CustomText(
                        family: "Poppins",
                        color: Theme.of(context).colorScheme.onTertiary,
                        size: 13,
                        text: "if you don't have CV \n we will generate one for you !".tr(),
                        weight: FontWeight.w400,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 56),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () async {
                              // print(config.get<SharedPreferences>().getString("Token"));
                              // final data = await _generateResume(context);
                              // savePdfFile("resume_$number", data);
                              // number++;
                                 final skillState = BlocProvider.of<SkillBloc>(context).state;
                          final experienceState = BlocProvider.of<ExperienceBloc>(context).state;
                          final educationState = BlocProvider.of<EducationBloc>(context).state;
                             final UserState = BlocProvider.of<GetUserBloc>(context).state;
                          
                          if (skillState is Success && 
                              experienceState is ExperienceSuccess &&
                              educationState is EducationSuccess &&UserState is GetUserSuccess) {
                            final pdfData = await createResume(
                              skills: skillState.skills,
                              experiences: experienceState.experiences,
                              education: educationState.educations,
                              user : UserState.user
                            );
                             String userTokenn = config.get<SharedPreferences>().getString("Token") ?? "";
                                  
                                  final isSuccess = await sendResumeToApi(pdfData, userTokenn);
                              print(isSuccess);
                          //   await savePdfFile("resume_$number", pdfData);
                          //   setState(() {
                          //     number++;
                          //   });
                          // } else {
                          //   // Handle cases where the data is not loaded yet.
                          // }
                          //   },
                          
                                if (isSuccess) {
                                  // حفظ بيانات PDF كملف محلي
                                  await savePdfFile("resume_$number", pdfData);
                                  setState(() {
                                    number++;
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('CV created successfully!')),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Failed to create CV.')),
                                  );
                                }
                              } else {
                                // التعامل مع الحالة عندما لا تكون البيانات محملة بعد
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Data not loaded.')),
                                );
                              }
                            },
                            child: Center(
                              child: Container(
                                width: 194,
                                height: 56,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Theme.of(context).colorScheme.primaryContainer,
                                ),
                                child: Center(
                                  child: Text(
                                    "Generate".tr(),
                                    style: TextStyle(
                                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Poppins",
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                                                 InkWell(
                            onTap: () async {
                              // print(config.get<SharedPreferences>().getString("Token"));
                              // final data = await _generateResume(context);
                              // savePdfFile("resume_$number", data);
                              // number++;
                                 final skillState = BlocProvider.of<SkillBloc>(context).state;
                          final experienceState = BlocProvider.of<ExperienceBloc>(context).state;
                          final educationState = BlocProvider.of<EducationBloc>(context).state;
                             final UserState = BlocProvider.of<GetUserBloc>(context).state;
                          
                          if (skillState is Success && 
                              experienceState is ExperienceSuccess &&
                              educationState is EducationSuccess &&UserState is GetUserSuccess) {
                            final pdfData = await createResumePremium(
                              skills: skillState.skills,
                              experiences: experienceState.experiences,
                              education: educationState.educations,
                              user : UserState.user
                            );
                             String userTokenn = config.get<SharedPreferences>().getString("Token") ?? "";
                                  
                                  final isSuccess = await sendResumeToApi(pdfData, userTokenn);
                              print(isSuccess);
                          //   await savePdfFile("resume_$number", pdfData);
                          //   setState(() {
                          //     number++;
                          //   });
                          // } else {
                          //   // Handle cases where the data is not loaded yet.
                          // }
                          //   },
                          
                                if (isSuccess) {
                                  // حفظ بيانات PDF كملف محلي
                                  await savePdfFile("resume_$number Premium", pdfData);
                                  setState(() {
                                    number++;
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('CV created successfully!')),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Failed to create CV.')),
                                  );
                                }
                              } else {
                                // التعامل مع الحالة عندما لا تكون البيانات محملة بعد
                                // ScaffoldMessenger.of(context).showSnackBar(
                                //   SnackBar(content: Text('Data not loaded.')),
                                // );
                              }
                            },
                            child: Center(
                              child: Container(
                                width: 194,
                                height: 56,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Theme.of(context).colorScheme.primaryContainer,
                                ),
                                child:  Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        
                            Text(
                              "Generate Premium".tr(),
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Poppins",
                              ),
                            ),
                                Image.asset("assets/images/Vector (15).png"),
                          ],
                        ),
                              ),
                            ),
                          ),
                        
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _cvFiles.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(_cvFiles[index].split('/').last),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PdfViewPage(path: _cvFiles[index]),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
