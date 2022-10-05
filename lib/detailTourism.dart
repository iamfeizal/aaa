import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:kuis_0/dataTourism.dart';

class TourismList extends StatefulWidget {
  final int tourIdx;

  const TourismList({Key? key, required this.tourIdx}) : super(key: key);

  @override
  State<TourismList> createState() => _TourismListState();
}

class _TourismListState extends State<TourismList> {
  @override
  bool toggle = false;

  Widget build(BuildContext context) {
    final TourismPlace place = tourismPlaceList[widget.tourIdx];
    return Scaffold(
        appBar: AppBar(
          title: Text(place.name),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: IconButton(
                icon:
                    toggle ? Icon(Icons.favorite_border) : Icon(Icons.favorite),
                onPressed: () {
                  setState(() {
                    toggle = !toggle;
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () async {
                    if (!await launch(place.imageUrls[1]))
                      throw 'Could not launch ${place.imageUrls[1]}';
                  }),
            )
          ],
        ),
        body: ListView(children: [
          Column(
            children: [
              Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Image.network(place.imageUrls[0]),
                    ),
                    Text(
                      place.name,
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    Text(place.openDays),
                    Text("${place.openTime} | ${place.location}"),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Card(
                color: Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Text(
                          "# |",
                          style: TextStyle(color: Colors.white),
                        ),
                        title: Text(
                          "Song List",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: SingleChildScrollView(
                    child: SizedBox(height: 400, child: _build_tourismlist())),
              )
            ],
          )
        ]));
  }

  Widget _build_tourismlist() {
    TourismPlace place = tourismPlaceList[widget.tourIdx];
    return ListView.builder(
        itemBuilder: (context, index) {
          return InkWell(
            child: Card(
                child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  ListTile(
                    leading: Text("${index + 1} |"),
                    title: Text(place.ticketPrice[index]),
                  )
                ],
              ),
            )),
          );
        },
        itemCount: place.ticketPrice.length);
  }
}
