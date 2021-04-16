extension StringExtensions on String {
  String removeEmailDomain(){
    return substring(0, indexOf('@'));
  }
}