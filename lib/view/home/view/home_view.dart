import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:haberlercom_app/view/home/view/components/headline_news_widget.dart';
import 'package:haberlercom_app/view/home/view/components/hompage_header.dart';
import 'package:haberlercom_app/view/home/view/components/scrollable_news_widget.dart';
import 'package:haberlercom_app/view/home/viewmodel/home_viewmodel.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  bool isLoading = true;

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        isLoading = true;
      });

      ref.read(homeViewModelProvider).getNews();
      isLoading = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var newsProvider = ref.watch(homeViewModelProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFEEEEF3),
      body: SafeArea(
        child: isLoading
            ? const Center(child: CircularProgressIndicator.adaptive())
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HomePageHeader(),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            index = index + 1;
                            var data = newsProvider.newsData[index];

                            return Column(
                              children: [
                                HeadlineNews(title: data.title, imagePath: data.imageUrl),
                                const SizedBox(
                                  height: 20,
                                ),
                                HeadlineNews(
                                    title: newsProvider.newsData[index + 1].title,
                                    imagePath: newsProvider.newsData[index + 1].imageUrl),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/svg/youtube.svg",
                                      height: 18,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      "Video Haber",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 1),
                                        fontFamily: 'Helvetica',
                                        fontSize: 18,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.bold,
                                        height: 1.5,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  height: 254,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      ScrollableNews(
                                          title: newsProvider.newsData[index + 2].title,
                                          imagePath: newsProvider.newsData[index + 2].imageUrl),
                                      ScrollableNews(
                                          title: newsProvider.newsData[index + 3].title,
                                          imagePath: newsProvider.newsData[index + 3].imageUrl),
                                      ScrollableNews(
                                          title: newsProvider.newsData[index + 4].title,
                                          imagePath: newsProvider.newsData[index + 4].imageUrl),
                                      ScrollableNews(
                                          title: newsProvider.newsData[index + 5].title,
                                          imagePath: newsProvider.newsData[index + 5].imageUrl),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                HeadlineNews(
                                    title: newsProvider.newsData[index + 6].title,
                                    imagePath: newsProvider.newsData[index + 6].imageUrl),
                              ],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 20,
                            );
                          },
                          itemCount: newsProvider.newsData.isEmpty
                              ? 0
                              : (newsProvider.newsData.length - 10)),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
