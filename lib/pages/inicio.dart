import 'package:flutter/material.dart';


class FeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.teal,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.home, color: Colors.white),
              Icon(Icons.language, color: Colors.white),
              Icon(Icons.add_circle, color: Colors.white),
              Icon(Icons.notifications, color: Colors.white),
              Icon(Icons.person, color: Colors.white),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: 5,
        itemBuilder: (context, index) {
          return PostCard(
            name: index % 2 == 0 ? "Bruna S." : "Brandon A.",
            imageUrl: index % 2 == 0
                ? 'https://images.unsplash.com/photo-1584996673462-1db03781c16e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=400'
                : 'https://images.unsplash.com/photo-1519085360753-af0119f7cbe7?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=400',
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit ...",
            timeAgo: "Posted ${index + 2} hr ago",
          );
        },
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String description;
  final String timeAgo;

  const PostCard({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.timeAgo,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=${name.hashCode % 70}'),
            ),
            title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: Icon(Icons.more_vert),
          ),
          Image.network(imageUrl, fit: BoxFit.cover, width: double.infinity, height: 200),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(description),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(timeAgo, style: TextStyle(color: Colors.grey)),
                Row(
                  children: [
                    Icon(Icons.favorite_border, color: Colors.grey),
                    SizedBox(width: 5),
                    Text("50"),
                    SizedBox(width: 15),
                    Icon(Icons.comment, color: Colors.grey),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}