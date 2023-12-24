import 'package:storybook_dart/storybook_dart.dart';

import 'package:preview_app/stories/badge_stories.dart';
import 'package:preview_app/stories/cupertino_button_stories.dart';
import 'package:preview_app/stories/circle_avatar_stories.dart';

final StorybookConfig storybookConfig = StorybookConfig(
  stories: [
    BadgeDefaultStory(),
    CupertinoButtonDefaultStory(),
    CupertinoButtonfilledStory(),
    CircleAvatarDefaultStory(),
  ],
);
