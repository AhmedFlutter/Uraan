import 'package:flutter/material.dart';
import 'package:uraan/screens/layout/home_screen.dart';

import '../../constants.dart';
import '../../global.dart';
import '../../size_config.dart';

class ShortCourses extends StatefulWidget {
  ShortCourses({Key key}) : super(key: key);
  static String routeName = '/short_courses';

  @override
  _ShortCoursesScreenState createState() => _ShortCoursesScreenState();
}

class _ShortCoursesScreenState extends State<ShortCourses> {

  HomeScreenLayout _homeScreenLayout = HomeScreenLayout(
    // parentDropdown: ParentDropdown.,
    childDropDown: ChildDropDown.ShortCourses
  );

  @override
  Widget build(BuildContext context) {
    return _homeScreenLayout.build(
      context,
      body(context),
      title: "Short Courses"
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
                                    hintText: "Search Short Courses",
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

  // Widget singleView() {
  //   return GestureDetector(
  //     // onTap: onTap,
  //     child: Container(
  //       margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
  //       padding: const EdgeInsets.all(15.0),
  //       decoration: BoxDecoration(
  //         color: Colors.white,
  //         borderRadius: BorderRadius.circular(9.0),
  //         boxShadow: [
  //           BoxShadow(
  //               color: Colors.grey[300], blurRadius: 5.0, offset: Offset(0, 3))
  //         ],
  //       ),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: <Widget>[
  //           Row(
  //             children: <Widget>[
  //               SizedBox(width: 15),
  //               Expanded(
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: <Widget>[
  //                     Text(
  //                       "Flutter Developer",
  //                       style: Theme.of(context).textTheme.headline6,
  //                     ),
  //                     Text(
  //                       "Hyderabad, Pakistan",
  //                       style: Theme.of(context).textTheme.subtitle2.apply(
  //                             color: Colors.grey,
  //                           ),
  //                     )
  //                   ],
  //                 ),
  //               )
  //             ],
  //           ),
  //           SizedBox(height: 5),
  //           Text(
  //             "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
  //             style:
  //                 Theme.of(context).textTheme.bodyText2.apply(color: Colors.grey),
  //             maxLines: 3,
  //             overflow: TextOverflow.ellipsis,
  //           ),
  //           SizedBox(height: 9),
  //           Text(
  //             "Rs30k",
  //             style:
  //                 Theme.of(context).textTheme.subtitle2.apply(fontWeightDelta: 2),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }


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
                        "Android Development",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          getFlag(Colors.blue[300], "Karachi"),
                          SizedBox(width: 10,),
                          getFlag(Colors.teal[300], "Aptech"),
                        ],
                      ),

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
            SizedBox(height: 15),

            // Text(
            //   "Rs30k",
            //   style:
            //       Theme.of(context).textTheme.subtitle2.apply(fontWeightDelta: 2),
            // )
          ],
        ),
      ),
    );
  }

  Widget getFlag(Color color, String text) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical:5.0),
    decoration: BoxDecoration(
      // backgroundBlendMode: BlendMode.lighten,
      color: color,
      borderRadius: BorderRadius.circular(15.0)
    ),
    child:
      Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

}
