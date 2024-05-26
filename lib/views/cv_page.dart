
import 'package:flutter/material.dart';
import 'package:flutter_jobs_app/config.dart';
import 'package:flutter_jobs_app/widgets/custom%20text.dart';
import 'package:flutter_jobs_app/widgets/custom_buttom.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CvPage extends StatelessWidget {
  const CvPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image:  Theme.of(context).brightness == Brightness.light ? AssetImage('assets/images/light.bg.png') : AssetImage('assets/images/dark_bg.png'),
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
                  Padding(
                    padding: const EdgeInsets.only(left: 300, top: 19),
                    child: Text(
                      "Skip",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.primaryContainer,
                        fontFamily: "Poppins",
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: CustomText(family: "Poppins", color: Theme.of(context).colorScheme.onTertiary, size: 16, text: "Resume or Cv", weight: FontWeight.w600),
              ),
              SizedBox(height: 10,),
              Center(child: CustomText(family: "Poppins", color: Theme.of(context).colorScheme.onTertiary, size: 13, text:"Upload your CV or Resume and \n use it when you apply for jobs" , weight: FontWeight.w400)),
              Padding(
                padding: const EdgeInsets.only(
                  top: 56
                ),
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
                        Center(
                          child: Text(
                            "Upload a Doc/Docx/PDF",
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
                padding: const EdgeInsets.only(
                  top: 56
                ),
                child: InkWell(
                  onTap: (){
                  print(config.get<SharedPreferences>().getString("Token"))  ;
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
                          "Upload",
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
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: Row(
                  children: [
                    CustomText(family: "Poppins", color: Theme.of(context).colorScheme.onTertiary, size: 16, text: "Portfolio", weight: FontWeight.w600),
                    CustomText(family: "Poppins", color: Theme.of(context).colorScheme.secondaryContainer, size: 16, text: " (Optional)", weight: FontWeight.w400),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      width: 156,
                      height: 44,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                      child: Center(
                        child: Text(
                          "Portfolio Link",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primaryContainer,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      width: 156,
                      height: 44,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                      child: Center(
                        child: Text(
                          "Add Slide",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primaryContainer,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Container(
                      width: 156,
                      height: 44,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                      child: Center(
                        child: Text(
                          "Add PDF",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primaryContainer,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Center(
                      child: Container(
                        width: 156,
                        height: 44,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                        child: Center(
                          child: Text(
                            "Add Photos",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primaryContainer,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: CustomButton(text: "Save", press: (){}, color:Theme.of(context).colorScheme.primaryContainer,colorText: Theme.of(context).colorScheme.onPrimaryContainer,width: 337,height: 56,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
