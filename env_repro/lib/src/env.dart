import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  final String message;

  EnvConfig._({required this.message});

  factory EnvConfig.create() {
    const b64env = String.fromEnvironment('ENV');
    final dotEnv = DotEnv();
    dotEnv.testLoad(fileInput: b64env.fromBase64());
    return EnvConfig._(message: dotEnv.get('MESSAGE'));
  }
}

extension on String {
  String fromBase64() {
    return utf8.decode(base64.decode(this));
  }
}
