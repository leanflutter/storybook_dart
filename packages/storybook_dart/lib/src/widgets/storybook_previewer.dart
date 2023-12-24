import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:storybook_dart/storybook_dart.dart';

class StorybookPreviewer extends StatelessWidget {
  const StorybookPreviewer({Key? key}) : super(key: key);

  StorybookConfig get config => throw UnimplementedError();

  List<StoryObj> get stories => config.stories;

  Widget _buildHomePage(BuildContext context) {
    final storyId = Uri.base.queryParameters['id'];
    final story = stories.firstWhereOrNull((e) => e.id == storyId);

    if (storyId == null) {
      return Scaffold(
        body: ListView(
          children: stories.map((story) {
            return ListTile(
              title: Text(story.meta.title),
              subtitle: SelectableText(story.id),
            );
          }).toList(),
        ),
      );
    }

    return Scaffold(
      body: Center(
        child: Builder(
          builder: (context) {
            if (story == null) {
              return Text('Not found');
            }
            return story.build(context, []);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StorybookPreviewer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: _buildHomePage(context),
    );
  }
}
