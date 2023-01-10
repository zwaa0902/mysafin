import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

mixin LoggerPresenter {
  final Logger logger = Logger(
    printer: PrettyPrinter(),
  );
}
