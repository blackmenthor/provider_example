import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/animal_model.dart';
import 'package:provider_example/animal_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AnimalModel()),
      ],
      child: const MyApp(),
    ),
      // MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animal App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Animal App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();

    // fetch data upon page loads
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      final model = Provider.of<AnimalModel>(context, listen: false);
      model.fetchData();
    });
  }

  Widget _buildBody(BuildContext context) {
    final model = Provider.of<AnimalModel>(context);

    // still loading
    if (model.animals == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (model.animals!.isEmpty) {
      return const Center(
        child: Text(
          'No animal found!',
        ),
      );
    }

    return ListView.builder(
      itemCount: model.animals!.length,
        itemBuilder: (BuildContext context, int index) {
          final animal = model.animals![index];
          return ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AnimalPage(animal: animal),
                  ),
              );
            },
            leading: Text(
              '${index + 1}',
            ),
            title: Text(
              animal.name ?? '-',
            ),
          );
        },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: _buildBody(context),
      ),
    );
  }
}
