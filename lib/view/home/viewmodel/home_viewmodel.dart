import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:haberlercom_app/core/model/news/news_model.dart';
import 'package:haberlercom_app/core/model/request_model.dart';
import 'package:haberlercom_app/core/model/request_response_model.dart';
import 'package:haberlercom_app/core/services/network_service.dart';

var homeViewModelProvider = ChangeNotifierProvider.autoDispose((ref) => HomeViewModel());

class HomeViewModel extends ChangeNotifier {
  List<News> newsData = [];

  Future<void> getNews() async {
    var response = await NetworkService().send<NewsModel, NewsModel>(
      RequestModel<NewsModel>(
        justDecode: false,
        endPoint: "haberler.json",
        parseModel: NewsModel(),
      ),
    );

    if (response.status == RequestResponseEnum.success) {
      newsData = response.data?.news ?? [];
      print(newsData);
      notifyListeners();
    } else {
      log(response.error.toString());
    }
  }
}
