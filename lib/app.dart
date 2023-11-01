import 'package:flutter/material.dart';

class Mapz extends StatelessWidget {
  const Mapz({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const NavigationWrapper(),
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
    );
  }
}

//NavigationWarpper

class NavigationWrapper extends StatefulWidget {
  const NavigationWrapper({super.key});

  @override
  State<NavigationWrapper> createState() => _NavigationWrapperState();
}

class _NavigationWrapperState extends State<NavigationWrapper> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber[800],
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          NavigationDestination(
            icon: Icon(Icons.local_activity),
            label: 'Stats',
          ),
          NavigationDestination(
            icon: Icon(Icons.group),
            label: 'Animation',
          ),
        ],
      ),
      body: SafeArea(
          child: <Widget>[
        const StyledPage(),
        const MapPage(),
        const StatsPagewithlist(),
        const AnimatedContainerExample(),
      ][currentPageIndex]),
    );
  }
}

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              width: 100,
              height: 100,
              child: Placeholder(),
            ),
            Text(
              'Start Page',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              'Coming Soon!',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ]),
    );
  }
}

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              width: 100,
              height: 100,
              child: Placeholder(),
            ),
            Text(
              'Map Page',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              'Coming Soon!',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ]),
    );
  }
}

class StatsPagewithlist extends StatefulWidget {
  const StatsPagewithlist({super.key});

  @override
  _StatsPagewithlistState createState() => _StatsPagewithlistState();
}

class _StatsPagewithlistState extends State<StatsPagewithlist> {
  final List<String> items = List.generate(50, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(title: Text(items[index]));
      },
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            width: 100,
            height: 100,
            child: Placeholder(),
          ),
          Text(
            'Profile Page',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            'Coming Soon!',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}

// Neue Start Page mit Layout
class StyledPage extends StatelessWidget {
  const StyledPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Home",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
              ),
            ),
            const Text(
              "Statistics",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            // Status Boxen
            Row(
              children: [
                _statusBox("123", "Commits", Icons.stacked_bar_chart),
                const SizedBox(width: 10),
                _statusBox("456", "Lines Code", Icons.code),
              ],
            ),
            const SizedBox(height: 20),
            const SizedBox(
              height: 150,
              child: Placeholder(),
            ),
            const SizedBox(height: 40),
            const Text(
              "New Activities",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListItemBuilder(itemCount: 20),
          ],
        ),
      ),
    );
  }
}

// Hilfsmethode zum Erstellen einer Status-Box
Widget _statusBox(String number, String explanation, IconData iconData) {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Color.fromARGB(255, 39, 39, 46),
      ),
      child: Row(children: [
        Icon(
          iconData, // Verwendung des übergebenen Icon-Datenwertes
          size: 40.0,
          color: Colors.orange,
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(number,
                style:
                    const TextStyle(fontSize: 28, fontWeight: FontWeight.w900)),
            Text(explanation),
          ],
        )
      ]),
    ),
  );
}

//animierter Container

class AnimatedContainerExample extends StatefulWidget {
  const AnimatedContainerExample({super.key});

  @override
  _AnimatedContainerExampleState createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  double _width = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          AnimatedContainer(
              duration: Duration(seconds: 10),
              width: _width,
              height: 100.0,
              color: Colors.orange),
          ElevatedButton(
            child: Text('Zaubern'),
            onPressed: () {
              setState(() {
                _width = _width == 100.0 ? 200.0 : 100.0;
              });
            },
          ),
        ]),
      ),
    );
  }
}

//Listenerstellung
class ListItemBuilder extends StatelessWidget {
  final int itemCount;

  const ListItemBuilder({required this.itemCount, Key? key}) : super(key: key);

  List<Widget> _buildListItems(BuildContext context) {
    return List.generate(
        itemCount,
        (index) => ListTile(
              leading: CircleAvatar(
                child: Text('$index'),
                backgroundColor: Colors.orange,
              ),
              title: Text('Headline $index'),
              subtitle: Text('Supporting Text - $index'),
              trailing: Icon(Icons.favorite_rounded),
              contentPadding: EdgeInsets.all(5),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(index: index),
                  ),
                );
              },
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: _buildListItems(context));
  }
}

//DetailPage
class DetailPage extends StatelessWidget {
  final int index;

  const DetailPage({required this.index, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DetailPage für das $index. Element')),
      body: Center(child: Text('Das ist das $index. Element')),
    );
  }
}
