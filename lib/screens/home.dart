import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jason_pass/models/influencer_data.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Influencer? influencer;

  @override
  void initState() {
    loadinfluencer();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<String> _loadAInfluencerAssets() async {
    return await rootBundle.loadString('assets/influencer.json');
  }

  Future loadinfluencer() async {
    String jsonString = await _loadAInfluencerAssets();
    final jsonResponse = json.decode(jsonString);
    Influencer ainfluencer = Influencer.fromJason(jsonResponse);

    setState(() {
      influencer = ainfluencer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                child: Image.network(
                  '${influencer?.profilepic}',
                  fit: BoxFit.cover,
                  height: 510,
                  width: double.infinity,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          '${influencer?.firstname}  ${influencer?.lastname}',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${influencer?.region} ,${influencer?.country}',
                          style: TextStyle(
                            fontSize: 9.5,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    Text(
                      '${influencer?.bio}',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w200,
                          height: 1.3),
                    ),
                  ],
                ),
              ),
              Container(
                height: 80,
                color: Colors.orange.shade50,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 14),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Post',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w200)),
                              Text('Followers',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w200,
                                  )),
                              Text('Following',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w200,
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.,
                            children: [
                              Text(
                                '${influencer?.post}',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                              ),
                              // SizedBox(
                              //   width: 60,
                              // ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 65),
                                child: Text(
                                  '${influencer?.followers}',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              // SizedBox(
                              //   width: 100,
                              // ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  '${influencer?.following}',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
            // Image.network('${influencer?.profilepic}'
          ),
        ),
        Positioned(
          top: 535,
          right: 28,
          child: FloatingActionButton(
            onPressed: () {},
            elevation: 0.0,
            backgroundColor: Colors.orange,
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 32,
            ),
          ),
        )
      ],
    );
  }
}
