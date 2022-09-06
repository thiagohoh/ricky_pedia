import 'package:flutter/material.dart';
import 'package:ricky_pedia/components/loading.dart';
import 'package:ricky_pedia/model/location.dart';
import 'package:ricky_pedia/web/locations_web.dart';

class Locations extends StatelessWidget {
  const Locations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Locations"),
      ),
      body: const LocationsList(),
    );
  }
}

class LocationsList extends StatefulWidget {
  const LocationsList({Key? key}) : super(key: key);

  @override
  State<LocationsList> createState() => _LocationsListState();
}

class _LocationsListState extends State<LocationsList> {
  final ScrollController _scrollController = ScrollController();
  late Future<List<Location>> futureLocations;
  List<Location> locationsList = List.empty(growable: true);
  int currentPage = 1;
  bool allLoaded = false;

  @override
  void initState() {
    super.initState();
    futureLocations = getLocations();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent &&
          !allLoaded) {
        setState(() {
          currentPage++;
          futureLocations = getLocations(page: currentPage);
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.white60,
        child: FutureBuilder(
            future: futureLocations,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Loading();

                case ConnectionState.waiting:
                  return const Loading();
                case ConnectionState.active:
                  return const Loading();
                case ConnectionState.done:
                  if (snapshot.connectionState == ConnectionState.done) {
                    final List<Location> list = snapshot.data as List<Location>;
                    if (list.isNotEmpty) {
                      locationsList.addAll(list);
                    }
                    return ListView.builder(
                        controller: _scrollController,
                        itemCount: locationsList.length,
                        itemBuilder: (context, index) {
                          return LocationDisplay(
                            location: locationsList[index],
                          );
                        });
                  }
              }
              return const Text("Error");
            }),
      ),
    );
  }
}

class LocationDisplay extends StatelessWidget {
  const LocationDisplay({Key? key, required this.location}) : super(key: key);

  final Location location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          isThreeLine: true,
          style: ListTileStyle.drawer,
          title: Text(location.name,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.green, fontSize: 32)),
          subtitle: FittedBox(
            child: Column(children: <Widget>[
              RichText(
                text: TextSpan(
                    text: "Dimension: ",
                    children: [TextSpan(text: location.dimension)],
                    style: const TextStyle(fontSize: 6, color: Colors.black)),
              ),
              RichText(
                  text: TextSpan(
                      text: "Type: ",
                      children: [TextSpan(text: location.type)],
                      style:
                          const TextStyle(fontSize: 6, color: Colors.black))),
            ]),
          ),
        ),
      ),
    );
  }
}
