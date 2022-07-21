import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sosmed_sample/modules/news/component/user_card_view.dart';
import 'package:sosmed_sample/modules/user/bloc/users/users_bloc.dart';
import 'package:sosmed_sample/route/router.gr.dart';
import 'package:sosmed_sample/theme/color.dart';
import 'package:sosmed_sample/theme/style.dart';
import 'package:sosmed_sample/widgets/loading_indicator.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
  }

  Future<void> _onRefresh() async {
    // notifs.clear();
    // notifBloc.add(LoadNotifGroup(fresh: true));
    log('message :: _onRefresh');
    context.read<UsersBloc>().add(const LoadUsers(fresh: true));

    log('message :: _refreshController 1:: ${_refreshController.isLoading}');
    log('message :: _refreshController 2:: ${_refreshController.isRefresh}');
    log('message :: _refreshController 3:: ${_refreshController.isTwoLevel}');

    // monitor network fetch
    // await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    // _refreshController.refreshCompleted();
  }

  Future<void> _onLoading() async {
    // if (notifs.isEmpty) {
    //   return;
    // }
    // // monitor network fetch
    // notifBloc.add(LoadNotifGroup(limit: 10, offset: notifs.length));
    context.read<UsersBloc>().add(const LoadUsers(fresh: false));

    log('message :: _refreshController 1:: ${_refreshController.isLoading}');
    log('message :: _refreshController 2:: ${_refreshController.isRefresh}');
    log('message :: _refreshController 3:: ${_refreshController.isTwoLevel}');
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
    return BlocBuilder<UsersBloc, UsersState>(
      buildWhen: (oldState, newState) {
        if (newState.status == UsersStatus.success) {
          log('message :: _refreshController :: ${_refreshController.isLoading}');
          log('message :: _refreshController :: ${_refreshController.isRefresh}');
          log('message :: _refreshController :: ${_refreshController.isTwoLevel}');
          if (_refreshController.isRefresh) {
            _refreshController.refreshCompleted();
          }
          if (_refreshController.isLoading) {
            _refreshController.loadComplete();
          }

          return true;
        }
        return false;
      },
      builder: (context, state) {
        switch (state.status) {
          case UsersStatus.initial:
            // case UsersStatus.loading:
            return LoadingIndicator();
          case UsersStatus.empty:
            _refreshController.loadNoData();
            return Center(
              child: Text(
                'Hello Empty Page',
                style: AppStyle.medium.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
            );

          case UsersStatus.success:
            final users = state.users;
            log('message ::: data ::: ${users.length}');

            return GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              cacheExtent: 1,
              itemCount: users.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 1 / 1.3,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              itemBuilder: (context, index) {
                final user = users[index];
                return UserCardView(
                  user: user,
                  onDetailProfile: (userId) {
                    AutoRouter.of(context).push(ProfileDetailView(user: user));
                  },
                );
              },
            );

          default:
            return const SizedBox();
        }
      },
    );
  }
}
