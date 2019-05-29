import 'package:cloud_firestore/cloud_firestore.dart';

class Project {
  final String assignmentTitle,companyName,contactPerson,phoneNumber,description;
  final int id, milestoneCount,milestoneCompleteCount;
  final DocumentReference reference;
  final List<String> projectImages;


  Project(this.assignmentTitle, this.companyName, this.contactPerson,
      this.phoneNumber, this.id, this.milestoneCount,
      this.milestoneCompleteCount, this.reference, this.description, this.projectImages);

  Project.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['id'] != null),
        assert(map['assignmentTitle'] != null),
        assert(map['companyName'] != null),
        assert(map['contactPerson'] != null),
        assert(map['phoneNumber'] != null),
        assert(map['milestoneCount'] != null),
        assert(map['milestoneCompleteCount'] != null),
        assert(map['description'] != null),
        assert(map['projectImages'] != null),
        id = map['id'],
        assignmentTitle = map['assignmentTitle'],
        companyName = map['companyName'],
        contactPerson = map['contactPerson'],
        phoneNumber = map['phoneNumber'],
        milestoneCount = map['milestoneCount'],
        milestoneCompleteCount = map['milestoneCompleteCount'],
        description = map['description'],
        projectImages = map['projectImages'];

  Project.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$id:$assignmentTitle:$companyName:$contactPerson:$phoneNumber:$milestoneCount>";


}
