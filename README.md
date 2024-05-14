# ad_utils

A Flutter Widget to easily show Native Ad or any other Widget in between a GridView.


## Features

- Seamlessly integrate Native Advertisements into your GridView with a few simple clicks.
- Effortlessly incorporate any Widget of your choice into your GridView.
- Add Widgets to your GridView layout effortlessly, whether it's a single instance or multiple instances with just a few straightforward steps.

## Getting started

To use this package, add ad_gridview as a dependency in your pubspec.yaml file.
```
dependencies:
  ...
  ad_utils: <latest_version>
```
In your library add the following import:
```
import 'package:ad_utils/ad_utils.dart';
```
## Usage

```dart
    AdUtils(crossAxisCount: crossAxisCount,
itemCount: itemCount,
adIndex: adIndex,
adWidget: adWidget,
itemWidget: itemWidget)
```

## **Types**

<table>
   <tr>
      <td align="center">
         <img src="https://github.com/aakashx58/ad_utils/assets/106716824/e4a5a1c1-b5e9-43c4-b89c-8e2130679fa5" width="100%" height="450px" />
         <br>
         Once
      </td>
      <td align="center">
         <img src="https://github.com/aakashx58/ad_utils/assets/106716824/40991f26-2967-4490-b587-538713b7cbff" width="100%" height="450px" />
         <br>
         Repeated
      </td>
      <td align="center">
         <img src="https://github.com/aakashx58/ad_utils/assets/106716824/68aca2de-ea20-48ab-96c5-9dd7b347e663" width="100%" height="450px" />
         <br>
         Custom
      </td>
   </tr>
</table>
