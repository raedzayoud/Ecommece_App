import 'package:ecommerce_app/controller/homepage_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/data/model/itemsmodel.dart';
import 'package:ecommerce_app/view/widget/customappar.dart';
import 'package:ecommerce_app/view/widget/home/customcardhome.dart';
import 'package:ecommerce_app/view/widget/home/customtexttitle.dart';
import 'package:ecommerce_app/view/widget/home/listcategories.dart';
import 'package:ecommerce_app/view/widget/home/listitemshome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    HomepageControllerImp controllerImp = Get.put(HomepageControllerImp());
    return GetBuilder<HomepageControllerImp>(
      builder: (controllerImp) => SafeArea(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // App Bar
                Customappar(
                  controller: controllerImp.searchcontroller!,
                  titleappar: "Find Product",
                  onPressedIcon: () {},
                  onPressedSearch: () {
                    controllerImp.onSearchItems();
                  },
                  onPressedFavourite: () {
                    controllerImp.goToFavourite();
                  },
                  onChanged: (val) {
                    controllerImp.checkSearch(val);
                  },
                ),
                const SizedBox(height: 10), // Add spacing

                // Handling Data View
                Handlingdataview(
                  statusRequest: controllerImp.statusRequest,
                  widget: controllerImp.isSearch == false
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Customcardhome(
                              body: "CashBack 20 %",
                              title: "A summer surprise",
                            ),
                            const Customtexttitle(
                              title: "Categories",
                            ),
                            const Listcategories(),
                            const Customtexttitle(
                              title: "Offer For You",
                            ),
                            const Listitemshome(),
                            const Customtexttitle(
                              title: "Product For You",
                            ),
                            const Listitemshome(),
                          ],
                        )
                      : Center(
                          child: ListItemsSearch(
                            itemsModel: controllerImp.dataItems,
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ListItemsSearch extends StatelessWidget {
  final List<ItemsModel> itemsModel;
  const ListItemsSearch({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      color: AppColor.white,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: itemsModel.length,
        itemBuilder: (context, index) {
          return Text("${itemsModel[index].itemsName}");
        },
      ),
    );
  }
}
