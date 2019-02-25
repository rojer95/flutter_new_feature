/**
 *   main.dart
 */
import 'package:flutter/material.dart';
// 引入新页面
import 'page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // 定义路由信息
  final Map<String, Function> routes = {
    '/page': (context, {arguments}) => Page(arguments: arguments)
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // 处理Named页面跳转 传递参数
      onGenerateRoute: (RouteSettings settings) {
        // 同一处理
        final String name = settings.name;
        final Function pageContentBuilder = this.routes[name];
        if (pageContentBuilder != null) {
          final Route route = MaterialPageRoute(
              builder: (context) =>
                  pageContentBuilder(context, arguments: settings.arguments));
          return route;
        }
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            // 进行Named页面跳转 传递参数
            Navigator.pushNamed(context, '/page', arguments: {'id': 1});
          },
          child: Text("go next page with params"),
        ),
      ),
    );
  }
}
