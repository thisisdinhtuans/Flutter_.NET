import 'package:flutter/material.dart';
class LeftDrawer extends StatefulWidget {
  const LeftDrawer({super.key});

  @override
  State<LeftDrawer> createState() => _LeftDrawerState();
}

class _LeftDrawerState extends State<LeftDrawer> {
  int _selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.blue),
              //vì là danh sách nên ta cho vào một cột
              child: Column(
                children: [
                  //để mà cái logo với text cùng một hàng thì cho vào row
                  Row(
                    children: [
                      Image.asset('assets/images/logo.png', height: 50,),
                      //muốn nó cách ra thì dùng width, cho nó cos khoảng khoong
                      const SizedBox(width: 10,),
                      const Text('Welcome to my app')
                    ],
                  ),
                  Row(
                    children: [
                      //expanded là cho nut button dài đến cuoi
                      //nếu mà để 2 thẻ Expanded cạnh nhau thì mỗi thà một nửa
                        Expanded(child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            side:const BorderSide(
                              width: 1,
                              color: Colors.grey,
                            ),
                          ),
                          child: const Text('Login')
                        )),
                        //cách 2 cái nút đó ra 20
                        const SizedBox(width: 20,),
                        Expanded(child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            side: const BorderSide(
                              width: 1,
                              color: Colors.grey,
                            ),
                          ),
                          child: const Text('Register'),
                        )
                        )
                    ],
                  )
                ],
              )
          ),
          _buildDrawerItem(Icons.attach_money, 'Price board', 0),
          _buildDrawerItem(Icons.start, 'Watch list', 1),
          _buildDrawerItem(Icons.business, 'Topstocks', 2),
          _buildDrawerItem(Icons.notifications, 'Notifications', 3),
          //cứ 4 cái thì cách ra một tý, có cả dấu gạch giữa cho dễ nhìn
          const SizedBox(height:10),
          const Divider(height: 1, color: Colors.grey,),
          _buildDrawerItem(Icons.bar_chart, 'Equities Trading', 4),
          _buildDrawerItem(Icons.timeline, 'Derivatives Trading', 5),
          _buildDrawerItem(Icons.shopping_cart, 'Right Trading', 6),
          _buildDrawerItem(Icons.person_outline, 'S-Products', 7),
          const SizedBox(height:10),
          const Divider(height: 1, color: Colors.black,),
          _buildDrawerItem(Icons.account_balance_wallet, 'Cash Transaction', 8),
          _buildDrawerItem(Icons.account_balance, 'Assets Management', 9),
          _buildDrawerItem(Icons.person, 'Account Management', 10),
          _buildDrawerItem(Icons.add_box, 'Abc Plus', 11),
          const SizedBox(height:10),
          const Divider(height: 1, color: Colors.black,),
          _buildDrawerItem(Icons.settings, 'Settings', 12),
          _buildDrawerItem(Icons.contact_mail, 'Contact', 13),
          //muốn container bấm được thì sử dụng InkWell

        ],
      ),
    );
  }
  //vì sử dụng trong nội bộ nên là sử dụng tên hàm có dấu gạch dưới
  Widget _buildDrawerItem(IconData icon,String title, int index) {
    return InkWell(
      //trong InkWell có thuộc tính onTap để bấm vào
      //bây giờ có nhiều cái thanh trong menu thì nó vẫn chưa đổi màu được khi nhấn vào, phải dùng setState
      onTap: (){
        setState(() {
          _selectedIndex=index;
        });
      },
      child: Container(
        color: index==_selectedIndex ? Colors.green[100]:null,
        child: ListTile(
          leading: Icon(icon),
          title: Text(
            title,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}

