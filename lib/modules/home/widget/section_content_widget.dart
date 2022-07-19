import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sosmed_sample/modules/home/bloc/filter/query_filter_bloc.dart';
import 'package:sosmed_sample/widgets/loading_indicator.dart';

class SectionContentWidget extends StatefulWidget {
  const SectionContentWidget({Key? key}) : super(key: key);

  @override
  State<SectionContentWidget> createState() => _SectionContentWidgetState();
}

class _SectionContentWidgetState extends State<SectionContentWidget> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

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
    // monitor network fetch
    // notifBloc.add(LoadNotifGroup(limit: 10, offset: notifs.length));
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        // child: SmartRefresher(
        //   enablePullDown: true,
        //   enablePullUp: true,
        //   header: const WaterDropHeader(),
        //   footer: CustomFooter(
        //     builder: (BuildContext context, LoadStatus? mode) {
        //       Widget? body;
        //       if (mode == LoadStatus.idle) {
        //         body = const Text('Pull up load');
        //       } else if (mode == LoadStatus.loading) {
        //         body = const CircularProgressIndicator();
        //       } else if (mode == LoadStatus.failed) {
        //         body = const Text('Load Failed!Click retry!');
        //       } else if (mode == LoadStatus.canLoading) {
        //         body = const Text('release to load more');
        //       } else {
        //         body = const Text('No more notif');
        //       }
        //       return SizedBox(
        //         height: 55.0,
        //         child: Center(child: body),
        //       );
        //     },
        //   ),
        //   controller: _refreshController,
        //   onRefresh: _onRefresh,
        //   onLoading: _onLoading,
        //   child: BlocBuilder<QueryFilterBloc, QueryFilterState>(
        //     builder: (context, state) {
        //       switch (state.status) {
        //         case QueryFilterStatus.failure:
        //         case QueryFilterStatus.loading:
        //           return LoadingIndicator();
        //         case QueryFilterStatus.success:
        //           return ListView.builder(
        //             shrinkWrap: true,
        //             physics: const NeverScrollableScrollPhysics(),
        //             itemCount: state.responses.length,
        //             itemBuilder: (context, index) {
        //               final item = state.responses[index];

        //               var title = '';
        //               var avatar = '';
        //               if (state.endpoint == EndpointUrl.user) {
        //                 title = item.login ?? '';
        //                 avatar = item.avatarUrl ?? '';
        //               } else if (state.endpoint == EndpointUrl.issues) {
        //                 title = item.title ?? '';
        //               } else if (state.endpoint == EndpointUrl.repositories) {
        //                 title = item.fullname ?? '';
        //                 avatar = item.owner?.avatarUrl ?? '';
        //               }
        //               return Container(
        //                 padding: const EdgeInsets.symmetric(vertical: 8),
        //                 child: Row(
        //                   children: [
        //                     AvatarWidget(
        //                       radius: 8,
        //                       width: 64,
        //                       heigh: 64,
        //                       url: avatar,
        //                     ),
        //                     const SizedBox(width: 16),
        //                     Expanded(
        //                       child: Column(
        //                         crossAxisAlignment: CrossAxisAlignment.start,
        //                         children: [
        //                           Text(
        //                             '$title',
        //                             style: AppStyle.bold.copyWith(
        //                               fontSize: 18,
        //                             ),
        //                           ),
        //                           const SizedBox(height: 10),
        //                           const Text('Update dates',
        //                               style: AppStyle.standart),
        //                         ],
        //                       ),
        //                     ),
        //                     Text(
        //                       'Issue States',
        //                       style: AppStyle.standart.copyWith(
        //                         fontSize: 14,
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               );
        //             },
        //           );
        //         default:
        //           return const SizedBox();
        //       }
        //     },
        //   ),
        // ),
        child: BlocBuilder<QueryFilterBloc, QueryFilterState>(
          builder: (context, state) {
            switch (state.status) {
              case QueryFilterStatus.failure:
              case QueryFilterStatus.loading:
                return LoadingIndicator();
              // case QueryFilterStatus.success:
              //   return ListView.builder(
              //     shrinkWrap: true,
              //     physics: const NeverScrollableScrollPhysics(),
              //     itemCount: state.responses.length,
              //     itemBuilder: (context, index) {
              //       final item = state.responses[index];

              //       var title = '';
              //       var avatar = '';
              //       if (state.endpoint == EndpointUrl.user) {
              //         title = item.login ?? '';
              //         avatar = item.avatarUrl ?? '';
              //       } else if (state.endpoint == EndpointUrl.issues) {
              //         title = item.title ?? '';
              //       } else if (state.endpoint == EndpointUrl.repositories) {
              //         title = item.fullname ?? '';
              //         avatar = item.owner?.avatarUrl ?? '';
              //       }
              //       return Container(
              //         padding: const EdgeInsets.symmetric(vertical: 8),
              //         child: Row(
              //           children: [
              //             AvatarWidget(
              //               radius: 8,
              //               width: 64,
              //               heigh: 64,
              //               url: avatar,
              //             ),
              //             const SizedBox(width: 16),
              //             Expanded(
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     '$title',
              //                     style: AppStyle.bold.copyWith(
              //                       fontSize: 18,
              //                     ),
              //                   ),
              //                   const SizedBox(height: 10),
              //                   const Text('Update dates',
              //                       style: AppStyle.standart),
              //                 ],
              //               ),
              //             ),
              //             Text(
              //               'Issue States',
              //               style: AppStyle.standart.copyWith(
              //                 fontSize: 14,
              //               ),
              //             ),
              //           ],
              //         ),
              //       );
              //     },
              //   );
              default:
                return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
