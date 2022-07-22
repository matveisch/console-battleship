import 'dart:io';

void main() {
  stdout.writeln('What is your name?');
  String? name = stdin.readLineSync();

  stdout.writeln('How old are you?');
  var age = stdin.readByteSync();

  print('Nice to meet you $name, you are $age years old');
}
