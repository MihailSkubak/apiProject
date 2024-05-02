// ignore_for_file: file_names
import 'package:flutter/material.dart';

///create a list of interfaces from data files (From Map value)
Widget printWidget(Map<String, int> frequencyMap, bool reversed, double width) {
  List<Widget> tmp = [];
  frequencyMap.forEach((letter, count) {
    tmp.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            letter,
            style:
                const TextStyle(color: Colors.white, fontSize: 30, height: 1),
          ),
          Text(
            "$count",
            style:
                const TextStyle(color: Colors.white, fontSize: 30, height: 1),
          ),
        ],
      ),
    );
  });
  if (reversed) {
    tmp = tmp.reversed.toList();
  }
  return Column(
    children: [
      for (int i = 0; i < tmp.length; i++)
        Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: const EdgeInsets.all(5.0),
            width: width - 10,
            height: 50,
            alignment: Alignment.center,
            child: tmp[i])
    ],
  );
}

///interface for button with rounded edges
Widget buttonWidget(String text, Function() onTab, bool value) {
  return Container(
    decoration: BoxDecoration(
      color: value ? Colors.green : Colors.grey,
      borderRadius: BorderRadius.circular(10),
    ),
    child: TextButton(
      onPressed: onTab,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    ),
  );
}
