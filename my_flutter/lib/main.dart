import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(SampleApp());
}

class SampleApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter app demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SampleAppPage(),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() => _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  static const _platform =
      const MethodChannel('com.example.lap12419.myapplication');
  String _name = "No data";

  @override
  void initState() {
    super.initState();
    _getName();
  }

  @override
  Widget build(BuildContext context) => new Scaffold(
        appBar: new AppBar(
          title: new Text("Flutter View"),
        ),
        body: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Expanded(
              child: new Center(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text(
                      'Hello $_name.',
                      style: const TextStyle(fontSize: 20.0),
                    ),
                    new Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: new RaisedButton(
                          child: const Text('Go to Android view'),
                          onPressed: _showNativeView),
                    ),
                  ],
                ),
              ),
            ),
            new Container(
              padding: const EdgeInsets.only(bottom: 15.0, left: 5.0),
              child: new Row(
                children: <Widget>[
                  const Text(
                    'Flutter',
                    style: const TextStyle(
                        fontSize: 30.0, color: Colors.lightBlue),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  _getName() async {
    var name = await _platform.invokeMethod("getName");
    if (name != null) {
      setState(() {
        _name = name;
      });
    }
  }

  _showNativeView() async {
    await _platform.invokeMethod('showNativeView');
  }
}
