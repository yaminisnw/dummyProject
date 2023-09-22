import 'package:flutter/material.dart';

void main() {
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Movie(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Movie extends StatelessWidget {
  const Movie({super.key});

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
            children: [Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(height: 50,width: 50,child:Image.network('https://assetscdn1.paytm.com/images/cinema/Mario6-9b7d1aa0-70cc-11ed-836c-c1819813ea92.jpg'),),
                ),
                Text('The Super Mario Bros'),],
            ),Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(height: 50,width: 50,child:Image.network('https://m.media-amazon.com/images/M/MV5BYzRkNWYzNTMtMmVlYS00YTk4LWJkMWQtODJjMDllMjAxMjczXkEyXkFqcGdeQXVyMDM2NDM2MQ@@._V1_FMjpg_UX1000_.jpg'),),
                ),
                Text('Creed III'),],
            ),Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(height: 50,width: 50,child:Image.network('https://images.thedirect.com/media/article_full/avatar-3-release.jpg')),
                ),
              Text('Avatar:The way of water')],
            ),Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(height: 50,width: 50,child:Image.network('https://www.themoviedb.org/t/p/w500/qVdrYN8qu7xUtsdEFeGiIVIaYd.jpg'),),
                ),
             Text('Mummies') ],
            ),Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(height: 50,width: 50,child: Image.network('https://ottarasan.com/wp-content/uploads/2023/04/murder-mystery.jpg'),),
                ),
              Text(movieName[4])],
            ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(height: 50,width: 50,child: Image.network('https://www.uphe.com/sites/default/files/styles/scale__344w_/public/2018/04/PussInBoots_PosterArt.jpg?itok=d5m-WMBC'),),
                  ),
                Text(movieName[5])],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(height: 50,width: 50,child: Image.network('https://flxt.tmsimg.com/assets/p23546806_v_h8_ag.jpg'),),
                  ),
                Text(movieName[6])],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(height: 50,width: 50,child: Image.network('https://m.media-amazon.com/images/M/MV5BNGQ3YWRlZjktNTVkMS00NWZiLTgwNzEtMTFlNmM4NGViNDdiXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_.jpg'),),
                  ),
                Text(movieName[7])],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(height: 50,width: 50,child: Image.network('https://m.media-amazon.com/images/S/pv-target-images/6c2c7ace999b2efa7d6d113f7f3ec49f83722dbd2a22b202ef8028f26a1d0b69.jpg'),),
                  ),
                Text(movieName[8])],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(height: 50,width: 50,child: Image.network('https://m.media-amazon.com/images/M/MV5BZmFjYTJjYmYtZmJiMC00MzJkLTlmODQtNGQ4ZmEwZGRlOTg0XkEyXkFqcGdeQXVyNzk5ODY5Njk@._V1_.jpg'),),
                  ),
                Text(movieName[9])],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(height: 50,width: 50,child: Image.network('https://lumiere-a.akamaihd.net/v1/images/p_rayaandthelastdragon_21294_83346778.jpeg'),),
                  ),
                Text(movieName[10])],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(height: 50,width: 50,child: Image.network('https://flxt.tmsimg.com/assets/p11421864_v_v10_as.jpg'),),
                  ),
                Text(movieName[11])],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(height: 50,width: 50,child: Image.network('https://featuredanimation.com/wp-content/uploads/2023/01/the-amazin-maurice-2023-movie-poster-3.jpg'),),
                  ),
                  Text(movieName[12]) ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(height: 50,width: 50,child: Image.network('https://cdn.moviefone.com/image-assets/939338/gVPw9gRPsZZhzY6cIXp6h6nep5M.jpg?d=360x540&q=60'),),
                  ),
                  Text(movieName[13]) ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(height: 50,width: 50,child: Image.network('https://e1.pxfuel.com/desktop-wallpaper/358/409/desktop-wallpaper-751x1063px-movie-poster-2018-aquaman-movie-2018.jpg'),),
                  ),
                  Text(movieName[14])],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(height: 50,width: 50,child: Image.network('https://www.themoviedb.org/t/p/original/rS97hUJ1otKTTripGwQ0ujbuIri.jpg'),),
                  ),
               Text(movieName[15]) ],
              ),
            ]


        ),
      ),
    );
  }
}

class MovieList {
  const MovieList({required this.movieName,});

 // final String imageurl;
  final String movieName;
}

List<String> movieName = [
  'The Super Mario Bros',
  'Creed III',
  'Avatar:The way of water',
  'Mummies',
  'Murder Mystery 2',
  'Puss in Boots:Last Wish',
  'Supercell',
  'Cocaine Bear',
  'John Wick: Chapter 4',
  'Love Again',
  'Raya and the Last Dragon',
  'Insidious Chapter 3',
  'The Amazing Maurice',
  'Epic Tales',
  'Aquaman',
  'Ant-Man'
];
/* List<String> imageurl = ['https://assetscdn1.paytm.com/images/cinema/Mario6-9b7d1aa0-70cc-11ed-836c-c1819813ea92.jpg',
  'https://m.media-amazon.com/images/M/MV5BYzRkNWYzNTMtMmVlYS00YTk4LWJkMWQtODJjMDllMjAxMjczXkEyXkFqcGdeQXVyMDM2NDM2MQ@@._V1_FMjpg_UX1000_.jpg',
'https://images.thedirect.com/media/article_full/avatar-3-release.jpg',
  'https://www.themoviedb.org/t/p/w500/qVdrYN8qu7xUtsdEFeGiIVIaYd.jpg',
'https://ottarasan.com/wp-content/uploads/2023/04/murder-mystery.jpg',
'https://www.uphe.com/sites/default/files/styles/scale__344w_/public/2018/04/PussInBoots_PosterArt.jpg?itok=d5m-WMBC',
'https://flxt.tmsimg.com/assets/p23546806_v_h8_ag.jpg',
'https://m.media-amazon.com/images/M/MV5BNGQ3YWRlZjktNTVkMS00NWZiLTgwNzEtMTFlNmM4NGViNDdiXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_.jpg',
  'https://m.media-amazon.com/images/S/pv-target-images/6c2c7ace999b2efa7d6d113f7f3ec49f83722dbd2a22b202ef8028f26a1d0b69.jpg',
  'https://m.media-amazon.com/images/M/MV5BZmFjYTJjYmYtZmJiMC00MzJkLTlmODQtNGQ4ZmEwZGRlOTg0XkEyXkFqcGdeQXVyNzk5ODY5Njk@._V1_.jpg',
'https://lumiere-a.akamaihd.net/v1/images/p_rayaandthelastdragon_21294_83346778.jpeg',
'https://flxt.tmsimg.com/assets/p11421864_v_v10_as.jpg',
'https://featuredanimation.com/wp-content/uploads/2023/01/the-amazin-maurice-2023-movie-poster-3.jpg',
  'https://cdn.moviefone.com/image-assets/939338/gVPw9gRPsZZhzY6cIXp6h6nep5M.jpg?d=360x540&q=60',
  'https://e1.pxfuel.com/desktop-wallpaper/358/409/desktop-wallpaper-751x1063px-movie-poster-2018-aquaman-movie-2018.jpg',
  'https://www.themoviedb.org/t/p/original/rS97hUJ1otKTTripGwQ0ujbuIri.jpg'] */