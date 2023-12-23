import 'package:flutter/material.dart';
import 'package:storybook_dart/storybook_dart.dart';
import 'package:storybook_dart_annotation/storybook_dart_annotation.dart'
    as storybook;

part 'badge_stories.g.dart';

@storybook.Meta(
  title: 'Material/Badge',
  argTypes: [
    storybook.ArgType<String>(
      'label',
      defaultValue: 'Badge',
    ),
  ],
)
class BadgeMeta extends Meta with _$BadgeMeta {
  @override
  Widget buildWidget(BuildContext context, List<Arg> args) {
    return const Badge(
      child: Text('Badge'),
    );
  }
}

@storybook.Story('Default')
class BadgeDefaultStory extends StoryObj<BadgeMeta> with _$BadgeDefaultStory {}
