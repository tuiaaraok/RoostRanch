import 'package:chickenman/core/drift/tables.dart';
import 'package:chickenman/core/injectable/injectable.dart';
import 'package:chickenman/data_sources/chicken_data_source.dart';
import 'package:chickenman/presentation/pages/create_sale_chickens_page.dart';
import 'package:chickenman/presentation/pages/create_sale_eggs_page.dart';
import 'package:chickenman/presentation/widgets/btn_widget.dart';

import '../widgets/widget.dart';

class SalesPage extends StatefulWidget {
  const SalesPage({super.key});

  @override
  State<SalesPage> createState() => _SalesPageState();
}

class _SalesPageState extends State<SalesPage> {
  String currentMenu = "Chickens";
  final ChickenDataSource _dataSource = ChickenDataSource(getIt<AppDatabase>());

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
                AppBarWidget(title: "SALES"),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                      ["Eggs", "Chickens"].map((toElement) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              currentMenu = toElement;
                            });
                          },
                          child: Container(
                            width: 140.w,
                            height: 42.h,
                            margin:
                                toElement == "Eggs"
                                    ? EdgeInsets.only(right: 12.w)
                                    : null,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12.r),
                              ),
                              border: Border.all(
                                color: containerBorderColor,
                                width: 2.w,
                              ),
                              color:
                                  currentMenu == toElement
                                      ? containerMainColor
                                      : containerMainColor.withValues(
                                        alpha: 0.7,
                                      ),
                            ),
                            child: Center(
                              child: Text(
                                toElement,
                                style: GoogleFonts.lato(
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w800,
                                  color: textFieldColor,
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                ),
                SizedBox(height: 30.h),
                NewInformationBtnWiget(
                  title: '+New sale',
                  onTap: () {
                    if (currentMenu == "Eggs") {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder:
                              (BuildContext context) =>
                                  const CreateSaleEggsPage(),
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder:
                              (BuildContext context) =>
                                  const CreateSaleChickensPage(),
                        ),
                      );
                    }
                  },
                ),
                SizedBox(height: 30.h),
                if (currentMenu == "Eggs") _buildEggSales(),
                if (currentMenu == "Chickens") _buildChickenSales(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEggSales() {
    return StreamBuilder<Map<String, List<Map<String, dynamic>>>>(
      stream: _dataSource.watchSaleEggsGroupedByDate(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text('No egg sales found');
        }

        final data = snapshot.data!;
        double totalAmount = 0;

        return Column(
          children: [
            ...data.entries.map((entry) {
              final date = entry.key;
              final sales = entry.value;

              // Calculate total for this date group
              double groupTotal = sales.fold(
                0,
                (sum, sale) => sum + (sale['totalAmount'] as int).toDouble(),
              );

              return SalesEggWidget(
                date: date,
                elemtsSales:
                    sales.map((sale) {
                      totalAmount += sale['totalAmount'] as int;
                      return "${sale['quantity']} pcs. ${sale['EggVarietyName']} × ${sale['pricePerPiece']} \$ = ${sale['totalAmount']} \$";
                    }).toList(),
                total: groupTotal.toStringAsFixed(2),
              );
            }),
            SizedBox(height: 20.h),
            Text(
              "Total Amount: ${totalAmount.toStringAsFixed(2)} \$",
              style: textStyleInformation,
            ),
          ],
        );
      },
    );
  }

  Widget _buildChickenSales() {
    return StreamBuilder<Map<String, List<Map<String, dynamic>>>>(
      stream: _dataSource.watchSaleChickensGroupedByDate(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text('No chicken sales found');
        }

        final data = snapshot.data!;
        double totalAmount = 0;

        return Column(
          children: [
            ...data.entries.map((entry) {
              final date = entry.key;
              final sales = entry.value;

              // Calculate total for this date group
              double groupTotal = sales.fold(
                0,
                (sum, sale) => sum + (sale['totalAmount'] as int).toDouble(),
              );

              return SalesChickenWidget(
                date: date,
                elemtsSales:
                    sales.map((sale) {
                      totalAmount += sale['totalAmount'] as int;
                      return "${sale['quantity']} chicken ${sale['ChickenName']} × ${sale['pricePerPiece']} \$ = ${sale['totalAmount']} \$";
                    }).toList(),
                total: groupTotal.toStringAsFixed(2),
              );
            }),
            SizedBox(height: 20.h),
            Text(
              "Total Amount: ${totalAmount.toStringAsFixed(2)} \$",
              style: textStyleInformation,
            ),
          ],
        );
      },
    );
  }
}

// Update the widget classes to include totals
class SalesEggWidget extends StatelessWidget {
  const SalesEggWidget({
    super.key,
    required this.date,
    required this.elemtsSales,
    required this.total,
  });

  final String date;
  final List<String> elemtsSales;
  final String total;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 332.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(date, style: textStyleInformation),
          Container(
            width: 332.w,
            decoration: textFieldDecoration,
            padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 20.w),
            margin: EdgeInsets.symmetric(vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...elemtsSales.map((toElement) {
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: elemtsSales.last == toElement ? 0 : 10.h,
                    ),
                    child: Text(toElement, style: textStyleMainCard),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SalesChickenWidget extends StatelessWidget {
  const SalesChickenWidget({
    super.key,
    required this.date,
    required this.elemtsSales,
    required this.total,
  });

  final String date;
  final List<String> elemtsSales;
  final String total;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 332.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(date, style: textStyleInformation),
          Container(
            width: 332.w,
            decoration: textFieldDecoration,
            padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 20.w),
            margin: EdgeInsets.symmetric(vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...elemtsSales.map((toElement) {
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: elemtsSales.last == toElement ? 0 : 10.h,
                    ),
                    child: Text(toElement, style: textStyleMainCard),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
