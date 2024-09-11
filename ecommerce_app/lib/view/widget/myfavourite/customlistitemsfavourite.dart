import 'package:ecommerce_app/controller/favourite_controller.dart';
import 'package:ecommerce_app/controller/items_controller.dart';
import 'package:ecommerce_app/controller/myfavourite_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/data/model/itemsmodel.dart';
import 'package:ecommerce_app/data/model/myfavourite.dart';
import 'package:ecommerce_app/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hash_cached_image/hash_cached_image.dart';

class Customlistitemsfavourite extends GetView<MyfavouriteControllerImp> {
  final Myfavourite itemsModel;

  const Customlistitemsfavourite({
    super.key,
    required this.itemsModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // controller.getToProductDetails(itemsModel);
      },
      child: Card(
        color: AppColor.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Hero(
                tag: "${itemsModel.itemsId}",
                child: HashCachedImage(
                  imageUrl: AppLinkApi.imagesItems + "/" + itemsModel.itemsImage!,
                  height: 150,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "${itemsModel.itemsName} ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColor.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Raiting...."),
                      Spacer(),
                      ...List.generate(3, (index) => Icon(Icons.star, size: 18)),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${itemsModel.itemsPrice}\$",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColor.secondcolor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(onPressed: (){
                      controller.deletefavourite(itemsModel.favouriteId.toString());
                    }, icon: Icon(Icons.delete))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
