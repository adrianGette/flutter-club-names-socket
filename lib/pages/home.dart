import 'package:flutter/material.dart';
import 'package:club_names/models/club.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Club> clubs = [
    Club(id: '1', name: 'San Lorenzo', votes: 3),
    Club(id: '2', name: 'River', votes: 3),
    Club(id: '3', name: 'Boca', votes: 2),
    Club(id: '4', name: 'Independiente', votes: 1),
    Club(id: '5', name: 'Racing', votes: 1),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clubes Argentinos', style: TextStyle( color: Colors.yellowAccent )),
        backgroundColor: Colors.black,
        elevation: 3,
      ),
      body: ListView.builder(
        itemCount: clubs.length,
        itemBuilder: (context, i) => _clubTile(clubs[i])
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.add ),
        elevation: 3,
        backgroundColor: Colors.yellowAccent,
        foregroundColor: Colors.black,
        onPressed: addNewClub,
      ),
    );
  }

  Widget _clubTile( Club club ) {
    return Dismissible(
          key: Key(club.id),
          direction: DismissDirection.startToEnd,
          onDismissed: (direction) {
            print('direction: $direction');
            // TODO: llamar borrado en el servidor
          },
          background: Container(
            padding: EdgeInsets.only( left: 8.0 ),
            color: Colors.red,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Borrar Club', style: TextStyle( color: Colors.white )),
            ),
          ),
          child: ListTile(
            leading: CircleAvatar(
              child: Text( club.name.substring(0, 2) ),
              backgroundColor: Colors.black54,
            ),
            title: Text( club.name ),
            trailing: Text( '${club.votes}', style: TextStyle( fontSize: 20 ) ),
            onTap: () {
              print(club.name);
            },
          ),
    );
  }


  addNewClub(){

    final textController = new TextEditingController();
    
    showDialog(
      context: context,
      builder: ( context ) {
        return AlertDialog(
          title: Text('Nuevo nombre de Club:'),
          content: TextField(
            controller: textController,
          ),
          backgroundColor: Colors.yellowAccent,
          actions: <Widget>[
            MaterialButton(
              child: Text('Agregar'),
              elevation: 5,
              color: Colors.black,
              textColor: Colors.yellowAccent,
              onPressed: () => addClubToList( textController.text )
            )
          ],
        );
      },

    );

  }


  void addClubToList( String name ) {

    if(name.length > 1) {
      // Podemos agregar
      this.clubs.add( new Club(id: DateTime.now().toString(), name: name, votes: 0) );
      setState(() {});
    }

    Navigator.pop(context);

  }


}