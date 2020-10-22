import 'package:flutter/material.dart';
import 'package:uraan/screens/layout/home_screen.dart';


class JobsAllOverPakistan extends StatefulWidget {
  JobsAllOverPakistan({Key key}) : super(key: key);
  static String routeName = '/jobs_all_over_pakistan';

  @override
  _JobsAllOverPakistanScreenState createState() => _JobsAllOverPakistanScreenState();
}

class _JobsAllOverPakistanScreenState extends State<JobsAllOverPakistan> {

  HomeScreenLayout _homeScreenLayout = HomeScreenLayout(
    parentDropdown: ParentDropdown.Jobs,
    childDropDown: ChildDropDown.JobsAllOverPakistan
  );

  @override
  Widget build(BuildContext context) {
    return _homeScreenLayout.build(
      context,
      body(context),
      title: "Jobs All Over Pakistan"
    );
  }

  Widget body(BuildContext context) {
    return Center(
      child: Container(child: Text('Coming Soon', style: Theme.of(context).textTheme.headline6),),
    );
  }

}
