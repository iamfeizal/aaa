import 'package:flutter/material.dart';
import 'package:kuis_0/detailTourism.dart';
import 'package:kuis_0/dataTourism.dart';

class ListTourism extends StatelessWidget {
  const ListTourism({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("KUIS"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              final TourismPlace place = tourismPlaceList[index];
              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return TourismList(tourIdx: index);
                      }));
                    },
                    child: Card(
                      child: Container(
                        width: 180,
                        height: 180,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.network(
                                place.imageUrls[0],
                                width: 100,
                              ),
                              Text(place.name),
                              Text(place.ticketPrice)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
            itemCount: tourismPlaceList.length,
          ),
        ));
  }
}
