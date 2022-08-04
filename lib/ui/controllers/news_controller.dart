import 'package:f_web_service_template/data/model/news_item.dart';
import 'package:f_web_service_template/domain/use_case/news.dart';
import 'package:f_web_service_template/ui/pages/empy_view.dart';
import 'package:get/get.dart';

class NewsController extends GetxController {
  News noticias = Get.find();

  var news = <NewsItem>[].obs;
  var _loading = false.obs;
  //var loading;
  bool get loading => _loading.value;
  Future<void> getNews() async {
    _loading.value = true;
    var list = await noticias.getNews();
    news.value = list;
    news.refresh();
    _loading.value = false;
  }

  Future<void> reset() async {
    news.value = List.empty();
    news.refresh();
  }

  // functions getNews() and reset()

}
