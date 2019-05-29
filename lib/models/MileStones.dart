import 'package:cloud_firestore/cloud_firestore.dart';

class Milestones {
  final String title;
  final int id, projectId;
  final List<String> milestonesImages;
  final bool completed;
  final DocumentReference reference;

  Milestones(this.title, this.id, this.projectId, this.milestonesImages, this.completed, this.reference);

  Milestones.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['id'] != null),
        assert(map['projectId'] != null),
        assert(map['title'] != null),
        assert(map['completed'] != null),
        assert(map['milestonesImages'] != null),
        id = map['id'],
        projectId = map['projectId'],
        title = map['title'],
        completed = map['completed'],
        milestonesImages = map['milestonesImages'];


  Milestones.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$id:$title:$projectId::$completed>";


}