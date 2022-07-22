import 'dart:io';

void main() {
  stdout.writeln('What is your name?');
  String? name = stdin.readLineSync();

  stdout.writeln('How old are you?');
  int age = stdin.readLineSync();

  print('Nice to meet you $name');
}
