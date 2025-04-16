import 'package:cash_trace/app/contants/size_constants.dart';
import 'package:cash_trace/app/providers/firebase_cloud_firestore_provider.dart';
import 'package:cash_trace/app/providers/search_query_provider.dart';
import 'package:cash_trace/app/screens/home/widgets/list_tile_widget.dart';
import 'package:cash_trace/app/screens/home/widgets/search_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(SizeConstant.getHeightWithScreen(12)),
        child: Column(
          children: [
            SearchFieldWidget(
              onSearch: (newValue) {
                ref.read(searchQueryProvider.notifier).setQuery(newValue);
              },
            ),
            Expanded(
              child: Consumer(
                builder: (context, ref, child) {
                  return ref.watch(transactionsProvider).when(
                        data: (data) {
                          if (data.isEmpty) {
                            return Center(child: Text("No transactions found"));
                          }
                          return ListView.separated(
                            padding: EdgeInsets.only(
                              bottom: SizeConstant.getHeightWithScreen(40),
                            ),
                            itemBuilder: (context, index) =>
                                TransactionTile(transaction: data[index]),
                            separatorBuilder: (context, index) => SizedBox(
                              height: SizeConstant.getHeightWithScreen(10),
                            ),
                            itemCount: data.length,
                          );
                        },
                        error: (error, stackTrace) {
                          return Center(child: Text(error.toString()));
                        },
                        loading: () =>
                            Center(child: CircularProgressIndicator.adaptive()),
                      );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(SizeConstant.getHeightWithScreen(50)),
        ),
        onPressed: () {
          context.pushNamed('add');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
