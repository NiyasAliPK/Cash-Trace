import 'package:cash_trace/app/contants/size_constants.dart';
import 'package:cash_trace/app/providers/search_query_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchFieldWidget extends ConsumerWidget {
  final Function(String newValue) onSearch;

  const SearchFieldWidget({super.key, required this.onSearch});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get the current search query from provider
    final currentQuery = ref.watch(searchQueryProvider);

    // Create a controller with the current query value
    final controller = TextEditingController(text: currentQuery);

    return Padding(
      padding: EdgeInsets.only(bottom: SizeConstant.getHeightWithScreen(15)),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              onFieldSubmitted: (newValue) {
                onSearch(newValue);
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a description';
                }
                return null;
              },
              decoration: InputDecoration(
                floatingLabelAlignment: FloatingLabelAlignment.center,
                labelText: "Search By Description",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        SizeConstant.getHeightWithScreen(30))),
              ),
            ),
          ),
          TextButton(
            child: Text("Search"),
            onPressed: () {
              onSearch(controller.text);
            },
          ),
        ],
      ),
    );
  }
}
