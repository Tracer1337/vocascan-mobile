
import 'package:simple_json_mapper/simple_json_mapper.dart';

@JObj()
class EndpointLanguagePackage{
  final String id;
  final String name;
  final String foreignWordLanguage;
  final String translatedWordLanguage;
  final int vocabsPerDay;
  final int rightWords;

  EndpointLanguagePackage({
    required this.id,
    required this.name,
    required this.foreignWordLanguage,
    required this.translatedWordLanguage,
    required this.vocabsPerDay,
    required this.rightWords}
    );
}