
import 'package:simple_json_mapper/simple_json_mapper.dart';

@JObj()
class EndpointLanguagePackage{
  final String id;
  final String name;
  final String foreignWordLanguage;
  final String translatedWordLanguage;
  final int vocabsPerDay;
  final int rightWords;

  EndpointLanguagePackage(this.id, this.name,
      this.foreignWordLanguage,
      this.translatedWordLanguage,
      this.vocabsPerDay, this.rightWords);
}