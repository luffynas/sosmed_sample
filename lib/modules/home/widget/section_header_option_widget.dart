import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sosmed_sample/modules/home/bloc/filter/query_filter_bloc.dart';
import 'package:sosmed_sample/theme/color.dart';
import 'package:sosmed_sample/widgets/button_border.dart';
import 'package:sosmed_sample/widgets/delegate_sliver.dart';
import 'package:sosmed_sample/widgets/radio/custom_radio_button.dart';

class SectionHeaderOptionWidget extends StatelessWidget {
  const SectionHeaderOptionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      floating: true,
      delegate: SliverDelegate(
        height: 110,
        child: BlocBuilder<QueryFilterBloc, QueryFilterState>(
          builder: (context, state) {
            log('message ::: state ::: $state');
            var query = state.q;
            var endpointUrl = state.endpoint;
            var loadModel = state.loadModel;

            return Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomRadioButton(
                        title: 'User',
                        onValue: endpointUrl,
                        groupValue: EndpointUrl.user,
                        onRadioChanged: (dynamic value) {
                          context.read<QueryFilterBloc>().add(FilterQuery(
                                q: query,
                                endpoint: EndpointUrl.user,
                                loadModel: loadModel,
                              ));
                        },
                      ),
                      CustomRadioButton(
                        title: 'Issues',
                        onValue: endpointUrl,
                        groupValue: EndpointUrl.issues,
                        onRadioChanged: (dynamic value) {
                          context.read<QueryFilterBloc>().add(FilterQuery(
                                q: query,
                                endpoint: EndpointUrl.issues,
                                loadModel: loadModel,
                              ));
                        },
                      ),
                      CustomRadioButton(
                        title: 'Repositories',
                        onValue: endpointUrl,
                        groupValue: EndpointUrl.repositories,
                        onRadioChanged: (dynamic value) {
                          context.read<QueryFilterBloc>().add(FilterQuery(
                                q: query,
                                endpoint: EndpointUrl.repositories,
                                loadModel: loadModel,
                              ));
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ButtonBorder(
                          title: 'Laxy Loading',
                          isFill: loadModel == LoadModel.lazzy,
                          textColor: loadModel == LoadModel.lazzy
                              ? Colors.white
                              : AppColors.primary,
                          onPressed: () {
                            context.read<QueryFilterBloc>().add(FilterQuery(
                                  q: query,
                                  endpoint: endpointUrl,
                                  loadModel: LoadModel.lazzy,
                                ));
                          },
                        ),
                        ButtonBorder(
                          title: 'With Index',
                          isFill: loadModel == LoadModel.withIndex,
                          textColor: loadModel == LoadModel.withIndex
                              ? Colors.white
                              : AppColors.primary,
                          onPressed: () {
                            context.read<QueryFilterBloc>().add(FilterQuery(
                                  q: query,
                                  endpoint: endpointUrl,
                                  loadModel: LoadModel.withIndex,
                                ));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
