const emailRegex =
    r"^(?:[\w\!\#\$\%\&\'\*\+\-\/\=\?\^\`\{\|\}\~]+\.)*[\w\!\#\$\%\&\'\*\+\-\/\=\?\^\`\{\|\}\~]+@(?:(?:(?:[a-zA-Z0-9](?:[a-zA-Z0-9\-](?!\.)){0,61}[a-zA-Z0-9]?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9\-](?!$)){0,61}[a-zA-Z0-9]?)|(?:\[(?:(?:[01]?\d{1,2}|2[0-4]\d|25[0-5])\.){3}(?:[01]?\d{1,2}|2[0-4]\d|25[0-5])\]))$";

class UtilRegex {
  static String? validate(String? value) {
    return value == null || value.isEmpty ? "Хоосон байж болохгүй" : null;
  }

  static String? emailValidate(String? value) {
    if (value == null || value.isEmpty) return "Хоосон байж болохгүй";
    if (!RegExp(emailRegex).hasMatch(value)) return "Имэйл хаяг буруу байна.";
    return null;
  }
}
