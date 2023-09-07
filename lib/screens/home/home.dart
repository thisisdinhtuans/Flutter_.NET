import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stock_app/screens/home/Trading/trading.dart';
import 'package:stock_app/screens/home/assets/assets.dart';
import 'package:stock_app/screens/home/cash_transfer/cash_transfer.dart';
import 'package:stock_app/screens/home/drawers/left/left.dart';
import 'package:stock_app/screens/home/market/market.dart';
import 'package:stock_app/screens/home/watchlist/watchlist.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex=0;
  final GlobalKey<ScaffoldState> _scaffoldKey=GlobalKey<ScaffoldState>();
  final List<Widget> _screens=[
    MarketScreen(),
    WatchListScreen(),
    TradingScreen(),
    AssetsScreen(),
    CashTransferScreen()
  ];
  @override
  Widget build(BuildContext context) {
    // vì là màn hình neen chúng ta return về ther Scaffold
    return Scaffold(
      key:_scaffoldKey,
      drawer: LeftDrawer(),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //khi mà để bình thương là Text thì nó sẽ bị vào cái wifi nhưng mà chúng ta sử dụng SafeArea thì nó sẽ không bị dính
          // Text('This is Home')
          //SafeArea là phần màn hình bỏ đi phần cột sóng
          SafeArea(child: Padding(
            //EdgeInsets.all(10) tức là cách trên dưới trái phải mỗi chỗ là 10
            padding: const EdgeInsets.all(10),
            child:Row(
              children: [
                IconButton(onPressed: (){
                  //Open drawer
                  //nó có thể nhận giá trị null nên là
                  _scaffoldKey.currentState?.openDrawer();
                },icon:const Icon(Icons.menu)),
                //Làm thẻ textfield để người ta search

                //tại sao phải dùng Expanded là vì menu nó ở một góc rồi thif cái còn lại thì dùng Expanded
                Expanded(child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search something',
                    //tạo cái kính lúp
                    prefixIcon: const Icon(Icons.search),
                    //tạo cái ô ở thanh tìm kiếm
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)
                    ),
                    //bình thường thì nó border khá to, bỏ bớt đi cho thanh tìm kiếm nó gọn
                    contentPadding: const EdgeInsets.symmetric(vertical: 0.0)
                  ),
                )),
                //tạo hình quả chuông
                IconButton(
                  onPressed: (){},
                  icon: const Icon(Icons.notifications)
                ),
                //content< tức là phần nội dung của app

              ],
            ),
          )),
          // cái này là cái ruột
          _screens[_currentIndex]
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.greenAccent,
        selectedItemColor: Colors.green,
        //unSelectedItemColor là khi không chọn cái đó thì nó màu xanh lá
        unselectedItemColor: Colors.grey.shade600,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex=index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart),
            label: 'Market',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_sharp),
            label: 'Watchlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.area_chart),
            label: 'Trading',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Assets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_horiz),
            label: 'Cash Transfer',
          )
        ]
      ),
    );
  }
}