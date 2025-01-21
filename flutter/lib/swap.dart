import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        child: ContentView(),
      ),
    );
  }
}

class ContentView extends StatefulWidget {
  @override
  _ContentViewState createState() => _ContentViewState();
}

class _ContentViewState extends State<ContentView> {
  bool isSwapped = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: <Widget>[
            if (!isSwapped) ...[
              MyCard(
                  color: CupertinoColors.systemBlue,
                  id: 'cardA',
                  child: Text('Card A')),
              MyCard(
                  color: CupertinoColors.systemOrange,
                  id: 'cardB',
                  child: Text('Card B')),
            ] else ...[
              MyCard(
                  color: CupertinoColors.systemOrange,
                  id: 'cardB',
                  child: Text('Card B')),
              MyCard(
                  color: CupertinoColors.systemBlue,
                  id: 'cardA',
                  child: Text('Card A')),
            ],
            CupertinoButton(
              onPressed: () {
                setState(() {
                  isSwapped = !isSwapped;
                });
              },
              child: Icon(CupertinoIcons.arrow_up_arrow_down),
            ),
          ],
        ),
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  final Color color;
  final String id;
  final Widget child;

  MyCard({required this.color, required this.id, required this.child});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: id,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(child: child),
      ),
    );
  }
}
