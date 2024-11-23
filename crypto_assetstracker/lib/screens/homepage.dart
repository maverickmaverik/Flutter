import 'package:flutter/material.dart';
import '../models/my_assets.dart';
import '../data/dummy_assets.dart';
import '../data/categories.dart';
import 'add_assets_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<MyAsset> _assetList;

  @override
  void initState() {
    super.initState();
    _assetList = List.from(dummyAssets);
  }

  void _addNewAsset(MyAsset asset) {
    setState(() {
      _assetList.add(asset);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Crypto Asset Tracker'),
          backgroundColor: Colors.black,
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddAssetScreen(
                      onAssetAdded: _addNewAsset,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: _assetList.length,
          itemBuilder: (context, index) {
            final asset = _assetList[index];
            return ListTile(
              title: Text(asset.name),
              subtitle: Text(asset.quantity.toString()),
              leading: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: categories[asset.category]!.color,
                ),
              ),
              trailing: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'Average Price',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    '\$ ${asset.buyPrice}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
