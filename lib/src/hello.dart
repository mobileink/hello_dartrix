import 'dart:io';
import 'dart:isolate';

import 'package:args/args.dart';

void handleDart(List<String> args, SendPort dartrixPort) async {
  dartrixPort.send({
      'lang': 'dart',
      'dartrix': {'mergeData': true}
  }); //  await generateFromBuiltin();
}

