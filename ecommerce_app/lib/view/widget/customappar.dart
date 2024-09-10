import 'package:flutter/material.dart';

class Customappar extends StatelessWidget {
  final String titleappar;
  final void Function()? onPressedIcon;
  final void Function()? onPressedSearch;
  final void Function()? onPressedFavourite;
  const Customappar({
    super.key,
    required this.titleappar,
    this.onPressedIcon,
    this.onPressedSearch,
    this.onPressedFavourite,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
            decoration: InputDecoration(
                prefixIcon: IconButton(
                  onPressed: onPressedSearch,
                  icon: Icon(Icons.search),
                ),
                hintText: titleappar,
                hintStyle: TextStyle(fontSize: 17),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: Colors.grey[200]),
          )),
          SizedBox(
            width: 10,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            width: 60,
            padding: EdgeInsets.symmetric(vertical: 7),
            child: IconButton(
                onPressed: onPressedIcon,
                icon: Icon(
                  Icons.notifications_active_outlined,
                  size: 28,
                  color: Colors.grey[600],
                )),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            width: 60,
            padding: EdgeInsets.symmetric(vertical: 7),
            child: IconButton(
                onPressed: onPressedFavourite,
                icon: Icon(
                  Icons.favorite_border_outlined,
                  size: 28,
                  color: Colors.grey[600],
                )),
          )
        ],
      ),
    );
  }
}
