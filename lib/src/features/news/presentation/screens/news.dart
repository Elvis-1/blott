import 'package:blott/src/core/utils/functions/convert_date.dart';
import 'package:blott/src/core/utils/functions/internet_checker.dart';
import 'package:blott/src/features/news/presentation/viewmodel/news_viewmodel.dart';
import 'package:blott/src/features/shared/no_internet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:blott/src/config/service_locators.dart';
import 'package:blott/src/config/theme/app_color.dart';
import 'package:blott/src/config/utils/local/auth_local_source.dart';
import 'package:blott/src/core/widgets/normal_text_style.dart';
import 'package:blott/src/features/news/presentation/screens/news_details.dart';
import 'package:blott/src/features/news/presentation/widgets/news_container.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // call the news list api before screen builds

    WidgetsBinding.instance.addPostFrameCallback((_) {
      callNewsList();
    });
  }

  callNewsList() async {
    // Check for internet connection before making the API call
    bool hasConnection =
        await ConnectionStatusSingleton.getInstance().checkConnection();

    if (!hasConnection) {
      // Show no internet screen
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const NewsDetails()));
      return;
    }

    // Proceed to load news if connection exists
    var news = context.read<NewsViewModel>();
    await news.getAllNews('general');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: StreamBuilder<bool>(
          stream: ConnectionStatusSingleton.getInstance().connectionChange,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data == false) {
                return const NoInternet();
              } else {
                return newsBody();
              }
            } else {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
          },
        ));
  }

  Widget newsBody() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 45.h,
          ),
          Text(
            "Hey ${sl<AuthLocalSource>().getUser()?.firstName ?? ""}",
            style: normalTextStyle(
                fontFamily: "Roboto", textColor: AppColors.white, fontSize: 30),
          ),
          SizedBox(
            height: 15.h,
          ),
          Expanded(child: Consumer<NewsViewModel>(
            builder: (context, vm, _) {
              return ListView.builder(
                  itemCount: vm.isLoading == true ? 1 : vm.news?.length ?? 1,
                  itemBuilder: (context, index) {
                    if (vm.isLoading == true) {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    }

                    if (vm.news == null) {
                      return const SizedBox.shrink();
                    }

                    var news = vm.news![index];
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const NewsDetails()));
                      },
                      child: newsContainer(
                          news.image ?? '',
                          '${news.category?.toUpperCase() ?? ""}',
                          DateFormat('d MMMM, yyyy')
                              .format(
                                  convertDate(news.datetime) ?? DateTime.now())
                              .toUpperCase(),
                          '${news.summary ?? ""}'),
                    );
                  });
            },
          ))
        ],
      ),
    );
  }
}
