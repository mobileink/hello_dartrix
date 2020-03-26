import 'dart:io';
import 'dart:isolate';
import 'package:args/args.dart';

void handleGoodbye(List<String> args, SendPort dartrixPort) {
  var argParser = ArgParser();
  argParser.addOption(
    'salutation',
    abbr: 's',
    valueHelp: "String",
    help: "E.g. Dear, 'O People!' etc.",
    defaultsTo: 'Dear',
  );
  argParser.addOption(
    'greeting',
    abbr: 'g',
    valueHelp: "String",
    help: "E.g. 'So long', Farewell, etc.",
    defaultsTo: 'Goodbye',
  );
  argParser.addOption(
    'to',
    abbr: 't',
    valueHelp: "String",
    help: "Addressee, e.g. World, Monde, Everybody.",
    defaultsTo: 'World',
  );
  argParser.addOption(
    'closing',
    abbr: 'c',
    valueHelp: "String",
    help: "E.g. Sincerely, 'Best wishes', etc.",
    defaultsTo: 'Sincerely',
  );
  argParser.addOption(
    'from',
    abbr: 'f',
    valueHelp: "String",
    help: "Greeter, e.g. Computer, Paris, the Void, etc.",
    defaultsTo: 'Computer',
  );
  argParser.addFlag('help', abbr: 'h', defaultsTo: false);

  ArgResults options = argParser.parse(args);

  if (options['help']) {
    print("\nDartrix package:hello_template, template: goodbye\n");
    print("Arguments:\n");
    print(argParser.usage);
    exit(0); // exit Isolate, not pgm?
  }

  var mydata = {
    'salutation': options['salutation'],
    'greeting': options['greeting'],
    'to': options['to'],
    'closing': options['closing'],
    'from': options['from'],
    'description': {'goodbye': "A Goodbye World demo."},
    'dartrix': {'mergeData': true}
  };

  dartrixPort.send(mydata);
}
