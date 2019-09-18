import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/model/idol.dart';

class IdolPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Idol"),
        ),
        body: StreamBuilder(
          stream: idolBloc.idolListStream,
          builder: (context, snapshot) {
            return ListView.builder(
              padding: const EdgeInsets.all(4),
              itemCount: idols.length,
              itemBuilder: (context, index) =>
                  _buildListTile(idols[index], snapshot.data));
          }
        )
    );
  }

  ListTile _buildListTile(Idol idol, List<Idol> idolList) {
    final isLiked = idolList?.contains(idol) ?? false;

    return ListTile(
      leading: isLiked
          ? Icon(Icons.favorite, color: Colors.red,)
          : Icon(Icons.favorite_border, color: Colors.red,),
      title: Text(idol.name),
      subtitle: Text('${idol.age}'),
      onTap: () => isLiked
          ? idolBloc.unlike(idol)
          : idolBloc.like(idol)
    );
  }
}