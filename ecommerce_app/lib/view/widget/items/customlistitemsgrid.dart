import 'package:ecommerce_app/controller/favourite_controller.dart';
import 'package:ecommerce_app/controller/items_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/imageassets.dart';
import 'package:ecommerce_app/data/model/itemsmodel.dart';
import 'package:ecommerce_app/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hash_cached_image/hash_cached_image.dart';

class Customlistitemsgrid extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;
  
  const Customlistitemsgrid({
    super.key,
    required this.itemsModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.getToProductDetails(itemsModel);
      },
      child: Stack(
        children: [
          Container(
            height: 300,
            child: Card(
              color: AppColor.white,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: "${itemsModel.itemsId}",
                      child: SizedBox(
                        height: 150,  // Specify the image height directly
                        child: HashCachedImage(
                          imageUrl: AppLinkApi.imagesItems +
                              "/" +
                              itemsModel.itemsImage!,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: Expanded(
                        child: Text(
                          "${itemsModel.itemsName}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13,
                            color: AppColor.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            "${itemsModel.itemsPrice}\$",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColor.secondcolor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        GetBuilder<FavouriteControllerImp>(
                          builder: (controller) => IconButton(
                            onPressed: () {
                              if (controller.isfavorite[itemsModel.itemsId] == "1") {
                                controller.setFavoutite(itemsModel.itemsId, "0");
                                controller.removeFavourite(itemsModel.itemsId.toString());
                              } else {
                                controller.setFavoutite(itemsModel.itemsId, "1");
                                controller.addFavourite(itemsModel.itemsId.toString());
                              }
                            },
                            icon: Icon(
                              controller.isfavorite[itemsModel.itemsId] == "1"
                                  ? Icons.favorite
                                  : Icons.favorite_outline,
                              color: AppColor.secondcolor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (itemsModel.itemsDiscounts != 0)
            Positioned(
              top: 5,
              child: Image.asset(
                AppImageassets.sales,
                width: 40,
              ),
            ),
          if (itemsModel.itemsDiscounts != 0)
            Positioned(
              top: 252,
              left: 10,
              child: Text(
                "--------",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          if (itemsModel.itemsDiscounts != 0)
            Positioned(
              top: 252,
              left: 66,
              child: Text(
                "${itemsModel.itemsdiscount}\$",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColor.secondcolor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
