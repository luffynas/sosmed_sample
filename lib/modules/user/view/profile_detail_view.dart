import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sosmed_sample/models/user.dart';
import 'package:sosmed_sample/modules/news/component/news_card_view.dart';
import 'package:sosmed_sample/modules/user/bloc/users_detail/users_detail_bloc.dart';
import 'package:sosmed_sample/modules/user/widget/user_detail_widget.dart';
import 'package:sosmed_sample/theme/style.dart';
import 'package:sosmed_sample/widgets/delegate_sliver.dart';

class ProfileDetailView extends StatefulWidget {
  final User user;
  const ProfileDetailView({Key? key, required this.user}) : super(key: key);

  @override
  State<ProfileDetailView> createState() => _ProfileDetailViewState();
}

class _ProfileDetailViewState extends State<ProfileDetailView> {
  User? user;

  @override
  void initState() {
    user = widget.user;
    super.initState();

    context.read<UsersDetailBloc>().add(LoadUserDetail(userId: user!.id!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Profile Detail', style: AppStyle.appBarTitle),
      ),
      body: BlocListener<UsersDetailBloc, UsersDetailState>(
        listener: (context, state) {
          if (state.status == UsersDetailStatus.success) {
            user = state.user;
            setState(() {});
          }
        },
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: SliverDelegate(
                height: 420,
                child: UserDetailWidget(user: user!),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: SliverDelegate(
                height: 60,
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  child: Text(
                    'Posts',
                    style: AppStyle.medium.copyWith(fontSize: 20),
                  ),
                ),
              ),
            ),
            // const SizedBox(height: 16),
            // const DividerWidget(),
            SliverToBoxAdapter(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return NewsCardView(onDetailPost: (dd) {});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
