import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AddDestinationsOptions extends StatefulWidget {
  const AddDestinationsOptions({super.key});
  @override
  State<AddDestinationsOptions> createState() => _AddDestinationsOptions();
}

class _AddDestinationsOptions extends State<AddDestinationsOptions> {
  int items = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.1,
        maxChildSize: 0.5,
        minChildSize: 0.05,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            color: const Color.fromRGBO(64, 182, 216, 0.15),
            child: Column(
              children: [
                Row(children: [
                  SizedBox(width: MediaQuery.of(context).size.height * 0.01),
                  Text("Total stops: $items"),
                  IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        items++;
                        setState(() {});
                      }),
                ]),
                Expanded(
                    child: ListView.builder(
                        controller: scrollController,
                        itemCount: items,
                        itemBuilder: (BuildContext context, items) {
                          return ListTile(
                            title: Text("Item: $items"),
                          );
                        }))
              ],
            ),
          );
        });
  }
}

class MainView extends StatelessWidget {
  const MainView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerDragStartBehavior: DragStartBehavior.start,
      appBar: AppBar(
          backgroundColor: const Color.fromRGBO(64, 162, 216, 0.25),
          title: const Text("Profile bar"),
          leading: IconButton(
              icon: const Icon(Icons.line_weight), onPressed: () {})),
      body: const Stack(
        children: [
          AddDestinationsOptions(),
        ],
      ),
    );
  }
}
