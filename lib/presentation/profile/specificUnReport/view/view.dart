import 'package:cached_network_image/cached_network_image.dart';

import 'package:finder/presentation/common/stateRenderer/state_renderer_impl.dart';

import 'package:finder/presentation/resources/asset_manger.dart';
import 'package:finder/presentation/resources/values_manger.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../../../../application/constant.dart';
import '../../../../application/di.dart';

import '../../../../domain/models/unReport/un_report_model.dart';
import '../../../resources/color_manger.dart';
import '../../../resources/font_manger.dart';
import '../../../resources/styles_manger.dart';
import '../foundPerson/view/found_specific_person.dart';

import '../viewModel/view_model.dart';

class SpecificUnReportView extends StatefulWidget {
  const SpecificUnReportView({Key? key}) : super(key: key);

  @override
  State<SpecificUnReportView> createState() => _SpecificUnReportViewState();
}

class _SpecificUnReportViewState extends State<SpecificUnReportView> {
  final SpecificUnReportViewModel _viewModel =
      instance<SpecificUnReportViewModel>();

  _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorManger.black),
      ),
      body: StreamBuilder<FlowState>(
        stream: _viewModel.outState,
        builder: (context, snapshot) {
          return snapshot.data?.getScreenWidget(context, _getData(), () {
                _viewModel.start();
              }) ??
              _getData();
        },
      ),
    );
  }

  Widget _getData() {
    return SafeArea(
      child: StreamBuilder<List<DataModel>>(
        stream: _viewModel.outputData,
        builder: (context, snapshot) {
          return _showData(snapshot.data);
        },
      ),
    );
  }

  Widget _showData(List<DataModel>? data) {
    if (data != null) {
      return GridView.builder(
        padding: const EdgeInsets.only(
          top: 15,
          right: 8,
          left: 8,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            crossAxisSpacing: 5,
            mainAxisSpacing: 10),
        itemBuilder: (context, index) {
          String imageData =
              "${Constant.baseUrl}/storage/${_viewModel.getData[index].attributes?.picture}";

          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FoundSpecificPersonDetailsScreen(
                        _viewModel.getData[index]),
                  ));
            },
            child: _customCard(
                _viewModel.getData[index].attributes!.policeStation,
                _viewModel.getData[index].attributes?.createdAt,
                imageData),
          );
        },
        itemCount: _viewModel.getData.length,
      );
    } else {
      return _noData();
    }
  }

  Widget _noData() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            height: APPSize.s30.h,
            width: APPSize.s120.w,
            child: Lottie.asset(
          JsonAsset.empty,
        )),
        Text("No Data in Found",
            style: getRegularStyle(
                fontSize: FontSize.s18.sp, color: ColorManger.lightBlack)),
        SizedBox(
          height: APPSize.s18.h,
        )
      ],
    );
  }

  Widget _customCard(
    String? name,
    String? time,
    String? image,
  ) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(APPSize.s10.sp),
        ),
      ),
      elevation: 2,
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(APPSize.s10.sp),
                  topLeft: Radius.circular(APPSize.s10.sp)),
              child: CachedNetworkImage(
                imageUrl: "$image",
                height: AppPadding.p16.h,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    Image.asset(ImageAsset.profile),
              )),
          SizedBox(
            height: AppPadding.p1_5.h,
          ),
          Text(
            '$name',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontWeight: FontWeight.w500, fontSize: APPSize.s14.sp),
          ),
          SizedBox(
            height: AppPadding.p1_5.h,
          ),
          Text(
            '$time',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
