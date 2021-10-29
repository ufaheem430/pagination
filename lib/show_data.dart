import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:paginate_firestore/paginate_firestore.dart';

class ShowData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PaginateFirestore(
        //item builder type is compulsory.
        itemBuilder: (index, context, documentSnapshot) {
          final data = documentSnapshot.data() as Map;
          return ListTile(
            leading: CircleAvatar(child: Text(data['age'].toString())),
            title: data == null ? Text('Error in data') : Text(data['name']),
            subtitle: Text(data['city']),
            trailing: Text(data['education']),
          );
        },
        // orderBy is compulsory to enable pagination
        query: FirebaseFirestore.instance.collection('users'),
        //Change types accordingly
        itemBuilderType: PaginateBuilderType.listView,
        // to fetch real-time data
        isLive: false,
      ),
    );
  }
}
