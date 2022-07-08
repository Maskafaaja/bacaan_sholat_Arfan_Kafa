import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
class About extends StatefulWidget {
  const About({ Key? key }) : super(key: key);

  @override
  State<About> createState() => _AboutState();

}
class datapp {
  final String nama;
  final String nim;
  final String githuburl;

  datapp(this.nama, this.nim, this.githuburl);
}

final List<datapp> _dataapp = <datapp>[
  datapp('Kafa Billah', '190103190', 'https://www.instagram.com/kafabllh_/'),
  datapp(
      'Arfan Jauhari', '190103180', 'https://www.instagram.com/arfanjauhari/'),
  
];

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Card(
                    child: ListTile(
                        title: Text(_dataapp[index].nama),
                           
                        subtitle: Text(
                          'NIM ' + _dataapp[index].nim,
                          
                        ),
                        leading: CircleAvatar(
                         backgroundColor: Color.fromARGB(255, 14, 20, 70),
                          child: Text(
                              _dataapp[index]
                                  .nama[0], // ambil karakter pertama text
                              style: TextStyle(fontSize: 20)),
                        ),
                        trailing: GestureDetector(
                          onTap: (() {
                            launchUrlString(_dataapp[index].githuburl);
                          }),
                          child: Image(
                            image: AssetImage('assets/images/instagram.png'),
                            height: 40,
                          ),
                        )));
              },
              itemCount: _dataapp.length,
            ),
          ),
          )
        ],
      ),
      
    );
  }
}