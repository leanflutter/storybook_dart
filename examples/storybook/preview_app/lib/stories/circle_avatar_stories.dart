import 'package:flutter/material.dart';
import 'package:storybook_dart/annotations.dart' as storybook;
import 'package:storybook_dart/storybook_dart.dart';

part 'circle_avatar_stories.g.dart';

@storybook.Meta(
  title: 'Material/CircleAvatar',
)
class CircleAvatarMeta extends Meta with _$CircleAvatarMeta {
  @override
  Widget buildWidget(BuildContext context, List<Arg> args) {
    return const CircleAvatar(
      child: Text('A'),
    );
  }
}

@storybook.Story('Default')
class CircleAvatarDefaultStory extends StoryObj<CircleAvatarMeta>
    with _$CircleAvatarDefaultStory {}
