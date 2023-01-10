import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

final Logger logging = Logger('vn.safin.mysafin');

void initLogger() {
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((LogRecord record) {
    debugPrint('${record.level.name}: ${record.time}: ${record.message}');
  });
}
