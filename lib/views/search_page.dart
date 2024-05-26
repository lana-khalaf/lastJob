import 'package:flutter/material.dart';
import 'package:flutter_jobs_app/widgets/job_container.dart';
import 'package:flutter_jobs_app/widgets/search_result.dart';

class SearchPage extends StatefulWidget {
   SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
    TextEditingController textField = TextEditingController();
    List <String> test =[
      // "UI","UX", "PLA", "PLA", "PLA","PLA"
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
         decoration: BoxDecoration(
          image: DecorationImage(
            image:  Theme.of(context).brightness == Brightness.light ? AssetImage('assets/images/light.bg.png') : AssetImage('assets/images/dark_bg.png'),
            fit: BoxFit.cover,
          ),

          
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
          //  mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: Row(
                  children: [
                    InkWell(child:Image.asset("assets/images/Vector (8).png"), onTap: (){},),
                    Padding(
                      padding: const EdgeInsets.only(left: 125),
                      child: Text("Search",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,// غيرت 
                        color: Theme.of(context).colorScheme.onTertiary,
                                fontFamily:"Poppins",
                                
                      ),),
                    ),
                    SizedBox(
                      width: 115,
                    ),
                    
        
                  ],
                ),
              ),
               Padding(
                 padding: const EdgeInsets.only(
                  top: 40, bottom: 20, right: 10
                 ),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [
                     SizedBox(
                      width: 275,
                       child: TextField(
                                controller: textField,
                                keyboardType: TextInputType.name,
                                onChanged: (value) {
                                  
                                },
                                decoration: InputDecoration(
                                 
                                  // fillColor: Color(0xffF5F6FA),
                                  prefixIcon:Image.asset("assets/images/Search.png"),
                                  labelText: "Search a job or position",
                                  labelStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    color: Theme.of(context).colorScheme.secondaryContainer,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Theme.of(context).colorScheme.primaryContainer,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  focusedBorder:  OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Theme.of(context).colorScheme.primaryContainer,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                     ),
                               InkWell(
                                onTap: (){},
                                 child: Container(
                                                         height: 52,
                                                         width: 48,
                                                         decoration: BoxDecoration(
                                                           border: Border.all(color: Theme.of(context).colorScheme.secondaryContainer,),
                                                  
                                                           borderRadius: BorderRadius.circular(12),
                                                         ),
                                                         child: Center(child:Image.asset("assets/images/filter.5.png"), ),
                                                       ),
                               ),
               
                   ],
                 ),
               ),
                test.isNotEmpty? Expanded(child: SearchResult(test: test,)):
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text("Recent Searches",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,// غيرت 
                          color: Theme.of(context).colorScheme.primary,
                  fontFamily:"Poppins",
                  
                        ),),
            
          
           Padding(
         padding: const EdgeInsets.only(top: 18),
         child: SizedBox(
          height: 200,
           child: ListView.separated(itemBuilder:(context,index){
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[SizedBox(),
               Image.asset("assets/images/Vector (6).png"),
              Text("pla pla pla",
             
              style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                        color: Theme.of(context).colorScheme.onPrimary,
                                      ),),
                                       SizedBox(
                width: 180,
              ),
                                     InkWell(onTap: (){}, child: Image.asset("assets/images/Vector (9).png")),
                                     SizedBox()
                                    
                                   
         
            ]
            );
           },
            separatorBuilder: (context, x){return Divider(); },
             itemCount: 20),
         ),
           ),
         Padding(
           padding: const EdgeInsets.only(bottom: 16, top: 30),
           child: Text("Recently Viewed",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,// غيرت 
                        color: Theme.of(context).colorScheme.primary,
                fontFamily: "Poppins",
                
                      ),),
         ),
                   job_container(tist: test)
                     ],
                     ),
           
                     ],
            
          ),
        ),
      ) 
   
    );
  }
}


