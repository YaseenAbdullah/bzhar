import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter_offline/flutter_offline.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'bzhar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TheMain(),
    );
  }
}

class TheMain extends StatefulWidget {
  @override
  _TheMainState createState() => _TheMainState();
}

class _TheMainState extends State<TheMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OfflineBuilder(
          connectivityBuilder: (BuildContext context,
              ConnectivityResult connectivity, Widget child) {
            final bool connected = connectivity != ConnectivityResult.none;
            return Stack(
              fit: StackFit.expand,
              children: [
                child,
                Positioned(
                  left: 0.0,
                  right: 0.0,
                  height: MediaQuery.of(context).size.height,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    color: connected ? null : Color(0xFFEE4400),
                    child: connected
                        ? MyHomePage()
                        : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.signal_wifi_off,
                          color: Colors.white,
                          size: 50,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        SizedBox(
                          width: 22.0,
                          height: 22.0,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.0,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
          child: MyHomePage()),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WebviewScaffold(
        hidden: true,
        url: 'https://bzhar.paveleng.com/',
        withJavascript: true,
      ),
    );
  }
}
