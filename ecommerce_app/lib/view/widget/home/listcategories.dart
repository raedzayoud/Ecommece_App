import 'package:ecommerce_app/controller/homepage_controller.dart';
import 'package:ecommerce_app/data/model/categoriesmodel.dart';
import 'package:ecommerce_app/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Listcategories extends GetView<HomepageControllerImp> {
  const Listcategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: double
          .infinity, // Ensures the container takes the full width available
      child: ListView.separated(
        separatorBuilder: (context, index) =>
            SizedBox(width: 20), // Adds spacing between items
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          return categories(
            categoriesModel:
                CategoriesModel.fromJson(controller.categories[index]),
            i: index,
          );
        },
      ),
    );
  }
}

class categories extends GetView<HomepageControllerImp> {
  final CategoriesModel categoriesModel;
  final int i;
  const categories({super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItems(controller.categories, i,categoriesModel.categoriesId!);
      },
      child: Column(
        children: [
          Container(
            width: 80, // Ensure each item has a consistent width
            height: 70,
            decoration: BoxDecoration(
              border: Border.all(
                  color:
                      Colors.blue, // Change this to your desired border color
                  width: 2 // Adjust the border width as needed
                  ),
              borderRadius: BorderRadius.circular(
                  10), // Ensure the border has rounded corners
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                  8), // Ensure the image's corners are slightly inside the border
              child: Image.network(
                "${AppLinkApi.imagesCategories}/${categoriesModel.categoriesImage}",
                fit: BoxFit
                    .cover, // Ensures the image covers the container without distortion
                errorBuilder: (context, error, stackTrace) => Icon(Icons
                    .error), // Shows an error icon if the image fails to load
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                "${categoriesModel.categoriesName}",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ))
        ],
      ),
    );
  }
}
