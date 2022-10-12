import 'package:fhe_template/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardView extends ConsumerStatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    DashboardController controller = ref.watch(dashboardController);
    controller.view = widget;

    return DefaultTabController(
      length: 4,
      initialIndex: selectedIndex,
      child: SafeArea(
        child: Scaffold(
          body: IndexedStack(
            index: selectedIndex,
            children: [
              const HomeView(),
              const DevHomeView(),
              Container(
                color: Colors.purple[100],
              ),
              const ProfiletestingingView()
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey[500],
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            items: const [
              BottomNavigationBarItem(
                label: "Home",
                icon: Icon(
                  Icons.home,
                ),
              ),
              BottomNavigationBarItem(
                label: "Order",
                icon: Icon(
                  Icons.shopping_cart_outlined,
                ),
              ),
              BottomNavigationBarItem(
                label: "Favorite",
                icon: Icon(
                  Icons.favorite,
                ),
              ),
              BottomNavigationBarItem(
                label: "Me",
                icon: Icon(
                  Icons.person,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
