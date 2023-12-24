import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:storybook_dart_annotation/storybook_dart_annotation.dart';
import 'package:storybook_dart_generator/src/utils/resolve_storybook_previewer_info.dart';

class StorybookPreviewerGenerator
    extends GeneratorForAnnotation<StorybookPreviewer> {
  const StorybookPreviewerGenerator();

  @override
  generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final previewerInfo = resolveStorybookPreviewerInfo(element, annotation);

    return '''
mixin _\$${previewerInfo.className} on StorybookPreviewer {
  @override
  StorybookConfig get config => storybookConfig;
}
''';
  }
}
