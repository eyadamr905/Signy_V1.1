import 'package:flutter/material.dart';
import 'package:test12/Home/home.dart';
import '../Home/learning.dart';
class costumB extends StatelessWidget {
  final Color colorW;
  final String text;
  final String img;
  
  costumB({super.key, required this.text, required this.colorW,required this.img, });
  @override
  Widget build(BuildContext context) {
    return InkWell(child: 
     Padding(
       padding: const EdgeInsets.only(left: 30.0),
       child: Container(
        
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)), color: colorW),
          height: 160,
          width: 320,
          padding: EdgeInsets.all(30),
          child: Row(
            children: [
              Expanded(
             //   padding: const EdgeInsets.only(right: 0),
                child: Text(
                '$text ',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 23.1,
                    color: Colors.black),
                          ),
                          
              ), 
             Image.asset(img,fit: BoxFit.cover, alignment: Alignment.centerRight,
             height: 90,
             width: 90,
             
             )
            ]
          )
          
        ),
     ),
//     onTap: () {
//  Navigator.of(context).push(
// MaterialPageRoute(builder: (context) => Learning())//اكتب هنا اسم الصفحه او اعملها ب فوق لنتروق"variable"
// );
//  },
    
    );
  }

}
Image logoWidget(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 240,
    height: 240,
    color: Colors.white,
  );
}

TextFormField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextFormField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: const Color.fromARGB(138, 212, 212, 216),
    style: const TextStyle(color: Color.fromARGB(175, 11, 10, 10)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: const Color.fromARGB(175, 11, 10, 10),
      ),
      labelText: text,
      labelStyle: const TextStyle(color: Color.fromARGB(175, 11, 10, 10)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: const Color(0xffD4D4D8),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

Container firebaseUIButton(BuildContext context, String title, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black26;
            }
            return const Color(0xffFDD95A);
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))),
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
      ),
    ),
  );
  
}

class text extends StatelessWidget {
  final String txt;
  final double size;
  final double? height;
  final FontWeight? weight;
  final TextAlign? align;
  final Color? color;

  text({
    super.key,
    required this.txt,
    required this.size,
    this.weight,
    this.align,
    this.color,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      textAlign: align ?? TextAlign.left,
      style: TextStyle(
        fontSize: size,
        fontWeight: weight,
        color: color,
        height: height,
      ),
    );
  }
}