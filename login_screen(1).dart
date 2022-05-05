
import 'package:flutter/material.dart';
import 'package:pl_proj/modules/Products/products_list.dart';
// ignore: unused_import
import 'package:pl_proj/modules/register/admin_register.dart';
// ignore: unused_import
//import 'package:pl_proj/products_list.dart';
// ignore: unused_import
import 'package:pl_proj/shared/components/components.dart';
import 'package:pl_proj/shared/components/constant.dart';

// ignore: must_be_immutable
class LoginScreen extends StatefulWidget{

 const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController=TextEditingController();

  var passwordController=TextEditingController();

  var formKey = GlobalKey<FormState>();

@override
Widget build(BuildContext context) {
return  Scaffold(
 appBar: AppBar(
        elevation: 0,
        shadowColor:backgr ,
        backgroundColor: backgr,       
        foregroundColor: colLogText,
      leading: const Text(''),
      title: const Text('AvailaProd'),
       titleTextStyle:TextStyle(
         fontSize: 50,
        foreground: Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2
          ..color = merge,
                               )
               ),

// ignore: avoid_unnecessary_containers
body:Container(

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
         decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30)),//.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
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

      const Text('Log in into AvailaProd',
    
          style: TextStyle(fontSize: 25,
                           fontWeight:FontWeight.bold,
              color : colLogText,)
    
          ),

      const SizedBox(height: 40,),
        
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
    const SizedBox(height: 40,),
    
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
   const SizedBox(height: 50,),
  Padding(
      padding: const EdgeInsets.symmetric(horizontal:310),
      child:defaultBottun(function: (){
        
    if(formKey.currentState!.validate()){  Navigator.push(
     context,
      MaterialPageRoute(builder: (context) =>  ProductsList()),
    );}
       }, text:'Log In')),
       const SizedBox(height: 20,),
       Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                  const Text(
                    'Don\'t have an account ?',
                  ),
                  
    TextButton(onPressed: (){Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AdminRegister()),
    );
  }, child: const Text(
                      'Sign Up',
                      style:TextStyle(
                        fontSize: 20,
                        color: backgr,
                      ),
       ),
       
       ),
            ],
  
  ),
  const SizedBox(height: 30,),
  TextButton(onPressed: (){Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProductsList()),
    );
  }, child:  Text(
                      '..Skip..',
                      style:TextStyle(
                        fontSize: 30,
        foreground: Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2
          ..color = colAvtext
                      ),
       ),
       
       ),
                             ] )
          )                    
                               
                               ),
    
   
  
  
    ],
  
  ),
  
)
  );
                                  } }

