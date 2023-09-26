

import 'package:movie/views/content_page.dart';

import '../ui.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
            title: Text(
              "Book Movie",
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white,
            centerTitle: true,
            iconTheme: IconThemeData(color: Colors.black),
            leading: GestureDetector(
              onTap: () {},
              child: Icon(Icons.menu),
            ),
            actions: [
              IconButton(
                onPressed: () => {},
                icon: Icon(Icons.mode_night_outlined),
              ),
            ],
            bottom: TabBar(tabs: [
              Tab(
                  child: Text(
                    'Popular',
                    style: TextStyle(color: Colors.black),
                  )),
              Tab(
                child: Text(
                  'Top Rated',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                child: Text(
                  'Upcoming',
                  style: TextStyle(color: Colors.black),
                ),
              )
            ])),
        body: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            children: [for(int i =0;i<10;i++)Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(height: 50,width: 50,child:GestureDetector(onTap:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ContentPage()));
                  },child:Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSg-3382ZgdUhzsOz0VYE8KVNtX_HTwTxRSps08Nli1&s'))),
                ),
                Text('The Super Mario Bros'),
              ],
            ),
            ]


        ),
      ),
    );
  }
}

