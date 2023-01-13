import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_test/generated/l10n.dart';

final appModelProvider = StateNotifierProvider<AppModel, Locale>((ref) => AppModel());
final indexTrackerProvider = StateNotifierProvider<IndexTrackerModel, int>((ref) => IndexTrackerModel());

class AppModel extends StateNotifier<Locale> {
  AppModel() : super(S.delegate.supportedLocales.first);

  List<Locale> get languages => S.delegate.supportedLocales;

  Future<void> setLanguage(Locale locale) async {
    state = locale;
    await S.load(locale);
  }
}

class IndexTrackerModel extends StateNotifier<int> {
  IndexTrackerModel() : super(0);

  void setIndex(int index) {
    state = index;
  }
}
