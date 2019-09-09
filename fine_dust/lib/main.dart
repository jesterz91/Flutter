import 'dart:convert';

import 'package:fine_dust/air_result.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FineDust Info',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '미세먼지'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AirResult _airResult;

  @override
  void initState() {
    super.initState();
    _fetchData().then((result) {
      setState(() {
        print(result);
        _airResult = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _airResult == null
              ? CircularProgressIndicator()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('대기상태 ${_getStatus(_airResult)}', style: Theme.of(context).textTheme.headline,),
                    SizedBox(height: 16,),
                    Card(
                      child: Column(
                        children: <Widget>[
                          Container(
                            color: _getColor(_airResult),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: <Widget>[
                                  Text("날씨"),
                                  Text("미세먼지"),
                                  Text("풍속"),
                                ],
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Image.network("https://www.airvisual.com/images/${_airResult.info.current.weather.ic}.png"
                                    , width: 32, height: 32,),
                                    Text("${_airResult.info.current.weather.tp} ℃"),
                                  ],
                                ),
                                Text("${_airResult.info.current.pollution.aqius} ㎍/m³"),
                                Text("${_airResult.info.current.weather.ws} m/s"),
                              ],
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: RaisedButton(
                          child: Icon(
                            Icons.refresh,
                          ),
                          color: Colors.amberAccent,
                          onPressed: () {
                            setState(() {
                              _airResult = null;
                            });

                            _fetchData().then((result) {
                              setState(() {
                                _airResult = result;
                              });
                            });
                          }),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Future<AirResult> _fetchData() async {
    final apiKey = "YOUR_API_KEY";
    var response = await http.get("http://api.airvisual.com/v2/nearest_city?key=$apiKey");
    return AirResult.fromJson(jsonDecode(response.body));
  }

  Color _getColor(AirResult airResult) {
    var aqius = airResult.info.current.pollution.aqius;
    if (aqius >= 50) {
      return Colors.lightGreen;
    } else if (aqius >= 100) {
      return Colors.orange;
    } else if (aqius >= 150) {
      return Colors.yellow;
    } else {
      return Colors.red;
    }
  }

  String _getStatus(AirResult airResult) {
    var aqius = airResult.info.current.pollution.aqius;
    if (aqius >= 50) {
      return "좋음";
    } else if (aqius >= 100) {
      return "보통";
    } else if (aqius >= 150) {
      return "나쁨";
    } else {
      return "최악";
    }
  }
}
