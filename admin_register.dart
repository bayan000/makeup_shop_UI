

import 'package:flutter/material.dart';
import 'package:pl_proj/modules/login/login_screen.dart';
import 'package:pl_proj/shared/components/components.dart';
import 'package:pl_proj/shared/components/constant.dart';

// ignore: must_be_immutable
class AdminRegister extends StatefulWidget{
  const AdminRegister({Key? key}) : super(key: key);

  @override
  State<AdminRegister> createState() => _AdminRegisterState();
}

class _AdminRegisterState extends State<AdminRegister> {
  var userNameController=TextEditingController();

  var emailController=TextEditingController();

  var passwordController=TextEditingController();

  var phoneNumberController =TextEditingController();
  
  var formKey = GlobalKey<FormState>();
 @override
Widget build(BuildContext context) {
return  Scaffold(
appBar: AppBar(
        elevation: 0,
        shadowColor:backgr,
        backgroundColor: backgr,      
        foregroundColor: colLogText,
      leading: const Text(''),
      title: const Text('AvailaProd'),
       titleTextStyle:TextStyle(
         fontSize: 50,
        foreground: Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2
          ..color = Colors.grey[300]!,
                               )
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

  child:   Row(
    
    children: [
  
    
    const SizedBox(width: 35,),
    
    Column(
  
      children: [
  
        const SizedBox(height: 50,),  
  
        Container(
         
         decoration: const BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(50),)
         ),
         clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Image.network(
            'https://cdn.shopify.com/s/files/1/0097/7315/4382/products/bambi02-2_large.jpg?v=1623139970',
          
          fit:BoxFit.cover
  
          ),
        ),
  
        //child: TextFormField(),
  
         
  
      ],
  
    ),

   // const SizedBox(width: ,),
    const SizedBox(width: 50,
    ),
    
    Container(
         decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30)),//only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
         color:  merge
                                        ),
         height: 510,
         width: 719,
         clipBehavior: Clip.antiAliasWithSaveLayer,

         child:Form(
      key: formKey,
      child: Column(
      crossAxisAlignment:CrossAxisAlignment.center,

      children:  [
      const SizedBox(height: 40,),

      const Text('Sign Up into AvailaProd',
    
          style: TextStyle(fontSize: 25,
                           fontWeight:FontWeight.bold,
              color : colLogText,)
    
          ),

      const SizedBox(height: 30,),

    Padding(
      padding: const EdgeInsets.symmetric(horizontal:150),
      child: defaultTextFormField(controller: userNameController, 
     type: TextInputType.name,
     validate:(value){if(value!.isEmpty){
      return 'Enter your NAME please ! ';
    }
    return null;} ,
     label: 'Name',
     prefix: Icons.person)
        ),   
const SizedBox(height: 20,),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal:150),
      child: defaultTextFormField(controller: emailController, 
     type: TextInputType.emailAddress,
     validate:(value){if(value!.isEmpty){
      return 'Enter your Email address please ! ';
    }
    return null;} ,
     label: 'Email',
     prefix: Icons.email)
        ),
    const SizedBox(height: 20,),
    
   Padding(
    padding: const EdgeInsets.symmetric(horizontal:150),
     child:defaultTextFormField(
     ispass: true,
     controller: passwordController, 
     type: TextInputType.visiblePassword,
     validate:(value1){if(value1!.isEmpty){
      return 'Enter your password please ! ';
    }
    return null;} ,
     label: 'Password',
     prefix: Icons.lock,
     suffix: Icons.remove_red_eye)
      ), 
   const SizedBox(height: 20,),

       Padding(
      padding: const EdgeInsets.symmetric(horizontal:150),
      child: defaultTextFormField(controller: phoneNumberController, 
     type: TextInputType.phone,
     validate:(value){if(value!.isEmpty){
      return 'Enter your phone number please ! ';
    }
    return null;} ,
     label: 'Phone number',
     prefix: Icons.phone_android)
        ),

   const SizedBox(height: 19,),
  Padding(
      padding: const EdgeInsets.symmetric(horizontal:310),
      child:defaultBottun(function: (){
        
    if(formKey.currentState!.validate()){  Navigator.push(
     context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );}
       }, text:'Sign Up')),
     //  const SizedBox(height: 30,),
       
  //const SizedBox(height: 30,),
  
                             ] )
          )                    
                               
                               ),
    
   
  
  
    ],
  
  ),
  
)


                );
                                   }
}