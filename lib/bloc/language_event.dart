abstract class LanguageEvent {}

class ChangeLanguage extends LanguageEvent {
  final String newLanguage;

  ChangeLanguage(this.newLanguage);
}
