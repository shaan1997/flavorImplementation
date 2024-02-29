import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'flavor_config.dart';
import 'main.dart';

void main() {
  FlavorConfig(flavor: Flavor.DEV,
      color: Colors.deepPurpleAccent,
      values: FlavorValues(baseUrl: "https://raw.githubusercontent.com/JHBitencourt/ready_to_go/master/lib/json/person_qa.json"));
  runApp(MyApp());
}