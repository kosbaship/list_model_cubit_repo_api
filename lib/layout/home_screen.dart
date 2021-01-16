import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_model_cubit_repo_api/layout/cubit/home_cubit.dart';
import 'package:list_model_cubit_repo_api/layout/cubit/home_states.dart';
import 'package:list_model_cubit_repo_api/shared/components.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var renderList = HomeCubit.get(context).cubitPosts;

        return ConditionalBuilder(
          condition: state is! HomeLoadingState,
          builder: (context) => ConditionalBuilder(
            condition: state is! HomeErrorState,
            builder: (context) => ListView.builder(
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
            ),
            fallback: (context) => Center(
                child: Text(
              "No data found .. !",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            )),
          ),
          fallback: (context) => Center(child: loadingDots()),
        );
      },
    );
  }
}
