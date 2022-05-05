import 'package:flutter/material.dart';
import 'package:pl_proj/models/product/product_model.dart';
import 'package:pl_proj/modules/Products/product_screen.dart';
//import 'package:pl_proj/product_screen.dart';
import 'package:pl_proj/shared/components/constant.dart';
//import 'models/product/product_model.dart';


class ProductsList extends StatefulWidget {
   // ignore: prefer_const_constructors_in_immutables
   ProductsList({Key? key}) : super(key: key);


  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
// ignore: unused_field
DateTime? _dateTim;
var namePcontroller=TextEditingController();
var picPcontroller=TextEditingController();
var phonenumPcontroller=TextEditingController();
var amountPcontroller=TextEditingController();
var pricePcontroller=TextEditingController();
var limdate1Pcontroller=TextEditingController();
var limdate2Pcontroller=TextEditingController();
var limdate3Pcontroller=TextEditingController();
var dispercen1Pcontroller=TextEditingController();
var dispercen2Pcontroller=TextEditingController();
var dispercen3Pcontroller=TextEditingController();
var searchPcontroller=TextEditingController();
//var catePcontroller=TextEditingController();

var formKey = GlobalKey<FormState>();
String? pName='';
String? value ;
final items=[
'Face','Eyes','Lips','Nails'
];

