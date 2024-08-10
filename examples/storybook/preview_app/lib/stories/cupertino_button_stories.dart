import 'package:flutter/cupertino.dart';
import 'package:storybook_dart/annotations.dart' as storybook;
import 'package:storybook_dart/storybook_dart.dart';

part 'cupertino_button_stories.g.dart';

@storybook.Meta(
  title: 'Cupertino/CupertinoButton',
)
class CupertinoButtonMeta extends Meta with _$CupertinoButtonMeta {
  @override
  Widget buildWidget(BuildContext context, List<Arg> args) {
    return CupertinoButton(
      child: const Text('Button'),
      onPressed: () {},
    );
  }
}

@storybook.Story('Default')
class CupertinoButtonDefaultStory extends StoryObj<CupertinoButtonMeta>
    with _$CupertinoButtonDefaultStory {}

@storybook.Story('Filled')
class CupertinoButtonfilledStory extends StoryObj<CupertinoButtonMeta>
    with _$CupertinoButtonfilledStory {
  @override
  Widget build(BuildContext context, List<Arg> args) {
    return CupertinoButton.filled(
      child: const Text('Button'),
      onPressed: () {},
    );
  }
}
