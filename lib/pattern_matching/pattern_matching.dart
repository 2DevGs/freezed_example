import 'package:freezed_annotation/freezed_annotation.dart';
part 'pattern_matching.freezed.dart';

@freezed
class Union with _$Union {
  factory Union(int value) = UnionData;
  factory Union.loading() = UnionLoading;
  factory Union.error([String? message]) = UnionError;
}

void main() {
  var union = Union.loading();

  /*
    when
    maybeWhen
    map
    maybaMap
  */

  var mensagem = union.when<String>(
    (value) => 'Union Data implementado', 
    loading: () => 'Loading implementado', 
    error: (String? message) => 'Erro implementado',
  );
  print(mensagem);

  var mensagemMaybe = union.maybeWhen(
    null,
    error: (String? message) => 'Error implementado',
    orElse: () => 'Padrão implementado'
  );
  print(mensagemMaybe);

  var mensagemMap = union.map(
    (UnionData value) => '${value.runtimeType} implementado', 
    loading: (UnionLoading loading) => '${loading.runtimeType} implementado', 
    error: (UnionError error) => '${error.message.runtimeType} implementado',
  );
  print(mensagemMap);

}