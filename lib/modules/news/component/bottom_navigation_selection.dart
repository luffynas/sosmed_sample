import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sosmed_sample/modules/home/bloc/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:sosmed_sample/theme/color.dart';

class BottomNavigationSelection extends StatelessWidget {
  const BottomNavigationSelection({super.key, this.onSelected});
  final Function(int)? onSelected;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      builder: (context, state) {
        return BottomNavigationBar(
          selectedItemColor: AppColors.primaryDark,
          unselectedItemColor: AppColors.textPrimary,
          onTap: (value) => BlocProvider.of<BottomNavigationBloc>(context)
            ..add(SelectTab(index: value)),
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex(state),
          items: _buildItem(),
        );
      },
    );
  }

  List<BottomNavigationBarItem> _buildItem() {
    return [
      const BottomNavigationBarItem(
        label: 'User',
        icon: Icon(
          Icons.access_alarm,
          color: Colors.red,
        ),
      ),
      const BottomNavigationBarItem(
        label: 'News',
        icon: Icon(Icons.accessibility_new, color: AppColors.textPrimary),
      ),
      const BottomNavigationBarItem(
        label: 'Bookmark',
        icon: Icon(
          Icons.heart_broken,
          color: AppColors.textPrimary,
        ),
      ),
    ];
  }

  int _currentIndex(BottomNavigationState state) {
    if (state is NewsSelected) {
      return 1;
    } else if (state is BookmarkSelected) {
      return 2;
    } else {
      return 0;
    }
  }
}
