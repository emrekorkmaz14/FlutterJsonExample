import 'package:flutter/material.dart';
import 'package:json_place_holder/model/model.dart';
import 'package:json_place_holder/pages/comment_page.dart';
import 'package:json_place_holder/service/service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post>? posts;
  bool isLoaded = false;
  Color comp = Colors.green;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    posts = await RemoteService().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isLoaded,
      child: ListView.builder(
        itemCount: posts?.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.003,
                horizontal: MediaQuery.of(context).size.width * 0.002),
            child: InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => 
                           CommentPage(comment: posts![index].body,mail: posts![index].email,name: posts![index].name,)));
              },
              child: ListTile(
                title: Text(posts![index].email),
                subtitle: Text(posts![index].name.toString()),
                leading:  CircleAvatar(child: Icon(Icons.person),backgroundColor: Colors.blue.shade900,),
                
              ),
            ),
          );
        },
      ),
      replacement: const Center(child: CircularProgressIndicator()),
    );
  }
}
