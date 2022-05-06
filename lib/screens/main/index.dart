import 'package:ehlel/routes/index.dart';
import 'package:ehlel/screens/main/home/index.dart';
import 'package:ehlel/screens/main/products/index.dart';
import 'package:ehlel/screens/main/profile/index.dart';
import 'package:ehlel/screens/main/search_delegate/index.dart';
import 'package:ehlel/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  int index = 1;

  @override
  void initState() {
    super.initState();
    // MainBloc.bloc.add(GetAddress());
  }

  void _setIndex(int value) {
    HapticFeedback.mediumImpact();
    setState(() {
      index = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Image.asset(
          'assets/logo.png',
          height: 150.0,
          width: 150.0,
        ),
        leading: IconButton(
          onPressed: () => _key.currentState!.openDrawer(),
          icon: const Icon(Icons.menu, color: Colors.black87),
        ),
        actions: [
          IconButton(
            onPressed: () => showSearch(context: context, delegate: SearchPage()),
            icon: const Icon(Icons.search, color: Colors.black87),
          ),
          IconButton(
            onPressed: () => Navigator.pushNamed(context, notificationRoute),
            icon: const Icon(Icons.notifications_active, color: Colors.black87),
          ),
          IconButton(
            onPressed: () => Navigator.pushNamed(context, cartRoute),
            icon: const Icon(Icons.shopping_cart, color: Colors.black87),
          ),
        ],
      ),
      drawer: const MainDrawer(),
      body: SafeArea(
        child: IndexedStack(
          index: index,
          children: const [
            HomePage(),
            ProductsPage(),
            ProfilePage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Нүүр',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Бүтээгдэхүүн',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Миний',
          ),
        ],
        currentIndex: index,
        onTap: _setIndex,
        selectedLabelStyle: TextStyle(
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.w500,
          fontSize: 13,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 13,
        ),
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).hintColor.withOpacity(0.4),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
