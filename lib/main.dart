import 'package:api_project/algorithms/algorithmFunctions.dart';
import 'package:api_project/algorithms/connectingApi.dart';
import 'package:api_project/widgets/widgetFunctions.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyHomePage());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ///all information from file api
  String body = '';

  ///sort alphabetically for list
  bool sortAlphabetically = false;

  ///sort reversed for list
  bool sortReversed = false;

  @override
  void initState() {
    super.initState();
    initializationApi();
  }

  ///initialization Api and get body string
  initializationApi() async {
    body = await ConnectionToApi().connecttingApi(
        'https://api.github.com/repos/lodash/lodash');
    setState(() {});
  }

  ///writing buttons to the list of interfaces and can calling from this list to the interface
  List<Widget> showButton() {
    return [
      const Padding(padding: EdgeInsets.only(top: 5)),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buttonWidget('Sort alphabetically', () {
            setState(() {
              sortAlphabetically = !sortAlphabetically;
            });
          }, sortAlphabetically),
          buttonWidget('Sort reversed', () {
            setState(() {
              sortReversed = !sortReversed;
            });
          }, sortReversed),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: const Text(
              'Api Information',
              style: TextStyle(color: Colors.white),
            ),
            bottom: const TabBar(
              indicatorWeight: 5,
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  child: Text(
                    'All symbols',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                Tab(
                  child: Text(
                    'Only letters',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.grey[300],
          body: TabBarView(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    //padding top
                    showButton()[0],
                    //show all buttons
                    showButton()[1],
                    //show list data (all symbols)
                    printWidget(
                        sortList(
                            countLettersFrequency(body), sortAlphabetically),
                        sortReversed,
                        width),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    //padding top
                    showButton()[0],
                    //show all buttons
                    showButton()[1],
                    //show list data (only letters)
                    printWidget(
                        sortList(
                            countLettersFrequency(getAllLettersFromFile(body)),
                            sortAlphabetically),
                        sortReversed,
                        width),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
