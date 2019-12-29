class ReBase60 {
  //
  final _encodeMap = const {
    '0': 0,
    'a': 1,
    'b': 2,
    'c': 3,
    'd': 4,
    'e': 5,
    'f': 6,
    'g': 7,
    'h': 8,
    'i': 9,
    'j': 10,
    'k': 11,
    'l': 12,
    'm': 13,
    'n': 14,
    'o': 15,
    'p': 16,
    'q': 17,
    'r': 18,
    's': 19,
    't': 20,
    'u': 21,
    'v': 22,
    'w': 23,
    'x': 24,
    'y': 25,
    '1': 26,
    '2': 27,
    '3': 28,
    '4': 29,
    '5': 30,
    'A': 31,
    'B': 32,
    'C': 33,
    'D': 34,
    'E': 35,
    'F': 36,
    'G': 37,
    'H': 38,
    'I': 39,
    'J': 40,
    'K': 41,
    'L': 42,
    'M': 43,
    'N': 44,
    'O': 45,
    'P': 46,
    'Q': 47,
    'R': 48,
    'S': 49,
    'T': 50,
    'U': 51,
    'V': 52,
    'W': 53,
    'X': 54,
    'Y': 55,
    '6': 56,
    '7': 57,
    '8': 58,
    '9': 59,
  };

  final _decodeMap = const {
    0: '0',
    1: 'a',
    2: 'b',
    3: 'c',
    4: 'd',
    5: 'e',
    6: 'f',
    7: 'g',
    8: 'h',
    9: 'i',
    10: 'j',
    11: 'k',
    12: 'l',
    13: 'm',
    14: 'n',
    15: 'o',
    16: 'p',
    17: 'q',
    18: 'r',
    19: 's',
    20: 't',
    21: 'u',
    22: 'v',
    23: 'w',
    24: 'x',
    25: 'y',
    26: '1',
    27: '2',
    28: '3',
    29: '4',
    30: '5',
    31: 'A',
    32: 'B',
    33: 'C',
    34: 'D',
    35: 'E',
    36: 'F',
    37: 'G',
    38: 'H',
    39: 'I',
    40: 'J',
    41: 'K',
    42: 'L',
    43: 'M',
    44: 'N',
    45: 'O',
    46: 'P',
    47: 'Q',
    48: 'R',
    49: 'S',
    50: 'T',
    51: 'U',
    52: 'V',
    53: 'W',
    54: 'X',
    55: 'Y',
    56: '6',
    57: '7',
    58: '8',
    59: '9',
  };

  const ReBase60();

  int encode(String character) {
    if (character == null) {
      throw ArgumentError.notNull('character');
    }
    if (character.isEmpty) {
      throw ArgumentError('Argument must not be empty.');
    }
    if (character.length != 1) {
      throw ArgumentError('Argument must contain exactly one character.');
    }
    if (!_encodeMap.containsKey(character)) {
      throw ArgumentError.value(character, 'character', 'Invalid argument');
    }

    return _encodeMap[character];
  }

  String decode(int code) {
    if (code == null) {
      throw ArgumentError.notNull('code');
    }
    if (code < 0 || code > 59) {
      throw ArgumentError(
        'Argument must be an integer between 0 and 59, inclusive.',
      );
    }

    return _decodeMap[code];
  }
}
