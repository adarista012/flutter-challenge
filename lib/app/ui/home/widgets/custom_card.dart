import 'package:flutter/material.dart';
import 'package:fullstack_challenge/app/domain/models/article.dart';
import 'package:get/get.dart';

Widget customCard(BuildContext context, Article article) => Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: MaterialButton(
        onPressed: () {},
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Card(
          margin: EdgeInsets.zero,
          child: ListTile(
            leading: Container(
              alignment: Alignment.center,
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainer,
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: Text(
                '${article.title.split("")[0].toUpperCase()}${article.author.split("")[0].toUpperCase()}',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ),
            title: Text(
              article.title.capitalizeFirst!,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.author.capitalizeFirst!,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 10.0,
                        fontWeight: FontWeight.w300,
                      ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  height: 20,
                  child: Text(
                    article.content.capitalizeFirst!,
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          fontWeight: FontWeight.w300,
                        ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
