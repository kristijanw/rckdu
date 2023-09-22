class LangData {
  int id;
  String name;
  String images;
  String langCode;
  String countryCode;

  LangData(
    this.id,
    this.name,
    this.images,
    this.langCode,
    this.countryCode,
  );

  static List<LangData> getCounties() {
    return <LangData>[
      LangData(1, 'Hrvatski', 'assets/country/hr.svg', 'hr', 'HR'),
      LangData(1, 'Engleski', 'assets/country/en.svg', 'en', 'US'),
    ];
  }
}
