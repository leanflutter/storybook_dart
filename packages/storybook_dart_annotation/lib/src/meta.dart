import 'package:storybook_dart_annotation/src/arg_type.dart';

class Meta {
  const Meta({
    this.title,
    this.argTypes = const [],
  });

  final String? title;
  final List<ArgType>? argTypes;
}
