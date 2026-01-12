import 'package:flutter/foundation.dart';

extension StringExtenxion on String {
  String get coreFolder => kIsWeb?"": "assets/";
  String get png => '${coreFolder}images/$this.png';
  String get jpg => '${coreFolder}images/$this.jpg';
  String get json => '${coreFolder}language/$this.json';
  String get svg => '${coreFolder}icons/$this.svg';
}