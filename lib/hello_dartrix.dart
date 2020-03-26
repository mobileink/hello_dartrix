import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

import 'package:timeago/timeago.dart';

import 'package:args/args.dart';

import 'src/goodbye.dart';
import 'src/hello.dart';

SendPort dartrixPort;

String _resolvePkg(String pkg) {

}

void _generate(String template, Map data) async {
  print("_generating files");

  // String pkg = "package:hello_template/new.dart";
  // var resource = new Resource(pkg);
  // print("dep uri: ${resource.uri}");

  // // var inDir = Directory.fromUri(Uri.parse("package:hello_template/"));
  // var outDir = Directory(template);

  // String filePfx = _resolvePkg("hello_template");

  dartrixPort.send("ready to gen");
  // dartrixPort.send(data);
  print("done sending");
}

void printUsage() {
  print("\n\t\tDartrix Template package: hello_templates\n");
  print("Available templates:\n");
  print("\thello");
  print("\tgoodbye\n");
  print("Pass -h to see template doc, e.g. -t hello -h\n");
}

void main(List<String> args, SendPort sport) {
  // print("Plugin entrypoint: hello_dartrix.dart:main($args)");
  if (args.contains('-v') || args.contains('--verbose')) {
    print("Plugin entrypoint: hello_dartrix.dart:main($args)");
  }

  final fifteenAgo = new DateTime.now().subtract(new Duration(minutes: 15));

  // print("entry: hello_template/dartrix.dart:main");
  dartrixPort = sport;

  // print("args: $args");
  // First arg is the template name.
  // print("template: ${args[0]}");

  switch(args[0]) {
    case "dart": handleDart(args, sport); break;
    case "java":
    dartrixPort.send({
        'lang': 'java',
        'dartrix': {'mergeData': true}
    }); //  await generateFromBuiltin();
    break;
    case null:
    if (args.contains("--help") || args.contains("-h")) {
      printUsage();
    } else {
      print("hello_template: No template specified; canceling.");
    }
    break;
    default:
    // print("No template for ${args[0]}; canceling.");
    dartrixPort.send({
        'lang': args[0],
        'dartrix': {'mergeData': true}
    }); //  await generateFromBuiltin();
  }
  // print("exiting main...");
}
