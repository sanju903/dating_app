import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AppUser {
  String id;

  AppUser({
    @required this.id,
  });

  AppUser.fromSnapshot(DocumentSnapshot snapshot,Map docdata) {
    id = snapshot.id;
    print("Getting Appusers user id"+id);
  }
}
