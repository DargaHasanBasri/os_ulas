// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prod_env.dart';

// **************************************************************************
// EnviedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// generated_from: assets/env/.prod.env
final class _ProdEnv {
  static const List<int> _enviedkey_baseUrl = <int>[
    3805429689,
    1914498199,
    783647954,
    3458689814,
  ];

  static const List<int> _envieddata_baseUrl = <int>[
    3805429705,
    1914498277,
    783647933,
    3458689906,
  ];

  static final String _baseUrl = String.fromCharCodes(
    List<int>.generate(
      _envieddata_baseUrl.length,
      (int i) => i,
      growable: false,
    ).map((int i) => _envieddata_baseUrl[i] ^ _enviedkey_baseUrl[i]),
  );
}
