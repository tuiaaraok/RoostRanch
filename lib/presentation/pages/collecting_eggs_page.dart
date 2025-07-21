import 'package:chickenman/core/drift/tables.dart';
import 'package:chickenman/core/injectable/injectable.dart';
import 'package:chickenman/data_sources/chicken_data_source.dart';
import 'package:chickenman/presentation/pages/create_collecting_eggs_page.dart';
import 'package:chickenman/presentation/widgets/widget.dart';

class CollectingEggsPage extends StatefulWidget {
  const CollectingEggsPage({super.key});

  @override
  State<CollectingEggsPage> createState() => _CollectingEggsPageState();
}

class _CollectingEggsPageState extends State<CollectingEggsPage> {
  final ChickenDataSource _dataSource = ChickenDataSource(getIt<AppDatabase>());
  final Map<int, String> _chickenNames = {};

  @override
  void initState() {
    super.initState();
    _loadChickenNames();
  }

  Future<void> _loadChickenNames() async {
    final chickens = await _dataSource.getChickenList();
    setState(() {
      _chickenNames.addAll({for (var c in chickens) c.id: c.name});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.paddingOf(context).top),
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppBarWidget(
                  title: "Collecting eggs",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder:
                            (BuildContext context) =>
                                const CreateCollectingEggsPage(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 30.h),

                StreamBuilder(
                  stream: _dataSource.watchCollectionEggsGroupedByDate(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }
                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Text('No collection found');
                    }
                    final data = snapshot.data!;
                    int totalEggs = 0;
                    double totalAmount = 0;

                    return Column(
                      children: [
                        ...data.entries.map((entry) {
                          final date = entry.key;
                          final collections = entry.value;

                          // Calculate totals for this date group
                          // ignore: unused_local_variable
                          int groupEggs = 0;
                          // ignore: unused_local_variable
                          double groupAmount = 0;

                          final elements =
                              collections.map((collection) {
                                final quantity = collection['quantity'] as int;
                                final price =
                                    collection['pricePerPiece'] as int;
                                final chickenId =
                                    collection['idChicken'] as int;
                                final chickenName =
                                    _chickenNames[chickenId] ??
                                    'Chicken #$chickenId';
                                final variety =
                                    collection['EggVarietyName'] as String;

                                groupEggs += quantity;
                                groupAmount += quantity * price;

                                totalEggs += quantity;
                                totalAmount += quantity * price;

                                return CollectingEggsElement(
                                  chicken:
                                      "$chickenName (${_getAgeString(chickenId)})",
                                  quantity: quantity.toString(),
                                  grade:
                                      "[$variety] ${quantity}pcs/${quantity * price}\$",
                                );
                              }).toList();

                          return CollectingEggsWidget(
                            date: date,
                            collectngEggsElements: elements,
                          );
                        }),
                        SizedBox(height: 20.h),
                        Text(
                          "Total: $totalEggs eggs / Amount: ${totalAmount.toStringAsFixed(2)} \$",
                          style: textStyleInformation,
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getAgeString(int chickenId) {
    // Implement your logic to get chicken age
    // This is just a placeholder - you'll need to fetch the actual age
    return "2 years";
  }
}

// ignore: must_be_immutable
class CollectingEggsWidget extends StatelessWidget {
  CollectingEggsWidget({
    super.key,
    required this.date,
    required this.collectngEggsElements,
  });
  String date;
  List<CollectingEggsElement> collectngEggsElements;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 332.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(date, style: textStyleInformation),
          ...collectngEggsElements.map((toElement) {
            return Container(
              width: 332.w,
              decoration: textFieldDecoration,
              padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 20.w),
              margin: EdgeInsets.symmetric(vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(toElement.chicken, style: textStyleMainCard),
                  Text(
                    "Quantity: [${toElement.quantity}]",
                    style: textStyleMainCard,
                  ),
                  Text("Grade: ${toElement.grade}", style: textStyleMainCard),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

class CollectingEggsElement {
  CollectingEggsElement({
    required this.chicken,
    required this.grade,
    required this.quantity,
  });
  String chicken;
  String quantity;
  String grade;
}