  List<Product>p=[
    Product(days1:12,days2:12,days3:12,expDate:'1-1-2022',category:'Face',amount: 3,price: 10,image:'assets/images/photo_2022-01-03_05-36-30.jpg', number:1, name:'LES BEIGES', description:'A unique, lightweight cream-gel face bronzer with a delicate velvet-matte finish that gives skin a sun-kissed glow.'),
    Product(days1:12,days2:12,days3:12,expDate:'1-1-2022',category:'Lips',amount: 3,price: 10,image:'assets/images/photo_2022-01-03_05-36-07.jpg', number:1, name:'ROUGE COCO BLOOM', description:'product A limited-edition set featuring 3 shades of ROUGE COCO BLOOM for lips with a spectacularly supple finish'),
    Product(days1:12,days2:12,days3:12,expDate:'1-1-2022',category:'Eyes',amount: 3,price: 10,image:'assets/images/photo_2022-01-03_05-47-56.jpg', number:3, name:'STYLO OMBRE ET CONTOUR', description:'productThis all-in-one eye pen features a longwearing formula and can be used as an eyeshadow, eyeliner or khôl for a variety of lasting eye looks.'),
    Product(days1:12,days2:12,days3:12,expDate:'1-1-2022',category:'Nails',amount: 3,price: 10,image:'assets/images/photo_2022-01-03_05-35-18.jpg', number:4, name:'LE VERNIS', description:'productA long-lasting nail colour in a range of shades for all seasons.'),

  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(

      length: 4,
      child: Scaffold(
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
                                 ),
           bottom:const TabBar(tabs: [
             Tab(text: 'Face',),
             Tab(text: 'Eyes',),
             Tab(text: 'Lips',),
             Tab(text: 'Nails',),
             
           ],
           
           indicatorColor: colLogText,
           unselectedLabelColor: Color.fromARGB(255, 207, 204, 204),
           ),  
           actions: [
             
             IconButton(
             onPressed: (){}, icon:const Icon(Icons.person,)),
              
              ],
           //actionsIconTheme: const IconThemeData.fallback(),

                 ),
         
        body:TabBarView(
          children: 
            [
              Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                 gradient: LinearGradient(
                   colors: [
                     backgr,
                     merge],
                     begin: Alignment.topCenter,
                     end:Alignment.bottomCenter,
                     ),
                ),
              child: Row(
                children: [
                  Container(color: merge,
                  width:300,height: double.infinity,
                  child:Column(
                    children: [
                      const SizedBox(height: 20,),
                      ElevatedButton(onPressed: ()async{
                       final pName =await openDialog();
                       
                       if(pName == null || pName.isEmpty)
                       {setState(() => this.pName=pName);}
                      }, child: const Text('Add a product'),
                      
                      ),
                      const SizedBox(height: 20,),
                      ElevatedButton(onPressed: ()async{
                       final pName =await openDialog1();
                       
                       if(pName == null || pName.isEmpty)
                       {setState(() => this.pName=pName);}
                      }, child: const Text('update a product'),
                      
                      ),
                      
                    ],
                  )),
                  
                      SingleChildScrollView(
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20,),
                        SizedBox(
               width:200,
               height:20,
               child: TextFormField(controller: searchPcontroller,
               decoration: const InputDecoration(label: Text('search'),icon:Icon(Icons.search) ),
               ),
             ),
                            FittedBox(
                              child: SizedBox(height:480,width: 1066,child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  'https://thumbs.dreamstime.com/b/make-up-essentials-set-professional-makeup-brushes-cosmetics-yellow-background-make-up-essentials-set-214635360.jpg',
                                 ))),
                            ),
                             //const SizedBox(height: 10,),
                              SizedBox(
                                width: 1066,
                                child: GridView.count(
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 0,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                crossAxisCount: 3,
                                childAspectRatio: 1/1.5,
                                  children: 
                                  
                                      List.generate(p.length,(index)=>ProductsBuilder(p[index]))
                                      
                                  
                                ),
                              ),
                          ],
                        ),
                      ),
                  
                ],
              ),
            ),
            /////////////////////////////////////////////////////////////////////////////////////
            ///
            ///
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                 gradient: LinearGradient(
                   colors: [
                     backgr,
                     merge],
                     begin: Alignment.topCenter,
                     end:Alignment.bottomCenter,
                     ),
                ),
              child: Row(
                children: [
                  Container(color: merge,//Color.fromARGB(255, 226, 224, 224),
                  width:300,height: double.infinity,child:Column(
                    children: [const SizedBox(height: 20,),
                      ElevatedButton(onPressed: ()async{
                       final pName =await openDialog();
                       
                       if(pName == null || pName.isEmpty)
                       {setState(() => this.pName=pName);}
                      }, child: const Text('Add a product'),
                      
                      ),
                      const SizedBox(height: 20,),
                      ElevatedButton(onPressed: ()async{
                       final pName =await openDialog1();
                       
                       if(pName == null || pName.isEmpty)
                       {setState(() => this.pName=pName);}
                      }, child: const Text('update a product'),
                      
                      ),
                      ],
                  )),
                  
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                         const SizedBox(height: 20,),
                        SizedBox(
               width:200,
               height:20,
               child: TextFormField(controller: searchPcontroller,
               decoration: const InputDecoration(label: Text('search'),icon:Icon(Icons.search) ),
               ),
             ),
                            FittedBox(
                              child: SizedBox(height:480,width: 1066,child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  'https://cdn.shopify.com/s/files/1/0338/5671/6845/files/pixi160_1600x.png?v=1599651872',
                                 ))),
                            ),
                             //const SizedBox(height: 10,),
                              SizedBox(
                                width: 1066,
                                child: GridView.count(
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 0,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                crossAxisCount: 3,
                                childAspectRatio: 1/1.5,
                                  children: 
                                  
                                      List.generate(p.length,(index)=>ProductsBuilder(p[index]))
                                      
                                  
                                ),
                              ),
                          ],
                        ),
                      ),
                  
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                 gradient: LinearGradient(
                   colors: [
                     backgr,
                     merge],
                     begin: Alignment.topCenter,
                     end:Alignment.bottomCenter,
                     ),
                ),
              child: Row(
                children: [
                  Container(color: merge,//Color.fromARGB(255, 226, 224, 224),
                  width:300,height: double.infinity,child:Column(
                    children: [const SizedBox(height: 20,),
                      ElevatedButton(onPressed: ()async{
                       final pName =await openDialog();
                       
                       if(pName == null || pName.isEmpty)
                       {setState(() => this.pName=pName);}
                      }, child: const Text('Add a product'),
                      
                      ),
                      const SizedBox(height: 20,),
                      ElevatedButton(onPressed: ()async{
                       final pName =await openDialog1();
                       
                       if(pName == null || pName.isEmpty)
                       {setState(() => this.pName=pName);}
                      }, child: const Text('update a product'),
                      
                      ),
                      ],
                  )),
                  
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                         const SizedBox(height: 20,),
                        SizedBox(
               width:200,
               height:20,
               child: TextFormField(controller: searchPcontroller,
               decoration: const InputDecoration(label: Text('search'),icon:Icon(Icons.search) ),
               ),
             ),
                            FittedBox(
                              child: SizedBox(height:480,width: 1066,child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  'https://cdn.shopify.com/s/files/1/0353/4798/8539/files/pink_moon_wellcare_7f2525a5-8d4b-4921-9053-6c8c0678631e.jpg?v=1624409576',
                                  
                                 ))),
                            ),
                             //const SizedBox(height: 10,),
                              SizedBox(
                                width: 1066,
                                child: GridView.count(
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 0,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                crossAxisCount: 3,
                                childAspectRatio: 1/1.5,
                                  children: 
                                  
                                      List.generate(p.length,(index)=>ProductsBuilder(p[index]))
                                      
                                  
                                ),
                              ),
                          ],
                        ),
                      ),
                  
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                 gradient: LinearGradient(
                   colors: [
                     backgr,
                     merge],
                     begin: Alignment.topCenter,
                     end:Alignment.bottomCenter,
                     ),
                ),
              child: Row(
                children: [
                  Container(color: merge,//Color.fromARGB(255, 226, 224, 224),
                  width:300,height: double.infinity,child:Column(
                    children: [const SizedBox(height: 20,),
                      ElevatedButton(onPressed: ()async{
                       final pName =await openDialog();
                       
                       if(pName == null || pName.isEmpty)
                       {setState(() => this.pName=pName);}
                      }, child: const Text('Add a product'),
                      
                      ),
                      const SizedBox(height: 20,),
                      ElevatedButton(onPressed: ()async{
                       final pName =await openDialog1();
                       
                       if(pName == null || pName.isEmpty)
                       {setState(() => this.pName=pName);}
                      }, child: const Text('update a product'),
                      
                      ),
                      ],
                  )),
                  
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                         const SizedBox(height: 20,),
                        SizedBox(
               width:200,
               height:20,
               child: TextFormField(controller: searchPcontroller,
               decoration: const InputDecoration(label: Text('search'),icon:Icon(Icons.search) ),
               ),
             ),
                            FittedBox(
                              child: SizedBox(height:480,width: 1066,child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  'https://cdn.shopify.com/s/files/1/0554/0344/6439/files/Banner_2_f2c75192-e9ea-4316-a909-6dafc89f1784_1600x.png?v=1616770179',
                                 ))),
                            ),
                             //const SizedBox(height: 10,),
                              SizedBox(
                                width: 1066,
                                child: GridView.count(
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 0,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                crossAxisCount: 3,
                                childAspectRatio: 1/1.5,
                                  children: 
                                  
                                      List.generate(p.length,(index)=>ProductsBuilder(p[index]))
                                      
                                  
                                ),
                              ),
                          ],
                        ),
                      ),
                  
                ],
              ),
            ),
            /////////////////////////////////////////////////////////////////////////////////////
          ],
        ),
      ),
   
    );
    


  }

    Future <String?>openDialog() => showDialog<String>(
      context: context, builder: (context)=>AlertDialog(
        title: const Text('Product info'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: namePcontroller,
              decoration: const InputDecoration(
                hintText:'Enter product name',
      
              ),
              onSubmitted: (_)=>submit(),
            ),
            const SizedBox(height:2),
            //DropdownButton(items: items, onChanged: onChanged)
           Row(
             children: [
               const Text('Category'),
               const SizedBox(height:10),
               DropdownButton<String>(
                 value: value,
                 items: items.map(buildMenuItem).toList(),
                  onChanged: (value)=>setState(()=>{this.value=value})),
             ],
           ),
             const SizedBox(height:2),
             ElevatedButton(child:const Text('Expiring date'),
             onPressed: (){
               showDatePicker(context: context,
                initialDate: DateTime.now(),
                 firstDate: DateTime.now(),
                  lastDate: DateTime(2030)).then((date){setState(() {
                    _dateTim=date;
                  });});
             }),
             const SizedBox(height:2),
             TextField(
              controller: picPcontroller,
              decoration: const InputDecoration(
                hintText:'Enter product image URL',
      
              ),
              onSubmitted: (_)=>submit(),
            ),
            const SizedBox(height:2),
             TextField(
              controller: phonenumPcontroller,
              decoration: const InputDecoration(
                hintText:'Enter phone number',
      
              ),
              onSubmitted: (_)=>submit(),
            ),
            const SizedBox(height:2),
             TextField(
              controller: amountPcontroller,
              decoration: const InputDecoration(
                hintText:'Enter product amount',
      
              ),
              onSubmitted: (_)=>submit(),
            ),
            const SizedBox(height:2),
             TextField(
              controller: pricePcontroller,
              decoration: const InputDecoration(
                hintText:'Enter product price',
      
              ),
              //onSubmitted: (_)=>submit(),
            ),
           
            const SizedBox(height:2),
             Row(
               children: [

                 SizedBox(
                   width: 80,
                   child: TextField(
                    controller: limdate1Pcontroller,
                    decoration: const InputDecoration(
                      hintText:'days limit',
      
                    ),
                    //onSubmitted: (_)=>submit(),
                            ),
                 ),
                 const SizedBox(width:10),
                 SizedBox(
                   width: 80,
                   child: TextField(
                    controller: dispercen1Pcontroller,
                    decoration: const InputDecoration(
                      hintText:'discount %',
      
                    ),
                    //onSubmitted: (_)=>submit(),
                            ),
                 ),  
               ],
             ),
                  
             Row(
               children: [

                 SizedBox(
                   width: 80,
                   child: TextField(
                    controller: limdate2Pcontroller,
                    decoration: const InputDecoration(
                      hintText:'days limit',
      
                    ),
                    //onSubmitted: (_)=>submit(),
                            ),
                 ),
                 const SizedBox(width:10),
                 SizedBox(
                   width: 80,
                   child: TextField(
                    controller: dispercen2Pcontroller,
                    decoration: const InputDecoration(
                      hintText:'discount %',
      
                    ),
                    //onSubmitted: (_)=>submit(),
                            ),
                 ),  
               ],
             ),
             
             Row(
               children: [

                 SizedBox(
                   width: 80,
                   child: TextField(
                    controller: limdate3Pcontroller,
                    decoration: const InputDecoration(
                      hintText:'days limit',
      
                    ),
                    //onSubmitted: (_)=>submit(),
                            ),
                 ),
                 const SizedBox(width:10),
                 SizedBox(
                   width: 80,
                   child: TextField(
                    controller: dispercen3Pcontroller,
                    decoration: const InputDecoration(
                      hintText:'discount %',
      
                    ),
                    //onSubmitted: (_)=>submit(),
                            ),
                 ),  
               ],
             ),
             
              

          ],
        ),
        
        actions: [
          TextButton(onPressed: submit, child: const Text('Submit'))
        ],
      )); 
     
     Future <String?>openDialog1() => showDialog<String>(
      context: context, builder: (context)=>AlertDialog(
        title: const Text('Product info'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: namePcontroller,
              decoration: const InputDecoration(
                hintText:'Enter product name',
      
              ),
              onSubmitted: (_)=>submit(),
            ),
            const SizedBox(height:2),
            //DropdownButton(items: items, onChanged: onChanged)
           Row(
             children: [
               const Text('Category'),
               const SizedBox(height:10),
               DropdownButton<String>(
                 value: value,
                 items: items.map(buildMenuItem).toList(),
                  onChanged: (value)=>setState(()=>{this.value=value})),
             ],
           ),
           
             const SizedBox(height:2),
             TextField(
              controller: picPcontroller,
              decoration: const InputDecoration(
                hintText:'Enter product image URL',
      
              ),
              onSubmitted: (_)=>submit(),
            ),
            const SizedBox(height:2),
             TextField(
              controller: phonenumPcontroller,
              decoration: const InputDecoration(
                hintText:'Enter phone number',
      
              ),
              onSubmitted: (_)=>submit(),
            ),
            const SizedBox(height:2),
             TextField(
              controller: amountPcontroller,
              decoration: const InputDecoration(
                hintText:'Enter product amount',
      
              ),
              onSubmitted: (_)=>submit(),
            ),
            const SizedBox(height:2),
             TextField(
              controller: pricePcontroller,
              decoration: const InputDecoration(
                hintText:'Enter product price',
      
              ),
              //onSubmitted: (_)=>submit(),
            ),
           
            const SizedBox(height:2),
             Row(
               children: [

                 SizedBox(
                   width: 80,
                   child: TextField(
                    controller: limdate1Pcontroller,
                    decoration: const InputDecoration(
                      hintText:'days limit',
      
                    ),
                    //onSubmitted: (_)=>submit(),
                            ),
                 ),
                 const SizedBox(width:10),
                 SizedBox(
                   width: 80,
                   child: TextField(
                    controller: dispercen1Pcontroller,
                    decoration: const InputDecoration(
                      hintText:'discount %',
      
                    ),
                    //onSubmitted: (_)=>submit(),
                            ),
                 ),  
               ],
             ),
                  
             Row(
               children: [

                 SizedBox(
                   width: 80,
                   child: TextField(
                    controller: limdate2Pcontroller,
                    decoration: const InputDecoration(
                      hintText:'days limit',
      
                    ),
                    //onSubmitted: (_)=>submit(),
                            ),
                 ),
                 const SizedBox(width:10),
                 SizedBox(
                   width: 80,
                   child: TextField(
                    controller: dispercen2Pcontroller,
                    decoration: const InputDecoration(
                      hintText:'discount %',
      
                    ),
                    //onSubmitted: (_)=>submit(),
                            ),
                 ),  
               ],
             ),
             
             Row(
               children: [

                 SizedBox(
                   width: 80,
                   child: TextField(
                    controller: limdate3Pcontroller,
                    decoration: const InputDecoration(
                      hintText:'days limit',
      
                    ),
                    //onSubmitted: (_)=>submit(),
                            ),
                 ),
                 const SizedBox(width:10),
                 SizedBox(
                   width: 80,
                   child: TextField(
                    controller: dispercen3Pcontroller,
                    decoration: const InputDecoration(
                      hintText:'discount %',
      
                    ),
                    //onSubmitted: (_)=>submit(),
                            ),
                 ),  
               ],
             ),
             
              

          ],
        ),
        
        actions: [
          TextButton(onPressed: submit, child: const Text('Submit'))
        ],
      )); 

      DropdownMenuItem<String> buildMenuItem(String item) =>
      DropdownMenuItem(value:item,child: Text(item));
      void submit(){
      
        Navigator.of(context).pop(namePcontroller.text,);
        namePcontroller.clear();
        picPcontroller.clear();
        phonenumPcontroller.clear();
        amountPcontroller.clear();
        pricePcontroller.clear();
      }


  // ignore: non_constant_identifier_names
  Widget ProductsBuilder(Product product)=>GestureDetector(
    onTap: (){
      setState(() {
        Navigator.push(context,MaterialPageRoute(
            builder:(context)=>ProductScreen(
              days1: product.days1,
              days2: product.days2,
              days3: product.days3,
              expDate: product.expDate,
              price: product.price,
              category: product.category,
              amount: product.amount,
              image:product.image,
                name:product.name,
                number:product.number,
                description:product.description)
        )
        );
      });
    },
    child: Column(
     
      children: [
        Image(
          image: AssetImage(product.image),
          height:350,
          width: 400,
          fit:BoxFit.cover,
        ),
        const SizedBox(height:10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            product.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style:const TextStyle(
              color: colLogText,
              
              fontSize: 20,
            ),
          ),
        ),
      ],
    ),
  );
}
