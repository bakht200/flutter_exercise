import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:productbox_flutter_exercise/controller/controller.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var data = Get.put(Controllerclass());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Obx(
            ()=> data.getdata.length == 0
          ? Center(child: Column(
            children: [
              CircularProgressIndicator(),
              Text('Fetching'),
            ],
          ))
          :  Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height/7,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data.getdata.length,
                    itemBuilder: (builde, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 2,
                          width: MediaQuery.of(context).size.width / 3.5,
                          decoration: BoxDecoration(
                            color: const Color(0xff7c94b6),
                            image: DecorationImage(
                              image: NetworkImage(
                                  '${data.getdata[index].downloadUrl}'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(MediaQuery.of(context).size.height / 3.5)),
                            border: Border.all(

                              color: Theme.of(context).backgroundColor,
                              width:MediaQuery.of(context).size.width /3.4,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Divider(
                  color: Theme.of(context).backgroundColor,
                  height: 10,
                  thickness: 2,
                ),

                Container(
                    // color: Colors.red,
                    height: MediaQuery.of(context).size.height / 1.4,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: data.getdata.length,
                        itemBuilder: (builde, index) {
                          return Container(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        radius:
                                            MediaQuery.of(context).size.height /
                                                28,
                                        backgroundImage: NetworkImage(
                                            "${data.getdata[index].downloadUrl}"),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "${data.getdata[index].author}",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    width: double.infinity,
                                    child: Image.network(
                                        "${data.getdata[index].downloadUrl}"),
                                  ),
                                ),
                              ],
                            ),
                          );
                        })),
              ],
            ),
      ),
    );
  }
}
