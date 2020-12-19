import 'package:flutter/material.dart';
import 'package:list_model_cubit_repo_api/shared/components.dart';

// layout screen
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // create list
    return ListView.builder(
      // modify the list length
      itemCount: null ?? 6,
      itemBuilder: (BuildContext context, int index) {
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
                  title: "id",
                  fontFamily: "Pacifico",
                  fontWeight: FontWeight.normal,
                ),
                //two
                title: defaultText(
                  title: "title",
                  fontFamily: "Pacifico",
                  fontWeight: FontWeight.normal,
                ),
                //three
                subtitle: defaultText(
                  title: "body or message",
                ),
              )),
        );
      },
    );
  }
}
