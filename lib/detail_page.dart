import 'dart:ui';

import 'package:book_app/book.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Book book;
  const DetailPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.name),
      ),
      body: ListView(
        children: [
          // GAMBAR
          Container(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height / 3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(book.image),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Center(
                child: Image.asset(
                  book.image,
                  width: 130,
                ),
              ),
            ),
          ),
          // JUDUL
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: Text(
                book.name,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 22,
                ),
              ),
            ),
          ),
          // INFO BUKU
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BookInfo(book.rate.toString(), "Rating"),
              BookInfo(book.page.toString(), "Page"),
              BookInfo(book.language, "Language"),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Description',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          // Descrition
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              book.description,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          )
        ],
      ),
    );
  }

  Column BookInfo(String value, String info) {
    return Column(
      children: [
        Text(value),
        Text(info),
      ],
    );
  }
}
