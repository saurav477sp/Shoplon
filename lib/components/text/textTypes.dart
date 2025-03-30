enum TextColorVariant {
  primary,
  onPrimary,
  disabled,
  accent,
}

enum AppFontFamily {
  primary,
  secondary;

  String toValues() {
    switch (this) {
      case AppFontFamily.primary:
        return 'Syne';
      case AppFontFamily.secondary:
        return 'Transforma';
      default:
        return 'Syne';
    }
  }
}
