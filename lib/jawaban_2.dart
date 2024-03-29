import 'package:flutter/material.dart';

class Jawaban2Page extends StatefulWidget {
  @override
  State<Jawaban2Page> createState() => _Jawaban2PageState();
}

class _Jawaban2PageState extends State<Jawaban2Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              HeaderTop(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 12),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Halo, Budi!',
                            style: TextStyle(
                              fontSize: 19,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                        side: BorderSide(
                          color: Colors.brown,
                          width: 1.0,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const <Widget>[
                            CardItem(
                              title: 'Store \n Credit',
                              value: 'Rp.0',
                              iconData: Icons.credit_card,
                            ),
                            CardItem(
                              title: 'Reward \n Point',
                              value: '100 Point',
                              iconData: Icons.discount_outlined,
                            ),
                            CardItem(
                              title: 'Kupon \n Saya',
                              value: '11 Kupon',
                              iconData: Icons.confirmation_num,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const <Widget>[
                          IconMenuItem(
                              title: 'Official Store',
                              iconData: Icons.storefront,
                              color: Colors.black),
                          IconMenuItem(
                              title: 'Hot Deal',
                              iconData: Icons.local_fire_department,
                              color: Colors.red),
                          IconMenuItem(
                              title: 'Fashion',
                              iconData: Icons.checkroom,
                              color: Colors.black),
                          IconMenuItem(
                              title: 'Kosmetik',
                              iconData: Icons.face_retouching_natural,
                              color: Colors.black),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              CarouselImage()
            ],
          ),
        ),
        bottomNavigationBar: ButtomNavBar());
  }
}

class HeaderTop extends StatelessWidget {
  const HeaderTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          'assets/dummy.jpg',
          height: 200,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Cari barang di Tokoo',
                    contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    prefixIcon: IconTheme(
                      data: IconThemeData(
                        color: Colors.black,
                      ),
                      child: Icon(Icons.search),
                    ),
                    filled: true,
                    fillColor: Colors.grey[300],
                  ),
                ),
              ),
              SizedBox(
                width: 60,
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.shopping_cart, color: Colors.white),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.notifications, color: Colors.white),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.message, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class CardItem extends StatelessWidget {
  final String title;
  final String value;
  final IconData iconData;

  const CardItem({
    Key? key,
    required this.title,
    required this.value,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          height: 30,
          padding: EdgeInsets.only(left: 5.0),
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: Colors.brown,
                width: 0.7,
              ),
            ),
          ),
          child: Icon(
            iconData,
            size: 20,
            color: Colors.brown,
          ),
        ),
        Container(
          width: 60,
          child: Column(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.brown),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                value,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.brown),
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
      ],
    );
  }
}

class IconMenuItem extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Color color;

  const IconMenuItem(
      {required this.title, required this.iconData, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(
          iconData,
          size: 36,
          color: color,
        ),
        SizedBox(
          height: 6,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}

class CarouselImage extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  final List<String> imageList = [
    'assets/dummy.jpg',
    'assets/dummy.jpg',
    'assets/dummy.jpg',
  ];

  double _calculateScale(int index) {
    try {
      if (!_scrollController.hasClients) {
        return 1.0;
      }
      final position = _scrollController.position;
      if (position.maxScrollExtent == null ||
          position.viewportDimension == null) {
        return 1.0;
      }
      final offset = position.maxScrollExtent / (imageList.length - 1) * index;
      final scale = 1 -
          (0.2 *
              (offset - _scrollController.offset).abs() /
              position.viewportDimension);
      return scale.clamp(0.8, 1.0);
    } catch (e) {
      print('Error: $e');
      return 1.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 200.0,
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          // setState(() {});
          return true;
        },
        child: ListView.builder(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          itemCount: imageList.length,
          itemBuilder: (BuildContext context, int index) {
            final scale = _calculateScale(index);

            return Transform.scale(
              scale: scale,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imageList[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ButtomNavBar extends StatefulWidget {
  @override
  State<ButtomNavBar> createState() => _ButtomNavBarState();
}

class _ButtomNavBarState extends State<ButtomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.grey[200],
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          activeIcon: Container(
            width: 60,
            height: 36,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(50),
                right: Radius.circular(50),
              ),
            ),
            child: Icon(Icons.home, color: Colors.black),
          ),
          label: 'Beranda',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.category),
          activeIcon: Container(
            width: 60,
            height: 36,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(50),
                right: Radius.circular(50),
              ),
            ),
            child: Icon(Icons.category, color: Colors.black),
          ),
          label: 'Kategori',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.qr_code),
          activeIcon: Container(
            width: 60,
            height: 36,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(50),
                right: Radius.circular(50),
              ),
            ),
            child: Icon(Icons.qr_code, color: Colors.black),
          ),
          label: 'Scan',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_basket),
          activeIcon: Container(
            width: 60,
            height: 36,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(50),
                right: Radius.circular(50),
              ),
            ),
            child: Icon(Icons.shopping_basket, color: Colors.black),
          ),
          label: 'List Belanja',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          activeIcon: Container(
            width: 60,
            height: 36,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(50),
                right: Radius.circular(50),
              ),
            ),
            child: Icon(Icons.account_circle, color: Colors.black),
          ),
          label: 'Akun',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.black,
      onTap: _onItemTapped,
      showUnselectedLabels: true,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      unselectedItemColor: Colors.grey,
    );
  }
}
