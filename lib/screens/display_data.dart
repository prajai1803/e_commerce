import 'package:e_commerce/networking/api_data.dart';
import 'package:e_commerce/screens/product_view.dart';
import 'package:flutter/material.dart';

class APIDataShow extends StatefulWidget {
  const APIDataShow({Key? key}) : super(key: key);

  @override
  State<APIDataShow> createState() => _APIDataShowState();
}

class _APIDataShowState extends State<APIDataShow> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  var check = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API Data "),
      ),
      body: Center(
        child: SizedBox(
          height: 500,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                check
                    ? FutureBuilder(
                        future: getData(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List<ApiData> dData =
                                snapshot.data as List<ApiData>;
                            return Column(
                              children: dData
                                  .map(
                                    (e) => Card(
                                      child: Column(
                                        children: [
                                          Text(e.title),
                                          Text(e.description),
                                          Image.network(e.thumbnail)
                                        ],
                                      ),
                                    ),
                                  )
                                  .toList(),
                            );
                          } else {
                            return CircularProgressIndicator();
                          }
                        })
                    : CircularProgressIndicator(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  fetchData() async {
    List cData = await getData();
    if (cData.length > 0) {
      check = true;
    } else {}
    setState(() {});
  }
}
