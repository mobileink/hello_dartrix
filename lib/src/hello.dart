import 'dart:isolate';

void handleDart(List<String> args, SendPort dartrixPort) async {
  dartrixPort.send({
    'lang': 'dart',
    'dartrix': {'mergeData': true}
  }); //  await generateFromBuiltin();
}
