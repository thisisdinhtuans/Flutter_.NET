import 'package:flutter/material.dart';
class Industry extends StatefulWidget {
  const Industry({super.key});

  @override
  State<Industry> createState() => _IndustryState();
}

class _IndustryState extends State<Industry> {
  final TextEditingController _controller=TextEditingController();
  final List<String> industries=[
    'Software & Services',
    'Technology Hardware & Equipment',
    'Banking',
    'Retailing'
  ];
  String _selectedIndustry='';
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
                  hint: const Text('Select Industry'),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  //nếu không có thì lấy phần tử đầu tiên, còn nếu không có thì lấy phần tử được chọn, còn nếu mà trong trường hợp phần tử đầu tiên bị null thì lấy '', cái ?? '' đó
                  value: _selectedIndustry.isEmpty ? null : _selectedIndustry,

                  //_indexes lấy ở trên là một danh sách list
                  items: industries.map<DropdownMenuItem<String>>((String value) {
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
                      _selectedIndustry = selectedItem ?? '';
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
