import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sosmed_sample/modules/home/bloc/filter/query_filter_bloc.dart';
import 'package:sosmed_sample/widgets/text_field_box.dart';

class SectionHeaderSearchWidget extends StatefulWidget {
  const SectionHeaderSearchWidget({Key? key}) : super(key: key);

  @override
  State<SectionHeaderSearchWidget> createState() =>
      _SectionHeaderSearchWidgetState();
}

class _SectionHeaderSearchWidgetState extends State<SectionHeaderSearchWidget> {
  final searchText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<QueryFilterBloc, QueryFilterState>(
          builder: (context, state) {
            return TextFieldBox(
              textController: searchText,
              hintText: 'Search username',
              prefixIcon: const Icon(Icons.search),
              textInputAction: TextInputAction.search,
              onChanged: (dynamic value) {
                context.read<QueryFilterBloc>().add(FilterQuery(
                      q: value as String,
                      endpoint: state.endpoint,
                      loadModel: state.loadModel,
                    ));
              },
              onSubmited: (dynamic value) {
                log('message :: $value');
                context.read<QueryFilterBloc>().add(FilterQuery(
                      q: value as String,
                      endpoint: state.endpoint,
                      loadModel: state.loadModel,
                    ));
              },
            );
          },
        ),
      ),
    );
  }
}
