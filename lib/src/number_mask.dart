import 'package:flutter/services.dart';

import 'package:number_mask/src/utilities/utilities.dart';

/// [pattern] is used to define the format for the input.
/// The character '#' is used to indicate where the numbers will be inserted.
/// The [pattern] can contain any other character that would normally be allowed.
/// The output will have all characters inserted in the same position as in the [pattern].
/// The default value is an empty string, so the input will not be formatted unless a [pattern] is defined.
///
/// Example Input/Output:
///   pattern: '###.###.###-#'
///   input: '1234567890'
///   output: '123.456.789-0'
///
/// Example Input/Output:
///   pattern: '##/##/####'
///   input: '1234567890'
///   output: '12/34/5678'
///
/// Example Usage:
///   TextField(
///     inputFormatters: [NumberMask(pattern: '###-###-#### Ext. ###')],
///   )
class NumberMask extends TextInputFormatter {
  final String pattern;
  NumberMask({this.pattern = ''});

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final newText = StringBuffer();

    var sanitized = sanitize(newValue.text);

    if (pattern.isEmpty) {
      return TextEditingValue(
        text: sanitized,
        selection: TextSelection.collapsed(offset: sanitized.length),
      );
    }

    var relativeIndex = nthIndex(pattern, '#', sanitized.length);
    var nextIndex = relativeIndex + 1;

    if (relativeIndex == -1 && sanitized.isNotEmpty) {
      return oldValue;
    }

    var trimmedFormat = pattern.substring(0, nextIndex);
    var index = 0;

    for (var i = 0; i < trimmedFormat.length; i++) {
      if (trimmedFormat[i] == '#') {
        if (index < sanitized.length) {
          newText.write(sanitized[index]);
          index++;
        }
      } else {
        newText.write(trimmedFormat[i]);
      }
    }

    var relativeOffset = (newValue.selection.baseOffset +
        (newText.length - newValue.text.length));
    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(
        offset: relativeOffset,
      ),
    );
  }

  String sanitize(String text) {
    return text.replaceAll(RegExp(r'[^0-9]+'), '');
  }
}
