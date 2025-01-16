import 'package:asi_shop/providers/user_provider.dart';
import 'package:asi_shop/screens/cart.dart';
import 'package:asi_shop/screens/orders.dart';
import 'package:asi_shop/screens/products.dart';
import 'package:asi_shop/screens/user.dart';
import 'package:asi_shop/widget/main_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  final List<Widget> screens = [ProductsScreen(), OrdersScreen(), UserScreen()];

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: 'LOJA ASIMOV',
        asipoints: ref.watch(userProvider).asipoints,
        goTo: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (ctx) => CartScreen()),
          );
        },
      ).mainAppBarWidget,
      body: screens[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Produtos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_road),
            label: 'Pedidos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin_sharp),
            label: 'Asimover',
          ),
        ],
      ),
    );
  }
}
