import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_model_cubit_repo_api/data/models/post_model.dart';
import 'package:list_model_cubit_repo_api/layout/cubit/home_cubit.dart';
import 'package:list_model_cubit_repo_api/layout/cubit/home_states.dart';
import 'package:list_model_cubit_repo_api/shared/components.dart';

// layout screen
class HomeScreen extends StatelessWidget {
  List<PostModel> renderList = List<PostModel>();

  @override
  Widget build(BuildContext context) {
    // cubit -> api_provider -> fetchData()
    // this what this line do
    HomeCubit.get(context).fetchData();

    // create list
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) async {
        //====================================
        if (state is HomeLoadingState) {
          print(
              "=================  show alert when loading ======================");
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              backgroundColor: Colors.teal,
              content: loadingDots(),
            ),
          );
        }
        if (state is HomeSuccessState) {
          // save the Cubit list in the UI list
          if (renderList.length == 0) {
            renderList = HomeCubit.get(context).cubitPosts;
            Navigator.pop(context);
          }
          print("=================  congrats here is your data");
        }
        //====================================
      },
      builder: (context, state) {
        return ListView.builder(
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
        );
      },
    );
  }
}
