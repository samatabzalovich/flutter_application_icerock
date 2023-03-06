class Language {
  final int id;
  final String flag; //emoji
  final String name;
  final String languageCode;

  Language(this.id, this.flag, this.name, this.languageCode);
  static List<Language> languageList() {
    return <Language>[Language(1, "🇺🇸", "English", "en")];
  }
}
