// ignore_for_file: file_names

///count letters from data file (String)
Map<String, int> countLettersFrequency(String input) {
  Map<String, int> frequencyMap = {};

  for (int i = 0; i < input.length; i++) {
    String letter = input[i].toLowerCase();

    if (letter != " ") {
      if (frequencyMap.containsKey(letter)) {
        frequencyMap[letter] = frequencyMap[letter]! + 1;
      } else {
        frequencyMap[letter] = 1;
      }
    }
  }

  return frequencyMap;
}

///sort list from map value (sorts by quantity or alphabetically)
Map<String, int> sortList(Map<String, int> value, bool alphabet) {
  Map<String, int> sortedValue = {};
  if (!alphabet) {
    var sortedKeys = value.keys.toList()
      ..sort((k1, k2) => value[k2]!.compareTo(value[k1]!));

    sortedValue =
        Map.fromEntries(sortedKeys.map((key) => MapEntry(key, value[key]!)));
  } else {
    var keys = value.keys.toList();
    keys.sort();
    for (var key in keys) {
      sortedValue[key] = value[key] ?? 0;
    }
  }
  return sortedValue;
}

///get ONLY letter from file data (String)
String getAllLettersFromFile(String text) {
  List<String?> letters = RegExp(r'[a-zA-Z]')
      .allMatches(text)
      .map((match) => match.group(0))
      .toList();
  String allLeters = '';
  for (int i = 0; i < letters.length; i++) {
    allLeters += letters[i] ?? ' ';
  }
  return allLeters;
}
