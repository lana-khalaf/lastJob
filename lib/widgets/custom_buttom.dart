
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
 CustomButton({this.colorText,super.key, required this.text,  this.color, required this.press, this.colorBorder, this.height, this.width,this.radius,this.family,this.size,this.weight});
 final VoidCallback press;
String text;
Color? color;
Color? colorText;
 double? size;
 FontWeight? weight;
 String? family;
Color? colorBorder;
double? height;
double? width;
double? radius;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height!=null?height:54,
      width: width!=null?width:398,
      decoration: BoxDecoration(
        
       
        // borderRadius: BorderRadius.circular(radius??8),
      
        // border:colorBorder != null ? Border.all(color: colorBorder!) : null,
      ),
     
    
    
        child:ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 8),
            side: colorBorder != null ? BorderSide(color: colorBorder!) : BorderSide.none,
          ),
          backgroundColor: color

        
          // primary: color,
        )
        ,
        onPressed: press,
      
        child: Text(text,
        textAlign: TextAlign.center,
        
        style: TextStyle(
        fontWeight:  weight!=null?weight:FontWeight.w500,
          fontSize:  size!=null?size:20,
          color: colorText!=null?colorText:null,
          fontFamily:  family!=null?family:"Cairo"
        ),
        )
      ),
      );
       
    

  }
}