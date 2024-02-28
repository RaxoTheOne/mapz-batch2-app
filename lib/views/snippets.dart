import 'package:flutter/material.dart';
import 'package:batch2_app/data/database_helper.dart';
import 'package:batch2_app/data/dataset.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class SnippetsPage extends StatelessWidget {
  final List<Map<String, dynamic>> snippets = [
    {
      'subpage': const SnippetPage1(),
      'icon': Icons.compare_arrows,
      'name': 'Async vs Sync',
      'description':
          'Example to show difference between async and sync functions',
    },
    {
      'subpage': const SnippetPage2(),
      'icon': Icons.api,
      'name': 'Async API Call',
      'description': 'Basic REST API call with async/await',
    },
    {
      'subpage': const DatabaseExamplePage(),
      'icon': Icons.storage,
      'name': 'Database Introduction',
      'description': 'Basic Example for a SQLite Database',
    },
    {
      'subpage': const ApiExamplePage(),
      'icon': Icons.api,
      'name': 'API Snippet (GET/POST)',
      'description': 'Snippet to test regular REST function',
    },
    {
      'subpage': ItemsPageSimple(),
      'icon': Icons.fireplace,
      'name': 'Firebase Console Snippet',
      'description': 'Snippet to test Firebase Console integration',
    },
    {
      'subpage': ItemsPage(),
      'icon': Icons.fireplace,
      'name': 'Firestore Collection Snippet',
      'description':
          'Snippet to display a Firestore Collection with sorting and subpages',
    },
    // Add more snippets here
  ];

  SnippetsPage({super.key});

  // Getter für die Anzahl der Snippets
  int get snippetCount => snippets.length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snippet Page'),
      ),
      body: ListView(
        children: [
          for (var snippet in snippets)
            Container(
              padding: const EdgeInsets.all(10),
              child: ListTile(
                contentPadding: const EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                tileColor: Theme.of(context).colorScheme.surface,
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.orange,
                  ),
                  child: Icon(snippet['icon']),
                ),
                title: Text(
                  snippet['name'],
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                subtitle: Text(
                  snippet['description'],
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => snippet['subpage']),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}

class SnippetPage1 extends StatelessWidget {
  const SnippetPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Async vs Sync'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Go Back'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

class SnippetPage2 extends StatelessWidget {
  const SnippetPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Async API Call'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Go Back'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

class SnippetPage3 extends StatelessWidget {
  const SnippetPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Placeholder'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Go Back'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

// Database Example
class DatabaseExamplePage extends StatefulWidget {
  const DatabaseExamplePage({super.key});

  @override
  _DatabaseExamplePageState createState() => _DatabaseExamplePageState();
}

class _DatabaseExamplePageState extends State<DatabaseExamplePage> {
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Database Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(children: <Widget>[
          TextField(
            controller: _controller1,
            decoration: const InputDecoration(labelText: 'Filename'),
          ),
          TextField(
            controller: _controller2,
            decoration: const InputDecoration(labelText: 'File ID'),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  onPressed: _insertNewDataset, child: const Text('Save Data')),
              ElevatedButton(
                  onPressed: _deleteAllData,
                  child: const Text('Delete complete dataset'))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(child: _buildDatasetList()),
        ]),
      ),
    );
  }

  void _insertNewDataset() async {
    var datensatz = MeinDatensatz(
      spalte1: _controller1.text,
      spalte2: int.tryParse(_controller2.text) ?? 0,
    );
    await DatabaseHelper.instance.insert(datensatz);
    setState(() {});
  }

  void _deleteAllData() async {
    await DatabaseHelper.instance.deleteAllRows();
    setState(() {});
  }

  Widget _buildDatasetList() {
    return FutureBuilder<List<MeinDatensatz>>(
        future: DatabaseHelper.instance.querryAllRows(),
        builder: (BuildContext context,
            AsyncSnapshot<List<MeinDatensatz>> snapshot) {
          if (!snapshot.hasData) return const CircularProgressIndicator();

          return ListView(
              children: snapshot.data!
                  .map((datensatz) => ListTile(
                        title: Text(datensatz.spalte1),
                        subtitle: Text(datensatz.spalte2.toString()),
                      ))
                  .toList());
        });
  }
}

// API Example

class Post {
  final int id;
  final String title;
  final String body;

  Post({required this.id, required this.title, required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

class ApiExamplePage extends StatefulWidget {
  const ApiExamplePage({super.key});

  @override
  _ApiExamplePageState createState() => _ApiExamplePageState();
}

class _ApiExamplePageState extends State<ApiExamplePage> {
  final _controller = TextEditingController();
  String _response = '';
  String _responseId = '';
  String _responseTitle = '';
  String _responseBody = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _getApiData() async {
    if (_controller.text.isEmpty) {
      setState(() {
        _response = 'ID missing';
        _responseId = 'ID missing';
        _responseTitle = 'ID missing';
        _responseBody = 'ID missing';
      });
    } else {
      var response = await http.get(Uri.parse(
          'https://jsonplaceholder.typicode.com/posts/${_controller.text}'));
      setState(() {
        _response = response.body;
        var jsonResponse = jsonDecode(response.body);
        var post = jsonResponse = Post.fromJson(jsonResponse);
        _responseId = post.id.toString();
        _responseTitle = post.title;
        _responseBody = post.body;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Example'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(children: <Widget>[
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'ID'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _getApiData,
              child: const Text('Get Data'),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Response',
                    style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _responseId,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        _responseTitle,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(height: 20),
                      Text(_responseBody),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                Text('Raw Response',
                    style: Theme.of(context).textTheme.headlineSmall),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(_response),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}

// Firebase Console Example
class ItemsPageSimple extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Items'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('items')
            //.where('category', isEqualTo: 'tools')
            .orderBy('name', descending: false)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();

          return ListView.separated(
            separatorBuilder: (context, index) => Divider(), // Add Divider here
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final document = snapshot.data!.docs[index];
              return ListTile(
                title: Text(
                  document['name'],
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                subtitle: Text(
                  document['description'],
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// Firestore Collection Example

class ItemsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Items'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('items')
            //.where('category', isEqualTo: 'vehicle')
            .orderBy('name', descending: false)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();

          return ListView.separated(
            separatorBuilder: (context, index) => Divider(),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final document = snapshot.data!.docs[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ItemSubpage(document),
                    ),
                  );
                },
                child: ListTile(
                  title: Text(
                    document['name'],
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  subtitle: Text(
                    document['description'],
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      FirebaseFirestore.instance
                          .collection('items')
                          .doc(document.id)
                          .delete();
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ItemSubpage extends StatelessWidget {
  final DocumentSnapshot document;

  ItemSubpage(this.document);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(document['name']),
      ),
      body: Center(child: Text(document['description'])),
    );
  }
}
