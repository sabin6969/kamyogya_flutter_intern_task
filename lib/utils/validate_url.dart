mixin ValidateURL {
  bool isValidURL({required String url}) {
    return Uri.tryParse(url)?.hasAbsolutePath ?? false;
  }
}
