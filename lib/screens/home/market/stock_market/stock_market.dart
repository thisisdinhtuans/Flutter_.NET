import 'package:flutter/material.dart';
class StockMarket extends StatefulWidget {
  const StockMarket({super.key});

  @override
  State<StockMarket> createState() => _StockMarketState();
}

class _StockMarketState extends State<StockMarket> {
  final TextEditingController _controller=TextEditingController();
  final List<String> _indexes=[
    'VN30',
    'HOSE',
    'HNX',
    'UPCOM'
  ];
  String _selectedIndex='';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child:
              DropdownButton<String>(
                  icon: const Icon(Icons.arrow_downward),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  hint: const Text('Select Index'),
                  //nếu không có thì lấy phần tử đầu tiên, còn nếu không có thì lấy phần tử được chọn, còn nếu mà trong trường hợp phần tử đầu tiên bị null thì lấy '', cái ?? '' đó
                  value: _selectedIndex.isEmpty ? null : _selectedIndex,

                  //_indexes lấy ở trên là một danh sách list
                  items: _indexes.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value:value,
                      child: Text(value),
                    );
                  }).toList(),
                  //tại sao lại viết String? là bởi vì có thể bấm vào đó, có thể không
                  onChanged: (String? selectedItem) {
                    // ?? là cấp cho nó giá trị mặc định là null
                    //phải cho nó vào cái setState để khi xổ gạch xống thì có thẻ chọn được giá trị, nó sẽ xét giá trị _selectedindex vào.
                    setState(() {
                      _selectedIndex = selectedItem ?? '';
                    });
                  }),
              )
              ],
        ),
        // InkWell(
        //   child: Container(
        //     child: Row(
        //       children: [
        //         Text('This is Stock Market'),
        //         IconButton(
        //             onPressed: () {},
        //             icon: const Icon(Icons.arrow_drop_down)
        //         )
        //       ],
        //     ),
        //   ),
        //   onTap:() {
        //     debugPrint('Select from a list');
        //   } ,
        // ),
        // để mà dữ liệu không bị quá, tức bị tràn ra thì sử dụng Expanded
        Expanded(child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: DataTable(
                columns: [
                  DataColumn(label: Text('Symbol')),
                  DataColumn(label: Text('Price')),
                  DataColumn(label: Text('+/-')),
                  DataColumn(label: Text('+/- %')),
                  DataColumn(label: Text('TotalVol')),
                ],
              rows: [
                DataRow(cells:[
                  DataCell(Text('ABC')),
                  DataCell(Text('123.1')),
                  DataCell(Text('12.3')),
                  DataCell(Text('11.0')),
                  DataCell(Text('12345')),
                ]),
                DataRow(cells:[
                  DataCell(Text('XYZ  ')),
                  DataCell(Text('123.1')),
                  DataCell(Text('12.3')),
                  DataCell(Text('11.0')),
                  DataCell(Text('12345')),
                ]),
                DataRow(cells:[
                  DataCell(Text('MNQ')),
                  DataCell(Text('123.1')),
                  DataCell(Text('12.3')),
                  DataCell(Text('11.0')),
                  DataCell(Text('12345')),
                ]),
                DataRow(cells:[
                  DataCell(Text('MNQ')),
                  DataCell(Text('123.1')),
                  DataCell(Text('12.3')),
                  DataCell(Text('11.0')),
                  DataCell(Text('12345')),
                ]),
                DataRow(cells:[
                  DataCell(Text('MNQ')),
                  DataCell(Text('123.1')),
                  DataCell(Text('12.3')),
                  DataCell(Text('11.0')),
                  DataCell(Text('12345')),
                ]),
                DataRow(cells:[
                  DataCell(Text('MNQ')),
                  DataCell(Text('123.1')),
                  DataCell(Text('12.3')),
                  DataCell(Text('11.0')),
                  DataCell(Text('12345')),
                ]),
                DataRow(cells:[
                  DataCell(Text('MNQ')),
                  DataCell(Text('123.1')),
                  DataCell(Text('12.3')),
                  DataCell(Text('11.0')),
                  DataCell(Text('12345')),
                ]),
                DataRow(cells:[
                  DataCell(Text('MNQ')),
                  DataCell(Text('123.1')),
                  DataCell(Text('12.3')),
                  DataCell(Text('11.0')),
                  DataCell(Text('12345')),
                ]),
                DataRow(cells:[
                  DataCell(Text('MNQ')),
                  DataCell(Text('123.1')),
                  DataCell(Text('12.3')),
                  DataCell(Text('11.0')),
                  DataCell(Text('12345')),
                ]),
                DataRow(cells:[
                  DataCell(Text('MNQ')),
                  DataCell(Text('123.1')),
                  DataCell(Text('12.3')),
                  DataCell(Text('11.0')),
                  DataCell(Text('12345')),
                ]),
                DataRow(cells:[
                  DataCell(Text('MNQ')),
                  DataCell(Text('123.1')),
                  DataCell(Text('12.3')),
                  DataCell(Text('11.0')),
                  DataCell(Text('12345')),
                ]),
                DataRow(cells:[
                  DataCell(Text('MNQ')),
                  DataCell(Text('123.1')),
                  DataCell(Text('12.3')),
                  DataCell(Text('11.0')),
                  DataCell(Text('12345')),
                ]),
                DataRow(cells:[
                  DataCell(Text('MNQ')),
                  DataCell(Text('123.1')),
                  DataCell(Text('12.3')),
                  DataCell(Text('11.0')),
                  DataCell(Text('12345')),
                ]),DataRow(cells:[
                  DataCell(Text('MNQ')),
                  DataCell(Text('123.1')),
                  DataCell(Text('12.3')),
                  DataCell(Text('11.0')),
                  DataCell(Text('12345')),
                ])
              ],
                // rows: rows
            ),
          ),
        ))
      ],
    );
  }
}
