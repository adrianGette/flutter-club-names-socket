

class Club {

  String id;
  String name;
  int votes;

  Club({
    this.id,
    this.name,
    this.votes
  });


  factory Club.fromMap( Map<String, dynamic> obj )
    => Club(
      id: obj['id'],
      name: obj['name'],
      votes: obj['votes']
    );

}