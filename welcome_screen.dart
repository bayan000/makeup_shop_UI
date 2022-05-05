// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:pl_proj/modules/login/login_screen.dart';
// ignore: unused_import
import 'package:carousel_slider/carousel_slider.dart';
import 'package:pl_proj/modules/login/login_screen.dart';
import 'package:pl_proj/shared/components/constant.dart';
// ignore: unused_import
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomeScreen extends StatefulWidget{
 const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final urlImages=[
    'https://media.istockphoto.com/photos/make-up-cosmetics-products-against-pink-color-background-picture-id1221677097?b=1&k=20&m=1221677097&s=170667a&w=0&h=F53wAlLL7Q8syWNmaJq7c5afMzOFOdPY5aPh1H3bcpM=',
    'https://media.istockphoto.com/photos/makeup-moody-background-picture-id1134374885?k=20&m=1134374885&s=612x612&w=0&h=qU31Gt9f9kxYYtM4qkb5guSVSPIpr7ATBZvpKgNLbzU=',
    'https://i0.wp.com/post.healthline.com/wp-content/uploads/2020/04/makeup_composition_overhead-1296x728-header.jpg?w=1155&h=1528',
    'https://images.pexels.com/photos/1115128/pexels-photo-1115128.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
 ];
 int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
   
    return Scaffold(
     // extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        shadowColor:backgr,
        backgroundColor:backgr,      
      ),

      body:
        Container(
          decoration: const BoxDecoration(
           gradient: LinearGradient(
             colors: [
               backgr,
                merge],
               begin: Alignment.topCenter,
               end:Alignment.bottomCenter,
               ),
          ),
          
          child: Column(
            children: [
              CarouselSlider.builder(itemCount:urlImages.length,
               itemBuilder: (context,index,realIndex){
                 final urlImage=urlImages[index];
                 return buildImage(urlImage,index);
               },
                options: CarouselOptions(height:400,
                onPageChanged: (index,reason)=>
                setState(() =>activeIndex=index),
                enlargeCenterPage: true,
                autoPlay: false,
                enableInfiniteScroll: false,
                //autoPlayInterval:const Duration(seconds: 2),
                viewportFraction: 0.4)),

                const SizedBox(height: 50,),

                buildIndicator(),

                const SizedBox(height: 50,),

                MaterialButton(onPressed:(){
                                            Navigator.push(
                                                           context,
                                                           MaterialPageRoute(builder: (context) => const LoginScreen()),
                                                          );

                                           },
                               child: Text(
                              'Welcome to AvailaProd',
                              style:TextStyle(
                                              fontSize: 40,
                                              foreground: Paint()
                                              ..style = PaintingStyle.stroke
                                              ..strokeWidth = 2
                                              ..color = const Color.fromARGB(255, 82, 78, 78),),
                             // textAlign: TextAlign.center,
                                           ),
                            ),
            ],
          ),
        ) );}

      Widget buildImage(String urlImage,int index)=>Container(
        margin:const EdgeInsets.symmetric(horizontal: 10),
        color: Colors.grey,
        child: Image.network(
          urlImage,
          fit:BoxFit.cover
        ),

      );

      Widget buildIndicator() => AnimatedSmoothIndicator(
       activeIndex:activeIndex,
       count:urlImages.length,
       effect: const JumpingDotEffect(
         activeDotColor: backgr,
         dotColor: merge
       ),
      );
}
 