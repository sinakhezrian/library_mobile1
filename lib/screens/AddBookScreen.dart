import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:library_mobile/controllers/addBookTextController.dart';
import 'package:library_mobile/controllers/bookController.dart';

class AddBookScreen extends StatefulWidget {
  const AddBookScreen({Key? key}) : super(key: key);

  @override
  State<AddBookScreen> createState() => _AddBookScreenState();
}

class _AddBookScreenState extends State<AddBookScreen> {
  var addBookTextController = new AddBookController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () async {
            await addBookTextController.save();
            if (addBookTextController.closed.value == true) {
              BookController.loading = true;
              Get.offAndToNamed('/homeScreen');
            }
          },
          child: Text(
            "ذخیره",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "اضافه کردن کتاب",
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          _input("نام کتاب", (value) {
            addBookTextController.name.value = value;
          }),
          _input("نویسنده", (value) {
            addBookTextController.writer.value = value;
          }),
          _input("سبک", (value) {
            addBookTextController.style.value = value;
          }),
          _input("جلد ", (value) {
            addBookTextController.cover.value = value;
          }),
          _input("انتشارات ", (value) {
            addBookTextController.publishers.value = value;
          }),
          _input("قیمت ", (value) {
            addBookTextController.price.value = value;
          }),
        ],
      )),
    );
  }

  Container _input(String title, Function onChanged) {
    return Container(
      padding: EdgeInsets.only(top: 5, left: 5, right: 5),
      height: 62,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.end,
            ),
          ),
          Container(
            height: 30,
            child: TextField(
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
              onChanged: ((value) => onChanged(value)),
            ),
          ),
        ],
      ),
    );
  }
}
