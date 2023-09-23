//TODO:Data extension
extension CustomDate on DateTime {
  String toCustomDate() {
    return "$day/$month/$year";
  }
}

//TODO:First word capital extension
extension CustomFirstWordCapital on String {
  String toCustomFirstWordCapital() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}

//TODO:integer to string extension
extension IntegerToWords on int {
  String toWords() {
    if (this < 0) {
      return "Negative ${(-this).toWords()}";
    } else if (this == 0) {
      return "Zero";
    } else if (this < 10) {
      return _singleDigitToWord(this);
    } else if (this < 20) {
      return _teensToWord(this);
    } else if (this < 100) {
      return _tensToWord(this ~/ 10) + _singleDigitToWord(this % 10);
    } else if (this < 1000) {
      return "${_singleDigitToWord(this ~/ 100)} Hundred${(this % 100).toWords()}";
    } else if (this < 1000000) {
      return "${(this ~/ 1000).toWords()} Thousand${(this % 1000).toWords()}";
    } else if (this < 1000000000) {
      return "${(this ~/ 1000000).toWords()} Million${(this % 1000000).toWords()}";
    } else {
      return "${(this ~/ 1000000000).toWords()} Billion${(this % 1000000000).toWords()}";
    }
  }

  String _singleDigitToWord(int digit) {
    List<String> units = [
      '',
      'One',
      'Two',
      'Three',
      'Four',
      'Five',
      'Six',
      'Seven',
      'Eight',
      'Nine',
    ];
    return units[digit];
  }

  String _teensToWord(int number) {
    List<String> teens = [
      'Ten',
      'Eleven',
      'Twelve',
      'Thirteen',
      'Fourteen',
      'Fifteen',
      'Sixteen',
      'Seventeen',
      'Eighteen',
      'Nineteen',
    ];
    return teens[number - 10];
  }

  String _tensToWord(int number) {
    List<String> tens = [
      '',
      '',
      'Twenty',
      'Thirty',
      'Forty',
      'Fifty',
      'Sixty',
      'Seventy',
      'Eighty',
      'Ninety',
    ];
    return tens[number];
  }
}

//TODO:integer to string extension
