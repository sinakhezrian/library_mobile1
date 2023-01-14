import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:library_mobile/controllers/addBookController.dart';
import 'package:library_mobile/controllers/bookController.dart';
import 'package:library_mobile/controllers/editBookController.dart';

class EditBookScreen extends StatefulWidget {
  const EditBookScreen({Key? key}) : super(key: key);

  @override
  State<EditBookScreen> createState() => _EditBookScreenState();
}

class _EditBookScreenState extends State<EditBookScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () async {
            await EditBookController.save();
            if (EditBookController.closed.value == true) {
              BookController.loading = true;
              Get.offAndToNamed('/homeScreen');
            }
          },
          child: Text(
            "ویرایش و دخیره",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "ویرایش کردن کتاب " + EditBookController.name.value,
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          _input("نام کتاب", (value) {
            EditBookController.name.value = value;
          },EditBookController.name.value),
          _input("نویسنده", (value) {
            EditBookController.writer.value = value;
          },EditBookController.writer.value),
          _input("سبک", (value) {
            EditBookController.style.value = value;
          },EditBookController.style.value),
          _input("جلد ", (value) {
            EditBookController.cover.value = value;
          },EditBookController.cover.value),
          _input("انتشارات ", (value) {
            EditBookController.publishers.value = value;
          },EditBookController.publishers.value),
          _input("قیمت ", (value) {
            EditBookController.price.value = value;
          },EditBookController.price.value),
        ],
      )),
    );
  }

  Container _input(String title, Function onChanged,String oldValue) {
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
              controller: TextEditingController(text: oldValue),
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
