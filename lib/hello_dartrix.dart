import 'dart:isolate';

// This is not used; it's only here to satisfy pub.dev
void main(List<String> args, SendPort sPort) {
  sPort.send({});
}
