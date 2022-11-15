import 'package:apipractice/api_service/all_api_service.dart';

import 'package:flutter/material.dart';

import 'MediaQuery/sizedata.dart';
import 'api_service/model.dart' as model;


void main()
{
  runApp(const MaterialApp(
    home: HomePage(),
  ));
}


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  TextEditingController a1=TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    SizeData(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff191A32),
        centerTitle: true,
        title: TextField(
          textAlign: TextAlign.justify,
          decoration: const InputDecoration(
            border: InputBorder.none,
            suffixIcon: Icon(Icons.search,color: Colors.white,),
            hintText: "Serch",
            hintStyle: TextStyle(color: Colors.grey,fontSize: 20)
          ),
          controller: a1,
        style: const TextStyle(color: Colors.white,fontSize: 20),
        ),

      ),

      body: FutureBuilder(
        future: getData1(),

        builder: (context,AsyncSnapshot<model.Welcome> snapshot) {
        if(snapshot.hasError){
          return const Center(child: Text("Data Not Found",style: TextStyle(color: Colors.amber),));
        }
        else if(snapshot.connectionState == ConnectionState.waiting)
          {
            return const Center(child: CircularProgressIndicator(),);
          }
        else
          {
            return ListView.builder(
              itemCount: snapshot.data!.events!.length,
              itemBuilder: (context, index) {
              return Card(
                child: Column(
                children: [
                   SizedBox(
                    height: SizeData.bdHeight! * 0.30,
                    width: double.infinity,
                    child: Card(
                      // color: Colors.amber,
                      child: Image.network("${snapshot.data!.events![index].performers![0].image}",fit: BoxFit.fitWidth,
                      errorBuilder: (context, error, stackTrace) {
                        return Center(child: Text("No Image Here",style:TextStyle(fontSize: 30),));
                      },),
                    ),
                  ),
                  SizedBox(
                      height: 70,
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:  [
                          Flexible(child: Text("Name:${snapshot.data!.events![index].title}",style: TextStyle(fontSize: 20),)),
                          Flexible(child: Text("SubTitle:${snapshot.data!.events![index].id.toString()}",style: TextStyle(fontSize: 17),)),
                        ],
                      ))
                ],
              ),);
            },);
          }
      },),
        backgroundColor: const Color(0xff191A32)
    );
  }
}
