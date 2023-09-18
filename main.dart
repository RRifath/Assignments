//Padding is used for creating border to all sites
//Creating a Form
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeActivity()
    );
  }
}

class HomeActivity extends StatelessWidget{
  HomeActivity({super.key});

  var MyItems=[
    {"img":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMCHhaqx6DY8VWLROmjGZFdxE3tf4hrxqidA&usqp=CAU","title":"Lion"},
    {"img":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2I6V3XVMJQa4Jo_lNt129ZRSKhWTwttqJCw&usqp=CAU","title":"Birds"},
    {"img":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjJ5XQcRqPTVoi3R05Q4UVQQPCrdh7MCgxbA&usqp=CAU","title":"Flowers"},
    {"img":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5K55TOHO-GOl6XTYyksFJkj0iyBrBE4ov8g&usqp=CAU","title":"Flying Man"},
    {"img":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSiB6ZlU9acgBqUARcfku8j7CeL7lASoYKGGw&usqp=CAU","title":"Woman"},
    {"img":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5LL3IcidnkmpVbjmmL93gsmv-pIlTpMXNVQ&usqp=CAU","title":"Love"},
  ];

  MySnackBar(message,context) {
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message))
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Photo Gallery"),
      ),
      body:
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Text(
                'Welcome to My Photo Gallery!',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(10), child: TextField(decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Search for photos...'),),),
          new Expanded(child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 1
            ),
            itemCount: MyItems.length,
            itemBuilder: (context,index){
              return GestureDetector(
                onTap: (){MySnackBar(MyItems[index]['title'], context);},
                child: Container(
                  margin: EdgeInsets.all(10),
                  width: 100,
                  height: 200,
                  child: Image.network(MyItems[index]['img']!, fit: BoxFit.fill),
                ),
              );
            },
          ),
          ),
        ],
      )
    );
  }
}