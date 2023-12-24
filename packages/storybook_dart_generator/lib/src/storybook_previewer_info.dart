import 'package:build/build.dart';

class StorybookPreviewerInfo {
  const StorybookPreviewerInfo({
    required this.className,
    required this.assetId,
  });

  final String className;
  final AssetId? assetId;
}
