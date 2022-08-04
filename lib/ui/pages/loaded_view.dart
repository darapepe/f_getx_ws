import 'package:f_web_service_template/ui/widgets/list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/news_controller.dart';

class LoadedView extends StatelessWidget {
  LoadedView({Key? key}) : super(key: key);

  NewsController newsController = Get.find();

  Future _refreshList(BuildContext context) async {
    // here call showNews on the controller
    newsController.getNews();
  }

  @override
  Widget build(BuildContext context) {
    List<ListItem> items = [];

    for (var news in newsController.news) {
      items.add(ListItem(news));
    }

    return Expanded(
      child: GestureDetector(
        onHorizontalDragEnd: (details) {
          newsController.reset();
          // here call reset on the controller
        },
        child: RefreshIndicator(
          child: ListView(
            children: items,
          ),
          onRefresh: () => _refreshList(context),
        ),
      ),
    );
  }
}
