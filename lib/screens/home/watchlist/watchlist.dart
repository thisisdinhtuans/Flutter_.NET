//cú pháp stful sẽ tạo ra cái Stateful
import 'package:flutter/material.dart';

class WatchListScreen extends StatefulWidget {
  const WatchListScreen ({super.key});

  @override
  State<WatchListScreen> createState() => _WatchListScreenState();
}

class _WatchListScreenState extends State<WatchListScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('This is WatchList')
    );
  }
}
