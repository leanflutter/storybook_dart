import 'dart:async';

import 'package:build/build.dart';
import 'package:glob/glob.dart';
import 'package:source_gen/source_gen.dart';
import 'package:storybook_dart_annotation/storybook_dart_annotation.dart';
import 'package:storybook_dart_generator/src/story_info.dart';
import 'package:storybook_dart_generator/src/utils/resolve_story_info.dart';

class StorybookConfigBuilder extends Builder {
  TypeChecker get typeChecker => const TypeChecker.fromRuntime(Story);

  String _buildImports(List<StoryInfo> stories) {
    final Set<String> imports = {};
    for (final story in stories) {
      imports.add('import \'${story.assetId!.uri}\';');
    }
    return imports.join('\n');
  }

  String _buildStories(List<StoryInfo> stories) {
    return stories.map((e) => '    ${e.className}(),').join('\n');
  }

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final List<StoryInfo> stories = [];

    final inputFiles = Glob('lib/**');

    await for (final input in buildStep.findAssets(inputFiles)) {
      final library = LibraryReader(await buildStep.resolver.libraryFor(input));
      for (final annotatedElement in library.annotatedWith(typeChecker)) {
        stories.add(
          resolveStoryInfo(
            annotatedElement.element,
            annotatedElement.annotation,
            assetId: input,
          ),
        );
      }
    }

    final outputId = AssetId(
      buildStep.inputId.package,
      'lib/storybook_config.g.dart',
    );

    final sortedStories = stories.toList()
      ..sort((a, b) => a.assetId!.path.compareTo(b.assetId!.path));

    final contents = '''
${_buildImports(sortedStories)}
import 'package:storybook_dart/storybook_dart.dart';

final StorybookConfig \$generatedStorybookConfig = StorybookConfig(
  stories: [
${_buildStories(sortedStories)}
  ],
);
''';
    await buildStep.writeAsString(outputId, contents);
  }

  @override
  Map<String, List<String>> get buildExtensions {
    return {
      'lib/\$lib\$': ['lib/storybook_config.g.dart'],
    };
  }
}
