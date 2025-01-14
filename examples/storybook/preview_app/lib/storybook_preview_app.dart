import 'package:flutter/widgets.dart';
import 'package:preview_app/storybook_config.g.dart';
import 'package:storybook_dart/annotations.dart' as storybook;
import 'package:storybook_dart/storybook_dart.dart';

part 'storybook_preview_app.g.dart';

@storybook.StorybookPreviewer()
class StorybookPreviewApp extends StatelessWidget with _$StorybookPreviewApp {
  const StorybookPreviewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StorybookDefaultPreviewer(
      storybookConfig,
    );
  }
}
