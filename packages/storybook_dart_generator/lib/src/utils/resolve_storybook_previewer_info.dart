import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:storybook_dart_generator/src/storybook_previewer_info.dart';

StorybookPreviewerInfo resolveStorybookPreviewerInfo(
  Element element,
  ConstantReader annotation, {
  AssetId? assetId,
}) {
  final String className = (element as ClassElement).name;
  return StorybookPreviewerInfo(
    className: className,
    assetId: assetId,
  );
}
