import 'package:flutter/material.dart';
class CashTransferScreen extends StatefulWidget {
  const CashTransferScreen({super.key});

  @override
  State<CashTransferScreen> createState() => _CashTransferScreenState();
}

class _CashTransferScreenState extends State<CashTransferScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Cash Transfer'),
    );
  }
}
