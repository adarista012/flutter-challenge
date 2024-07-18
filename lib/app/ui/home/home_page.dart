import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fullstack_challenge/app/ui/home/home_controller.dart';
import 'package:fullstack_challenge/app/ui/home/widgets/custom_card.dart';
import 'package:fullstack_challenge/app/ui/widgets/gap.dart';
import 'package:fullstack_challenge/app/ui/widgets/loader.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeController(),
      builder: (controller) {
        final articles = controller.article;
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'FullStack Challenge',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          body: RefreshIndicator(
            onRefresh: controller.fetchArticles,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: controller.isLoading
                    ? loader()
                    : articles == null
                        ? const Text('Fetching error')
                        : ListView.builder(
                            itemCount: articles.length,
                            itemBuilder: (context, index) {
                              return customCard(context, articles[index]);
                            },
                          ),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.bottomSheet(
                BottomSheet(
                  onClosing: controller.resetTextControllers,
                  builder: (context) {
                    return Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16.0),
                          topRight: Radius.circular(16.0),
                        ),
                      ),
                      child: Column(
                        children: [
                          gap(height: 16.0),
                          CupertinoTextField(
                            controller: controller.titleTextController,
                            onChanged: controller.onChangeTitle,
                            placeholder: 'Title',
                          ),
                          gap(height: 8.0),
                          CupertinoTextField(
                            controller: controller.authorTextController,
                            onChanged: controller.onChangeAuthor,
                            placeholder: 'Author',
                          ),
                          gap(height: 8.0),
                          CupertinoTextField(
                            controller: controller.contentTextController,
                            expands: true,
                            onChanged: controller.onChangeContent,
                            maxLines: null,
                            placeholder: 'Content',
                          ),
                          gap(height: 16.0),
                          MaterialButton(
                            onPressed: () {
                              controller.addArticle();
                            },
                            color:
                                Theme.of(context).colorScheme.surfaceContainer,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            minWidth: double.infinity,
                            child: const Text('Add Article'),
                          )
                        ],
                      ),
                    );
                  },
                ),
              );
            },
            child: const Center(
              child: Text("new", textAlign: TextAlign.center),
            ),
          ),
          floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        );
      },
    );
  }
}
