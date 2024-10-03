import 'package:flutter/material.dart';
import 'package:project_name/components/item.dart';
import 'package:project_name/models/item_class.dart';
import 'package:project_name/pages/add_item_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ItemClass> items = [
    ItemClass(
    1,
    'https://img.razrisyika.ru/kart/127/507521-sotovyy-telefon-6.jpg',
    5990,
    'Apple Nokia Samsung',
    'Сразу несколько, представь.',
    'Продается сразу несколько новеньких телефонов только вместе.',
  ),
  ItemClass(
    2,
    'https://burobiz-a.akamaihd.net/uploads/images/104287/large_remont-i-prodazha-bu-mobilnyx-telefonov-xoroshee-nachalo-dlya-perspektivnogo-biznesa-www-ural-org.jpg',
    6690,
    'Nokia',
    'Неворованный синий нокиа с фото',
    'Отличный телефон, держит заряд месяц',
  ),
  ItemClass(
    3,
    'https://cdn1.ozone.ru/s3/multimedia-b/6014927879.jpg',
    7990,
    'Texet',
    'Неубиваемый телефон, пережил ядерную войну',
    'Этим телефоном люди впервые научились добывать огонь, охотиться на мамонтов, это он нагрузил Грузию, затонировал черное море, а мертвое убил, успокоил тихий океан и покрасил красную площадь',
  )
  ]; // Переносим список items в State

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Список товаров'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];
          return Item(
            imgLink: item.imgLink,
            price: item.price,
            brand: item.brand,
            title: item.title,
            description: item.description,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddItemPage(onItemAdded: (newItem) {
                setState(() {
                  items.add(newItem);
                });
              }),
            ),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
