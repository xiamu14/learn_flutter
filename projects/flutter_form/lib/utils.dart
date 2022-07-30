import 'package:flutter/foundation.dart';

printDebug(String txt) {
  if (kDebugMode) {
    print(txt);
  }
}
