import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Flutter Demo',
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.systemBlue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _widgetCount = 0;

  void _addWidget() {
    setState(() {
      _widgetCount++;
    });
  }

  void _removeWidget() {
    setState(() {
      if (_widgetCount > 0) {
        _widgetCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(widget.title),
        trailing: Row(
          children: [
            CupertinoButton(
              onPressed: _addWidget,
              child: Icon(CupertinoIcons.add),
            ),
            CupertinoButton(
              onPressed: _removeWidget,
              child: Icon(CupertinoIcons.minus),
            ),
          ],
        )
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 100.0),
          child: GridView.count(
            crossAxisCount: 5,
            children: [
              for (var i = 0; i < _widgetCount; i++) const MyAnimatedWidget(),
            ],
          ),
        ),
      ),

    );
  }
}

class MyAnimatedWidget extends StatefulWidget {
  const MyAnimatedWidget({super.key});

  @override
  State<MyAnimatedWidget> createState() => _MyAnimatedWidgetState();
}

class _MyAnimatedWidgetState extends State<MyAnimatedWidget> {
  double _targetValue = 1.0;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: _targetValue),
      duration: const Duration(seconds: 1),
      builder: (context, opacity, child) {
        return Opacity(
          opacity: opacity,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              decoration: BoxDecoration(
                color: CupertinoColors.systemBlue,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        );
      },
    );
  }
}