import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:storybook_dart/storybook_dart.dart';

class StorybookDefaultPreviewer extends StatelessWidget {
  const StorybookDefaultPreviewer(
    this.config, {
    super.key,
  });

  final StorybookConfig config;

  ThemeData get theme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    );
  }

  Widget _buildHomePage(BuildContext context) {
    final storyId = Uri.base.queryParameters['id'];
    final story = config.stories.firstWhereOrNull((e) => e.id == storyId);

    if (storyId == null) {
      return Scaffold(
        body: ListView(
          children: config.stories.map((story) {
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
              return const Text('Not found');
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
      theme: theme,
      home: _buildHomePage(context),
    );
  }
}
