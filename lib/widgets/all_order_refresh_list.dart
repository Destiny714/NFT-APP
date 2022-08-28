import 'package:flutter/material.dart';

class AllOrderRefreshList extends StatefulWidget {
  const AllOrderRefreshList({Key? key}) : super(key: key);

  @override
  AllOrderRefreshListState createState() => AllOrderRefreshListState();
}

class AllOrderRefreshListState extends State<AllOrderRefreshList>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container();
  }

  @override
  bool get wantKeepAlive => true;
}
