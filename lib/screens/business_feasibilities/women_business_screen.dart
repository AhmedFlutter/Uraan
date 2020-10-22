import 'package:flutter/material.dart';
import 'package:uraan/screens/layout/home_screen.dart';

import '../../constants.dart';
import '../../global.dart';
import '../../size_config.dart';

class WomenBusinesses extends StatefulWidget {
  WomenBusinesses({Key key}) : super(key: key);
  static String routeName = '/women_business';

  @override
  _WomenBusinessesScreenState createState() => _WomenBusinessesScreenState();
}

class _WomenBusinessesScreenState extends State<WomenBusinesses> {

  HomeScreenLayout _homeScreenLayout = HomeScreenLayout(
    parentDropdown: ParentDropdown.BusinessFeasibilities,
    childDropDown: ChildDropDown.WomenBusiness
  );

  @override
  Widget build(BuildContext context) {
    return _homeScreenLayout.build(
      context,
      body(context),
      title: "Women Businesses"
    );
  }

  Widget body(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfff0f0f6),
        body: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 51,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child :Container(
                              width: SizeConfig.screenWidth * 0.6,
                              decoration: BoxDecoration(
                                color: kSecondaryColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: TextField(
                                onChanged: (value) => print(value),
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: getProportionateScreenWidth(20),
                                        vertical: getProportionateScreenWidth(9)),
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    hintText: "Search Rural Businesses",
                                    prefixIcon: Icon(Icons.search)),
                              ),
                            )
                          ),
                          SizedBox(width: 15),
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xffe6e6ec),
                              borderRadius: BorderRadius.circular(9.0),
                            ),
                            child: IconButton(
                              icon: Icon(Icons.tune),
                              onPressed: null,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: jobList.length,
                        itemBuilder: (ctx, i) {
                          return singleView();
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget singleView() {
    return GestureDetector(
      // onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 0.0),
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(9.0),
          boxShadow: [
            BoxShadow(
                color: Colors.grey[300], blurRadius: 5.0, offset: Offset(0, 3))
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                // SizedBox(width: 15),
                Expanded(
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Women Businesses",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical:5.0),
                        decoration: BoxDecoration(
                          // backgroundBlendMode: BlendMode.lighten,
                          color: Colors.blue[300],
                          borderRadius: BorderRadius.circular(15.0)
                        ),
                        child: Text(
                          "Hyderabad, Pakistan",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
              style:
                  Theme.of(context).textTheme.bodyText2.apply(color: Colors.grey),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

}
