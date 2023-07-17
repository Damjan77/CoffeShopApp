import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:coffe_shop_app/model/map_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class MapController extends GetxController {
  List<MapModel> mapModel = <MapModel>[].obs;
  var markers = RxSet<Marker>();
  var isLoading = false.obs;

  fetchLocations() async {
    try {
      isLoading(true);
      http.Response response = await http.get(Uri.tryParse(
          'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=42.00478491557928,21.40917442067392&radius=1000&types=cafe&key=AIzaSyDzS5EdV9zNC08WSitS09Jw-YD_s7Fs398'
      )!);
      if (response.statusCode == 200) {
        ///data successfully
        var result = jsonDecode(response.body);
        log(result.toString());
        mapModel.addAll(RxList<Map<String, dynamic>>.from(result["results"])
            .map((e) => MapModel.fromJson(e))
            .toList());
      } else {
        print('error fetching data');
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isLoading(false);
      print('finaly: $mapModel');
      createMarkers();
    }
  }

  createMarkers(){
    mapModel.forEach((element){
      markers.add(Marker(
        markerId: MarkerId(element.placeId.toString()),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        position: LatLng(element.geometry.location.lat, element.geometry.location.lng),
        infoWindow: InfoWindow(title: element.name, snippet: element.vicinity),
        onTap: () {
          print('market tapped');
        },
      ));
    });
  }
}
