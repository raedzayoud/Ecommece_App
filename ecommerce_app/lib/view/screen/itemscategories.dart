import 'package:ecommerce_app/controller/items_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/linkapi.dart';
import 'package:ecommerce_app/view/widget/customappar.dart';
import 'package:ecommerce_app/view/widget/items/listitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hash_cached_image/hash_cached_image.dart';

class Itemscategories extends StatelessWidget {
  const Itemscategories({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    return Scaffold(
      body: Container(
        color: AppColor.white,
        padding: EdgeInsets.all(15),
        child: ListView(children: [
          Customappar(
            titleappar: "Find Your Product ",
            onPressedIcon: () {},
            onPressedSearch: () {},
          ),
          Listitems(),
          GridView.builder(
              itemCount: 2,
              /* this two lines are necessary for not show me a bug because they are problems when we put list view in the children of it a gridview */
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              /**/
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.55),
              itemBuilder: (BuildContext context, index) {
                return InkWell(
                  child: Card(
                    color: AppColor.white,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          HashCachedImage(
                              imageUrl: AppLinkApi.imagesItems + "/laptop.png"),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Laptop Surface Go 2 ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14,
                                color: AppColor.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Description how are you",
                              textAlign: TextAlign.center),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              
                              Text("200.01\$", textAlign: TextAlign.start,style: TextStyle(
                                fontSize: 14,
                                color: AppColor.secondcolor,
                                fontWeight: FontWeight.bold),),
                              IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: AppColor.secondcolor,))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {},
                );
              }),
        ]),
      ),
    );
  }
}
