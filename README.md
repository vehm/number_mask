# number_mask

A minimalistic approach to helping developers more easily mask/format numeric fields without requiring new field widgets.

## Authors

-   [@vehm](https://www.github.com/vehm)

## Usage

The usage of NumberMask is very simple.

```dart
NumberMask(pattern: '###-###-####')
```

Simply put `#`'s in every position you want a number to go. The pattern can be anything you want, including letters and symbols - anything that can normally be input into a TextField or TextFormField. Input will automatically be masked to the pattern you have defined.\
\
For Example:

```dart
import 'package:number_mask/number_mask.dart';

...

TextFormField(
    controller: _phoneController,
    decoration: const InputDecoration(
        labelText: 'Phone Number*',
    ),
    keyboardType: TextInputType.phone,
    inputFormatters: [
        NumberMask(pattern: '###-###-#### Ext. ###'),
    ],
),
```

The above example will automatically mask user input to the pattern we have defined: i.e. `555-555-5555 Ext. 555`.\
\
If the pattern is not defined, it will default to a free-form (read: empty) pattern. This will allow only numeric input without a defined length.
