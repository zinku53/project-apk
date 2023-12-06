import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductDetailsPage(),
    );
  }
}

class ProductDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0), // here the desired height
          child: AppBar(
            title: const Text(
                'Products List',
                style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)
            ),
            centerTitle: true,
            backgroundColor: Colors.pinkAccent,
          )
      ),
      body: ListView(
        padding: const EdgeInsets.all(30.0),
        children: const [
          Products('Hoodie', 'https://i.ibb.co/0fFh2TY/images.jpg','19.99','Its has 300 GSM clothes and comfortable to wear in winter'),
          Products('T-Shirt', 'https://i.ibb.co/WGNTrkP/download-1.jpg','34.56','It has 200 GSM clothes and comfortable in summer'),

        ],
      ),
    );
  }
}

class Products extends StatelessWidget {
  final String productName;
  final String image;
  final String price;
  final String description;

  const Products(this.productName,this.image,this.price,this.description);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue[300],
      child: ListTile(
        leading: Image.network(image),
        title: Text(productName,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(price,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900)),
          ],
        ),
        trailing: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amberAccent[200], // Background color
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BuyNowPage(productName,image,price,description),
              ),
            );
          },
          icon: const Icon(Icons.add),
          label: const Text('Buy Now'),
        ),
      ),
    );
  }
}



class BuyNowPage extends StatelessWidget {
  final String productName;
  final String image;
  final String price;

  final String description;

  const BuyNowPage(this.productName,this.image,this.price,this.description);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buy Now',style: TextStyle(color: Colors.pink)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Choose Payment Method'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                PaymentButton(img: 'https://i.ibb.co/cTHFF97/Bkash-logo.png', texts: 'bKash'),
                PaymentButton(img: 'https://i.ibb.co/tKf3WyW/dutch-bangla-rocket.jpg', texts: 'Rocket'),
                PaymentButton(img: 'https://i.ibb.co/qrD89mx/VISA-Logo-1976.png', texts: 'Visa'),



              ],
            ),
            SizedBox(height: 29),
            Text('Select Payment Type:',style: TextStyle(color: Colors.blueAccent[800],fontWeight: FontWeight.w900)),
            DropdownButton<String>(
              items: ['Bkash', 'Rocket', 'Nagad']
                  .map((String value) => DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              ))
                  .toList(),
              onChanged: (String? value) {
                // Handle dropdown value change
              },
            ),
            SizedBox(height: 69),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go Back',style: TextStyle(fontSize:20,color: Colors.lightBlue)),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentButton extends StatelessWidget {
  final String img;
  final String texts;

  const PaymentButton({required this.img, required this.texts});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(img, height: 150, width: 100),
        SizedBox(height: 10),
        Text(texts),
      ],
    );
  }
}
