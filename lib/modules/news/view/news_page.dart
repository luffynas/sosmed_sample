import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sosmed_sample/modules/home/component/news_card_view.dart';
import 'package:sosmed_sample/route/router.gr.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
  }

  void _onRefresh() async {
    // notifs.clear();
    // notifBloc.add(LoadNotifGroup(fresh: true));
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // if (notifs.isEmpty) {
    //   return;
    // }
    // // monitor network fetch
    // notifBloc.add(LoadNotifGroup(limit: 10, offset: notifs.length));
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      header: const WaterDropHeader(),
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus? mode) {
          Widget? body;
          if (mode == LoadStatus.idle) {
            body = const Text('Pull up load');
          } else if (mode == LoadStatus.loading) {
            body = const CircularProgressIndicator();
          } else if (mode == LoadStatus.failed) {
            body = const Text('Load Failed!Click retry!');
          } else if (mode == LoadStatus.canLoading) {
            body = const Text('release to load more');
          } else {
            body = const Text('No more posts');
          }
          return SizedBox(
            height: 55,
            child: Center(child: body),
          );
        },
      ),
      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: _buildContent(),
    );
  }

  Widget _buildContent() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return NewsCardView(onDetailPost: (postId) {
          AutoRouter.of(context).push(PostDetail(postId: postId));
        });
        ;
      },
    );
  }
}
