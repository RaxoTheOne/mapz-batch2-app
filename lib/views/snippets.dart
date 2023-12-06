import 'package:flutter/material.dart';
import 'package:batch2_app/data/database_helper.dart';
import 'package:batch2_app/data/dataset.dart';

class SnippetsPage extends StatelessWidget {
  final List<Map<String, dynamic>> snippets = [
    {
      'subpage': SnippetPage1(),
      'icon': Icons.compare_arrows,
      'name': 'Async vs Sync',
      'description':
          'Example to show difference between async and sync functions',
    },
    {
      'subpage': SnippetPage2(),
      'icon': Icons.api,
      'name': 'Async API Call',
      'description': 'Basic REST API call with async/await',
    },
    {
      'subpage': DatabaseExamplePage(),
      'icon': Icons.storage,
      'name': 'Database Introduction',
      'description': 'Basic Example for a SQLite Database',
    },
    {
      'subpage': SnippetPage3(),
      'icon': Icons.newspaper,
      'name': 'New Snippet',
      'description': 'Upcoming Snippet',
    },
    // Add more snippets here
  ];

  // Getter für die Anzahl der Snippets
  int get snippetCount => snippets.length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Snippet Page'),
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
                  decoration: BoxDecoration(
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Async vs Sync'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Go Back'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

class SnippetPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Async API Call'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Go Back'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

class SnippetPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Database Introduction'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Go Back'),
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
        title: Text('Database Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(children: <Widget>[
          TextField(
            controller: _controller1,
            decoration: InputDecoration(labelText: 'Filename'),
          ),
          TextField(
            controller: _controller2,
            decoration: InputDecoration(labelText: 'File ID'),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  onPressed: _insertNewDataset, child: Text('Save Data')),
              ElevatedButton(
                  onPressed: _deleteAllData,
                  child: Text('Delete complete dataset'))
            ],
          ),
          SizedBox(
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
          if (!snapshot.hasData) return CircularProgressIndicator();

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
