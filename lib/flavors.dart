enum Flavor {
  DEVELOPMENT,
  STAGING,
  PRODUCTION,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.DEVELOPMENT:
        return '[DEV] Sosmed';
      case Flavor.STAGING:
        return '[STG] Sosmed';
      case Flavor.PRODUCTION:
        return 'Sosmed';
      default:
        return 'title';
    }
  }
}
