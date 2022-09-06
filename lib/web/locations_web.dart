import 'dart:convert';

import 'package:http/http.dart';
import 'package:ricky_pedia/constants/constants.dart';
import 'package:ricky_pedia/model/info.dart';
import 'package:ricky_pedia/model/location.dart';

Future<List<Location>> getLocations({int page = 1}) async {
  final response = await get(Uri.parse(
          '${Constants.baseURL}${Constants.locationEndpoint}?page=$page'))
      .timeout(const Duration(seconds: 20));

  if (response.statusCode == 200) {
    final Map<String, dynamic> res = jsonDecode(response.body);

    final Info inf = Info.fromJson(res['info']);

    List<Map<String, dynamic>> results = List.empty(growable: true);

    results.addAll(List<Map<String, dynamic>>.from(res['results']));

    List<Location> locations =
        List<Location>.from(results.map((e) => Location.fromJson(e)));

    return locations;
  } else {
    return [];
  }
}
