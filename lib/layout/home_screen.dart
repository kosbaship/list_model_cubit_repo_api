import 'package:flutter/material.dart';
import 'package:list_model_cubit_repo_api/data/models/post_model.dart';
import 'package:list_model_cubit_repo_api/shared/components.dart';

// layout screen
class HomeScreen extends StatelessWidget {
  List<PostModel> renderList = List<PostModel>();

  @override
  Widget build(BuildContext context) {
    // create list

    return renderList.length != 0
        ? ListView.builder(
            // modify the list length
            itemCount: renderList.length,
            itemBuilder: (BuildContext context, int index) {
              // this list to get post by index
              var post = renderList[index];
              // this is the list item representation out design
              return Card(
                elevation: 8,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    // this a good structure for a list item
                    child: ListTile(
                      // one
                      leading: defaultText(
                        title: "${post.id}",
                        fontFamily: "Pacifico",
                        fontWeight: FontWeight.normal,
                      ),
                      //two
                      title: defaultText(
                        title: post.title ?? "title",
                        fontFamily: "Pacifico",
                        fontWeight: FontWeight.normal,
                      ),
                      //three
                      subtitle: defaultText(
                        title: post.body ?? "body or message",
                      ),
                    )),
              );
            },
          )
        : Center(child: loadingDots());
  }
}
