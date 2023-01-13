import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_test/core/app_model.dart';
import 'package:web_test/generated/l10n.dart';

class MobileView extends ConsumerWidget {
  MobileView({super.key});

  Locale? locale;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
      ),
      body: Column(
        children: [
          Center(child: Text(S.of(context).mobile_view)),
          Container(
            height: 60,
            width: double.infinity,
            padding: const EdgeInsets.only(
              left: 23,
              right: 23,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: Colors.green,
              ),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<Locale>(
                value: locale,
                dropdownColor: Colors.white,
                borderRadius: BorderRadius.circular(6),
                icon: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Colors.grey,
                  size: 24,
                ),
                items: ref.read(appModelProvider.notifier).languages.map<DropdownMenuItem<Locale>>((item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(
                      item.languageCode,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value == null) return;
                  ref.read(appModelProvider.notifier).setLanguage(value);
                },
                isExpanded: true,
                hint:  Text(
                   S.of(context).select_language,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
