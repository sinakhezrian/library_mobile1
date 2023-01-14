import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:library_mobile/controllers/bookController.dart';
import 'package:library_mobile/controllers/editBookController.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BookController.getList();
    Future.delayed(const Duration(seconds: 6)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey.withOpacity(0.0001),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 50),
                width: double.infinity,
                child: Center(
                  child: Text(
                    "(سینا خضریان) برنامه کتابخانه",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1),
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Column(
                          children: [
                            Text("سینا خضریان"),
                            Text("ّبرای ویراش کتاب یک بار کلیک کنید"),
                            Text("ّبرای حذف کتاب یک بار کلیک طولانی کنید"),
                          ],
                        );
                      },
                      enableDrag: false,
                    );
                  },
                  child: Text(
                    "برای راهنما کلیلک کنید",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )),
              SizedBox(
                height: 50,
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: getMain(context),
              ))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.offAndToNamed('/addBook');
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Container _box(BuildContext context, int id, String name, String cover,
      String style, String writer, String price, String publishers) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
      width: double.infinity - 30,
      height: 177,
      decoration: BoxDecoration(
          color: Colors.black12, borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onLongPress: () {
          Get.defaultDialog(
            title: Text(' آیا از حذف کتاب ' + name + " مطمئن هستید؟").data!,
            content: SizedBox(
              width: 300,
              child: Column(
                children: [
                  Wrap(
                    spacing: 8,
                    children: [
                      InkWell(
                          onTap: () async {
                            BookController.delete(id);
                            Get.offAndToNamed('/homeScreen');
                          },
                          child: Chip(label: Text('بله'.tr))),
                      InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Chip(label: Text('خیر'.tr))),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        onTap: () {
          EditBookController.id.value = id;
          EditBookController.name.value = name;
          EditBookController.cover.value = cover;
          EditBookController.style.value = style;
          EditBookController.writer.value = writer;
          EditBookController.price.value = price;
          EditBookController.publishers.value = publishers;
          Get.offAndToNamed('/editBook');
        },
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _boxItem("نام کتاب", name),
              _boxItem("نویسنده", writer),
              _boxItem("سبک", style),
              _boxItem("جلد", cover),
              _boxItem("انتشارات", publishers),
              _boxItem("قیمت", price),
            ],
          ),
        ),
      ),
    );
  }

  Container _boxItem(String key, String value) {
    return Container(
      width: Get.width - 30,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          value,
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          key,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ]),
    );
  }

  Widget getMain(BuildContext context) {
    var list = BookController.books;

    return Column(
      children: [
        (list.length == 0 || BookController.loading == true)
            ? Container(
                margin: EdgeInsets.only(bottom: 15),
                child: Center(child: Text("loading data ...")),
              )
            : Container(),
        Column(
            children: list
                .map((item) => _box(context, item.id, item.name, item.cover,
                    item.style, item.writer, item.price, item.publishers))
                .toList()),
      ],
    );
  }
}
