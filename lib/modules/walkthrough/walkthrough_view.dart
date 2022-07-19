import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sosmed_sample/core/bloc/main_bloc.dart';
import 'package:sosmed_sample/theme/color.dart';
import 'package:sosmed_sample/theme/style.dart';
import 'package:sosmed_sample/widgets/button_border.dart';

import 'walktrough_item.dart';

class WalkthroughView extends StatefulWidget {
  const WalkthroughView({super.key, required this.walkthroughList});
  final List<WalkthroughItem> walkthroughList;

  @override
  // ignore: library_private_types_in_public_api
  _WalkthroughStateView createState() => _WalkthroughStateView();
}

class _WalkthroughStateView extends State<WalkthroughView> {
  final PageController _controller = PageController();

  int currentPage = 0;
  bool lastPage = false;

  @override
  void initState() {
    super.initState();
  }

  void _onPageChanged(int page) {
    setState(() {
      currentPage = page;
      if (currentPage == widget.walkthroughList.length - 1) {
        lastPage = true;
      } else {
        lastPage = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //   SystemUiOverlayStyle(
    //     statusBarColor: Color(0xFF007F80),
    //   ),
    // );

    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: Stack(
        children: [
          PageView(
            onPageChanged: _onPageChanged,
            controller: _controller,
            children: widget.walkthroughList,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 150,
              padding: const EdgeInsets.only(left: 16, bottom: 16, right: 24),
              child: Column(
                children: [
                  _indicator(),
                  const SizedBox(height: 20),
                  _buildButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton() {
    if (lastPage) {
      return ButtonBorder(
        title: 'Mulai Sekarang',
        buttonType: ButtonType.big,
        isFill: true,
        textColor: Colors.white,
        onPressed: () {
          BlocProvider.of<MainBloc>(context).add(const FinishWalktrough());
        },
      );
    } else {
      return TextButton(
        child: Text(
          lastPage ? 'Ayo Mulai' : 'Selanjutnya',
          style: AppStyle.bold.copyWith(
            color: const Color(0xFF2699fb),
            fontSize: 16,
          ),
        ),
        onPressed: () {
          _controller.jumpToPage(currentPage + 1);
        },
      );
    }
  }

  Widget _indicator() {
    return DotsIndicator(
      dotsCount: widget.walkthroughList.length,
      position: currentPage.toDouble(),
      decorator: DotsDecorator(
        size: const Size.square(9.0),
        activeSize: const Size(18.0, 9.0),
        activeColor: AppColors.primary,
        color: Color(0xFFD8D8D8),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }
}
