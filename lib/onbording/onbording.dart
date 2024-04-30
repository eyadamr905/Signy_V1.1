import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../login/login.dart';




class welcom extends StatefulWidget {
  const welcom({super.key});

  @override
  State<welcom> createState() => _welcomState();
}

class _welcomState extends State<welcom> {
  PageController _controller=PageController();
  bool last=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: [
        PageView(
       controller: _controller,
       onPageChanged: (index) {
         setState(() {
           last=(index==2);
         });
       },
        
           children:[ Padding(
             padding: const EdgeInsets.only(bottom: 90),
             child: Container(
                     
                  child: const Image(image: AssetImage('assets/first.png')),
                
              
                       ),
           ),
          Padding(
             padding: const EdgeInsets.only(bottom: 90),
            child: Container(
                    
                  child: const Image(image: AssetImage('assets/hands.png')),
                
              
            ),
          ),
          Padding(
             padding: const EdgeInsets.only(bottom: 90),
            child: Container(
                    
                  child: const Image(image: AssetImage('assets/lang.png')),
                
              
            ),
          ),
           ],
  
       ),
       Container(
        alignment: const Alignment(0,0.65),
        child: Row(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SmoothPageIndicator(controller: _controller, count: 3),
            last?
            GestureDetector(
              onTap: () {
Navigator.push(context, MaterialPageRoute(builder: (context)
{
return const signin();

}));              },
              
              child: 
              
                Container(child: const Text("Next")),
            
            ): GestureDetector(
              onTap: () {
                _controller.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
              },
              
              child: 
              
                Container( child: const Padding(
                  padding: EdgeInsets.only(top: 50),
                  
                  child: Card(shape: RoundedRectangleBorder(
     borderRadius:
      BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20),bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))),
     color: Color.fromARGB(133, 68, 109, 90)
  ,child: Text("Next"),),
                )),
            
            )
          ],
        ))
       ],
       ),
    );
}

}