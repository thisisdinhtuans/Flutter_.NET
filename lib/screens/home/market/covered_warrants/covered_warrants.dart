import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
class CoveredWarrants extends StatefulWidget {
  const CoveredWarrants({super.key});

  @override
  State<CoveredWarrants> createState() => _CoveredWarrantsState();
}

class _CoveredWarrantsState extends State<CoveredWarrants> {
  final TextEditingController _controller=TextEditingController();
  final List<String> _symbols=[
    'MSN',
    'POW',
    'STB',
    'MSG',
  ];
  String _selectedSymbol='';
  final List<String> _issuers=[
    'HSC',
    'SSI',
    'ACBS',
    'PHS',
  ];
  String _selectedIssuer='';

  //khai báo lúc đầu là không show lên, để hiện DatePicker thì chúng ta phải cài thư viện ở pubspec.yaml là syncfusion_flutter_datepicker: ^21.2.3
  bool _showDatePicker = false;
  DateTime _startDate=DateTime.now();
  DateTime _endDate=DateTime.now();
  @override
  Widget build(BuildContext context) {
    //bây giờ muốn bấm cái lịch mà nó hiện lên trên cái bảng thì sử dụng cái Stack
    return Stack(
      children: [
        //cái này được hiểu là bấm ra ngoài sẽ mất cái đó đi. bấm vào choose date thì sẽ hiện lại, còn bấm ra ngoài thì tự xuống.
        GestureDetector(
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child:
                  DropdownButton<String>(
                      icon: const Icon(Icons.arrow_downward),
                      hint: const Text('Choose one'),
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      //nếu không có thì lấy phần tử đầu tiên, còn nếu không có thì lấy phần tử được chọn, còn nếu mà trong trường hợp phần tử đầu tiên bị null thì lấy '', cái ?? '' đó
                      value: _selectedSymbol.isEmpty ? null : _selectedSymbol,

                      //_indexes lấy ở trên là một danh sách list
                      items: _symbols.map<DropdownMenuItem<String>>((String value) {
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
                          _selectedSymbol = selectedItem ?? '';
                        });
                      }),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child:
                  DropdownButton<String>(
                      icon: const Icon(Icons.arrow_downward),
                      hint: const Text('Choose one'),
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      //nếu không có thì lấy phần tử đầu tiên, còn nếu không có thì lấy phần tử được chọn, còn nếu mà trong trường hợp phần tử đầu tiên bị null thì lấy '', cái ?? '' đó
                      value: _selectedIssuer.isEmpty ? null : _selectedIssuer,

                      //_indexes lấy ở trên là một danh sách list
                      items: _issuers.map<DropdownMenuItem<String>>((String value) {
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
                          _selectedIssuer = selectedItem ?? '';
                        });
                      }),
                ),
                SizedBox(width: 10,),
                InkWell(
                  child: Row(
                    children: [
                      const Text('Choose date', style: TextStyle(fontSize: 16),),
                      // const SizedBox(width: 5,),
                      const Icon(Icons.date_range)
                    ],
                  ),
                  //bấm vào cái onTap này thì nó  hiện ra cái chọn ngày thì sử dụng onTap
                  onTap: (){
                    setState(() {
                      _showDatePicker = true;
                    });
                  },
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
        ),
            onTap:() {
              if(_showDatePicker) {
                setState(() {
                  _showDatePicker=false;
                });
              }
            }
        ),
        if(_showDatePicker)
          Positioned(
            left: 0,
              bottom: 0,
              right: 0,
              child: SfDateRangePicker (
            backgroundColor: Colors.white,
            onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
              //sẽ kiểm tra kiểu dữ liệu của thuộc tính value nó là PickerDateRange, nó mới bắt đầu lấy ra cái startdate và cái endDate
              if(args.value is PickerDateRange) {
                setState(() {
                  // ?. tức là lấy ra null thì giá trị không thay đổi, là giá trị cũ. dấu ?? là lấy giá trị mặc định trong trường hợp lấy ra là null vì nó lấy ra giá trị cũ.
                  _startDate = ((args.value as PickerDateRange).startDate) ?? _startDate;
                  _endDate = ((args.value as PickerDateRange).endDate) ?? _endDate;
                });
              }
            },
            selectionMode: DateRangePickerSelectionMode.range,
            //initialSelected tức là lấy ngày hiện tại trừ đi 4, lấy ngày hiện tại cộng thêm 3, đó là giá trị ban đầu, select sẵn cho mỗi chúng ta
            initialSelectedRange: PickerDateRange(
              DateTime.now().subtract(const Duration(days: 4)),
              DateTime.now().add(const Duration(days: 3))
            ),
          ))
      ],
    );
  }
}
