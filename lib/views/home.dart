import 'package:flutter/material.dart';

import 'package:instgram/models/post.dart';

import '../services/remote_serives.dart';

class MyHomePage extends StatefulWidget{

  const MyHomePage({Key? key}):super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  List<Post>? posts;
  var isLoaded = false;

  @override
  void initState(){
    super.initState();

    //fetch data from api
    getData();

  }

  getData() async{
    posts=await RemoteSerives().getPosts("");
    if(posts!=null){
      setState(() {
        isLoaded=true;

        var post= posts?.length;
        print(" sucessfully");
      });
    }
  }





  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: const Text('Instagram'),
     ),

     body: Column(
       children: [

         //stories of the useres
         Container(
           height: 90,
           child: Column(


             children: [


               Expanded(

                 child: ListView.builder(

                   scrollDirection: Axis.horizontal,
                     itemCount: posts?.length,
                     itemBuilder: (context,index)
                     {
                   return Container(
                     padding: EdgeInsets.all(3),

                     child: Column(

                       children: [
                         ClipRRect(
                           borderRadius: BorderRadius.circular(200),

                           child: Image(
                             image: NetworkImage(posts![index].body),
                             height: 70,
                             width: 70,
                           ),
                         ),

                         SizedBox(width: 16),


                         Expanded(
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [

                               Text(
                                 posts![index].title,
                                 maxLines: 2,
                                 style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                             ],
                           ),
                         ),
                       ],
                     ),
                   );

                 }),
               ),


             ],

           ),
         ),
         Container(

             child: Text("Latest Feeds",style: TextStyle(color: Colors.pink,fontSize: 18),)
         ),
        //**************************************************************************
         // posts of the users
         //*************************************************************************
         Expanded(

           child: ListView.builder(


               itemCount: posts?.length,
               itemBuilder: (context,index)

               {
                 return Container(

                   padding: EdgeInsets.all(15.0),
                   decoration: BoxDecoration(
                     border: Border.all(color: Colors.black45),
                     borderRadius: BorderRadius.circular(8.0),
                   ),


                   child: Column(


                     children: [


                       Container(
                         decoration: BoxDecoration(
                           border: Border.all(color: Colors.black45),
                           borderRadius: BorderRadius.circular(8.0),
                         ),
                         child: Row(


                           children: [
                             ClipRRect(
                               borderRadius: BorderRadius.circular(200),


                               child: Image(
                                 image: NetworkImage(posts![index].body),
                                 height: 30,
                                 width: 30,
                               ),
                             ),
                             Text(
                               "   ",
                               maxLines: 2,
                               style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                             Text(
                               posts![index].title,
                               maxLines: 2,
                               style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),



                             SizedBox(width: 16),

                           ],
                         ),
                       ),
                       Container(
                         decoration: BoxDecoration(
                           border: Border.all(color: Colors.black45),
                           borderRadius: BorderRadius.circular(15.0),
                         ),
                         child: ClipRRect(

                           child: Image(
                             image: NetworkImage(posts![index].body),
                             height: 200,
                             width: 200,
                           ),
                         ),
                       ),
                       Container(


                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,


                           children: [
                             Text(
                               "Link",
                               maxLines: 2,

                               style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                             Text(
                               posts![index].body,
                               maxLines: 2,
                               style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),

                           ],
                         ),
                       ),


                     ],
                   ),
                 );

               }),
         ),

       ],
     ),


   );
  }

}
