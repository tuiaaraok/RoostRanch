import 'package:chickenman/presentation/pages/chicken_coop_page.dart';
import 'package:chickenman/presentation/pages/collecting_eggs_page.dart';
import 'package:chickenman/presentation/pages/sales_page.dart';
import 'package:chickenman/presentation/pages/settings_page.dart';
import 'package:chickenman/presentation/them/them.dart';
import 'package:chickenman/presentation/widgets/btn_widget.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset("assets/menu.png", width: 402.w, height: 402.h),
          SizedBox(height: 60.h),
          SizedBox(
            height: 300.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MainBtnWiget(
                  title: "Chicken coop",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder:
                            (BuildContext context) => const ChickenCoopPage(),
                      ),
                    );
                  },
                ),
                MainBtnWiget(
                  title: "Collecting eggs",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder:
                            (BuildContext context) =>
                                const CollectingEggsPage(),
                      ),
                    );
                  },
                ),
                MainBtnWiget(
                  title: "Sales",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const SalesPage(),
                      ),
                    );
                  },
                ),
                MainBtnWiget(
                  title: "Settings",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const SettingsPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
