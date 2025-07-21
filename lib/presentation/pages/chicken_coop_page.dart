import 'package:chickenman/data_sources/chicken_data_source.dart';
import 'package:chickenman/core/drift/tables.dart';
import 'package:chickenman/core/injectable/injectable.dart';
import 'package:chickenman/presentation/pages/create_chicken_page.dart';
import 'package:chickenman/presentation/widgets/btn_widget.dart';
import 'package:flutter_svg/svg.dart';
import '../widgets/widget.dart';

class ChickenCoopPage extends StatefulWidget {
  const ChickenCoopPage({super.key});

  @override
  State<ChickenCoopPage> createState() => _ChickenCoopPageState();
}

class _ChickenCoopPageState extends State<ChickenCoopPage> {
  final ChickenDataSource _dataSource = ChickenDataSource(getIt<AppDatabase>());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
                AppBarWidget(title: "Chicken coop"),
                SizedBox(height: 20.h),
                NewInformationBtnWiget(
                  title: '+New sale',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => CreateChickenPage(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 42.h),
                StreamBuilder(
                  stream: _dataSource.watchChickenList(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }
                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Text('No chickens found');
                    }
                    return Column(
                      children:
                          snapshot.data!
                              .map(
                                (chicken) =>
                                    ChickenCoopWidget(chickenElement: chicken),
                              )
                              .toList(),
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
}

// ignore: must_be_immutable
class ChickenCoopWidget extends StatelessWidget {
  ChickenCoopWidget({super.key, required this.chickenElement});
  ChickenData chickenElement;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      width: 332.w,
      decoration: textFieldDecoration,
      padding: EdgeInsets.only(right: 9.w, top: 2.h, bottom: 20.h, left: 10.w),
      child: Column(children: [_buildEditButton(context), _buildChickenInfo()]),
    );
  }

  Widget _buildEditButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder:
                (BuildContext context) =>
                    CreateChickenPage(chickenData: chickenElement),
          ),
        );
      }, // Добавьте обработчик нажатия
      child: Align(
        alignment: Alignment.topRight,
        child: SvgPicture.asset("assets/icons/redact.svg"),
      ),
    );
  }

  String _calculateAge(DateTime birthDate) {
    final now = DateTime.now();
    int years = now.year - birthDate.year;
    int months = now.month - birthDate.month;

    if (months < 0) {
      years--;
      months += 12;
    }

    return '$years year${years != 1 ? 's' : ''} $months month${months != 1 ? 's' : ''}';
  }

  Widget _buildChickenInfo() {
    return Column(
      children: [
        _buildInfoRow(
          "assets/icons/chicken.svg",
          "${chickenElement.name} (${chickenElement.breed} )",
        ),
        _buildInfoRow(
          "assets/icons/age.png",
          "Age: ${_calculateAge(chickenElement.dateOfBirth)}",
        ),
        _buildInfoRow(
          "assets/icons/egg.svg",
          "Egg production: ${chickenElement.eggProduction} eggs/week",
        ),
        _buildInfoRow(
          "assets/icons/weight.svg",
          "Weight: ${chickenElement.weight} kg",
        ),
      ],
    );
  }

  Widget _buildInfoRow(String iconPath, String text) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 4.h,
      ), // Добавил вертикальный отступ
      child: Row(
        children: [
          iconPath.endsWith('.svg')
              ? SvgPicture.asset(iconPath)
              : Image.asset(iconPath),
          SizedBox(width: 9.w),
          Expanded(child: Text(text, style: textStyleMainCard)),
        ],
      ),
    );
  }
}
