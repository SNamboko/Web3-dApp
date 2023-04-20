import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';

String getAbi() {
  return '''[
    {
      "inputs": [
        {"internalType": "int256", "name": "amt", "type": "int256"}
      ],
      "name": "depositAmount",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {"inputs": [], "stateMutability": "nonpayable", "type": "constructor"},
    {
      "inputs": [
        {"internalType": "int256", "name": "amt", "type": "int256"}
      ],
      "name": "withdrawAmount",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "getAmount",
      "outputs": [
        {"internalType": "int256", "name": "", "type": "int256"}
      ],
      "stateMutability": "view",
      "type": "function"
    }
  ]''';
}

String teamCodeTest() {
  return 'Okays';
}
