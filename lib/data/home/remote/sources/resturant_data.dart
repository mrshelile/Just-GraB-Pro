import 'package:justgrab_pro/data/home/remote/DTOs/resturant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ResturantData {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Stream getData1() async* {
    // Get a reference to the restaurants collection
    final restaurantsRef = FirebaseFirestore.instance.collection("restaurants");

    // Stream of QuerySnapshots to listen for changes in the collection
    restaurantsRef.snapshots().listen((querySnapshot) {
      final restaurants = querySnapshot.docs.map((doc) {
        // Extract restaurant data from each document
        final data = doc.data() as Map<String, dynamic>;
        return ResturantModel(
            email_address: '',
            location: '',
            sub_name: '',
            name: '',
            phone_number: '');
      }).toList();

      // Yield the list of RestaurantModel instances
      // return restaurants;
    });
  }

  Stream getData() {
    // var res = firestore
    //     .collection("restaurants")
    //     .snapshots()

    // print(res.first);
    return Future(() => [
          ResturantModel(
              email_address: 'email2@thibos.com',
              name: 'Joseph',
              sub_name: "Best Bevs",
              phone_number: '+266 69356845',
              location: "Maseru"),
          ResturantModel(
              location: "Qoaling",
              email_address: 'emaile@thibos.com',
              name: 'Thibos',
              sub_name: "Best food",
              phone_number: '+266 69356845'),
          ResturantModel(
              location: "Quthing",
              email_address: 'email5@bevs.com',
              name: 'Lake Side',
              sub_name: "Best Bevs",
              phone_number: '+266 69356845'),
          ResturantModel(
              location: "Ha Thamae",
              email_address: 'email1@thibos.com',
              name: 'Thibos',
              sub_name: "Best food",
              phone_number: '+266 69356845'),
          ResturantModel(
              location: "T'senola",
              email_address: 'email1@thibos.com',
              name: 'Thibos',
              sub_name: "Best food",
              phone_number: '+266 69356845'),
          ResturantModel(
              location: "Leribe",
              email_address: 'email1@thibos.com',
              name: 'Thibos',
              sub_name: "Best food",
              phone_number: '+266 69356845'),
          ResturantModel(
              location: "Berea",
              email_address: 'email1@thibos.com',
              name: 'Thibos',
              sub_name: "Best food",
              phone_number: '+266 69356845')
        ]).asStream();
  }
}
