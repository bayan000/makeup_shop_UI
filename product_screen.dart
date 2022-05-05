

import 'package:flutter/material.dart';

import 'package:pl_proj/shared/components/constant.dart';

// ignore: must_be_immutable
class ProductScreen extends StatelessWidget {
//category,expiring date,name,pic,phone number,amount,price
  String category,image,name,description;
  double price;
  int amount,number,days1,days2,days3;
  String expDate;
  

  ProductScreen(
  {Key? key, 
    required this.days1,
    required this.days2,
    required this.days3,
    required this.expDate,
    required this.category,
    required this.price,
    required this.amount,
    required this.image,
    required this.name,
    required this.number,
    required this.description,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
   


    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgr,
      ),
      body:Center(
        child: Container(
width: 700,
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
           
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                FittedBox(
                  child: Image(
                    image:AssetImage(image),
                    width: 500,
                    height: 300,
                    fit:BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 60,),
                SizedBox(width: 70,child: MaterialButton(child:const Text('Delete'),color: colAvtext,onPressed: (){}))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                name,
                style: const TextStyle(
                  fontSize:30,
                ),),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: SizedBox(
                width:200,
      
                child: Row(
                  
                  children: [const Text('Category',style: TextStyle(
                  fontSize:20,
                ),
                ),const SizedBox(width:10,), Text(category,style: const TextStyle(
                  fontSize:20,
                ),)],),
              ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(description,
              style: const TextStyle(
                fontSize:20,
              ),
              overflow: TextOverflow.ellipsis,
              ),
           
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: SizedBox(
                width:288,
                height:30,
                child: Row(
                  
                  children: [Text('$amount',style: const TextStyle(
                  fontSize:20,
                ),
                ),const SizedBox(width:10,),const Text('pieces',style: TextStyle(
                  fontSize:20,
                ),),
                const SizedBox(width:20,),
                const Text('Expieres at',style: TextStyle(
                  fontSize:20,
                ),),const SizedBox(width:10,),Text(expDate,style: const TextStyle(
                  fontSize:20,
                ),
                ),
                ],),
              ),
              ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width:100,
                child: Row(
                  
                  children: [Text('$price',style: const TextStyle(
                  fontSize:20,
                ),
                ),const SizedBox(width:10,),const Text('\$',style: TextStyle(
                  fontSize:20,
                ),)],),
              ),
              ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width:210,
                height: 17,
                child: Row(
                  
                  children: [const Text('number',style: TextStyle(
                  fontSize:17,
                ),
                ),const SizedBox(width:10,), Text('$number',style: const TextStyle(
                  fontSize:17,
                ),)],),
              ),
              ),
          ],
        ),
    ),
      ));
  }

}
