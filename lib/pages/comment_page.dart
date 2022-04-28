import 'package:flutter/material.dart';
import 'package:json_place_holder/model/model.dart';
import 'package:json_place_holder/pages/home_page.dart';
import 'package:json_place_holder/service/service.dart';

class CommentPage extends StatefulWidget {
  const CommentPage(
      {Key? key, required this.comment, required this.name, required this.mail})
      : super(key: key);
  final String comment;

  final String name;
  final String mail;

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  List<Post>? posts;
  bool isLoaded = false;
  Color comp = Colors.green;

  getData() async {
    posts = await RemoteService().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        title: Text("Comment",style: TextStyle(color: Colors.black),),
        foregroundColor: Colors.black,
      ),
      body: Visibility(
        visible: isLoaded,
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(color: Colors.blue.shade200,borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  ListTile(
                    title: Text(widget.name,style: TextStyle(color: Colors.black),),
                    subtitle: Text(widget.mail),
                    leading: CircleAvatar(child: Icon(Icons.person),backgroundColor: Colors.blue.shade900),
                  ),
                  Divider(
                    thickness: 3,
                    color: Colors.black,
                  ),
                  Text(
                    widget.comment,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              )),
        ),
        replacement: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
