
import 'package:freezed_annotation/freezed_annotation.dart';

part 'person.freezed.dart';

@freezed
class Person with _$Person {
  factory Person({String? name, int? age}) = _Person;
}

void main() {
  var person = Person(name: 'Gustavo', age: 25);

  print(person.name);
  print(person.age);

  print(person.toString());
}