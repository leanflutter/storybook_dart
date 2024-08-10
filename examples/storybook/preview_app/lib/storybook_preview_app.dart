import 'package:preview_app/storybook_config.g.dart';
import 'package:storybook_dart/annotations.dart' as storybook;
import 'package:storybook_dart/storybook_dart.dart';

part 'storybook_preview_app.g.dart';

@storybook.StorybookPreviewer()
class StorybookPreviewApp extends StorybookPreviewer
    with _$StorybookPreviewApp {
  const StorybookPreviewApp({super.key});
}
