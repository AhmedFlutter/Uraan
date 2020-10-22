import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uraan/blocs/authentication/bloc/authentication_bloc.dart';
import 'package:uraan/screens/business_feasibilities/rural_business_screen.dart';
import 'package:uraan/screens/business_feasibilities/urban_business_screen.dart';
import 'package:uraan/screens/business_feasibilities/women_business_screen.dart';
import 'package:uraan/screens/interships/internship_screen.dart';
import 'package:uraan/screens/jobs/jobs_all_over_pakistan.dart';
import 'package:uraan/screens/jobs/jobs_with_in_punjab.dart';
import 'package:uraan/screens/scholarships/scholarship_international_screen.dart';
import 'package:uraan/screens/scholarships/scholarship_national_screen.dart';
import 'package:uraan/screens/short_courses/short_course.dart';
import 'package:uraan/screens/sign_in/sign_in_screen.dart';
import 'package:uraan/screens/training_workshops/training_workshop.dart';

enum ParentDropdown {
  ScholarShips,
  Jobs,
  BusinessFeasibilities
}

enum ChildDropDown {
  NationalScholarShips,
  InternationalScholarShips,
  JobsWithInPunjab,
  JobsAllOverPakistan,
  ShortCourses,
  InternshipOppurtunities,
  TrainingWorkshops,
  UrbanBusiness,
  RuralBusiness,
  WomenBusiness
}

class HomeScreenLayout{
  final ParentDropdown parentDropdown;
  final ChildDropDown childDropDown;
  // final Function body;

  HomeScreenLayout({this.childDropDown, this.parentDropdown});

  Widget build(BuildContext context, Widget body, {@required String title}) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text(title, style: TextStyle(color: Colors.white)),
        iconTheme: new IconThemeData(color: Colors.white),
      ),
      body: body,
      drawer: _getHomeScreenAccountDrawer(context, "Requests"),
    );
  }

  Drawer _getHomeScreenAccountDrawer(BuildContext context,String title) {
    return Drawer(
      child: ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.lightBlue),
              accountName: Text(
                'Ahmed Raza',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0),
              ),
              accountEmail: Text(
                'ahmee.razaa@gmail.com',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0),
              ),
              currentAccountPicture: Icon(
                Icons.account_circle,
                size: 50.0,
                color: Colors.white,
              ),
              margin: EdgeInsets.only(bottom: 0.0),
        ),
        ExpansionTile(
          title: Text("Scholar Ships"),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          expandedAlignment: Alignment.topLeft,
          initiallyExpanded: parentDropdown == ParentDropdown.ScholarShips,
          children: [
            Padding(
              padding: const EdgeInsets.only(left:15.0),
              child: ListTile(
                title: Text('National', style: TextStyle(
                  color: childDropDown == ChildDropDown.NationalScholarShips ? Colors.lightBlue : Colors.black
                )),
                onTap: () {
                  Navigator.pushNamed(context, ScholarShipNationalScreen.routeName);
                }
              ),
            ),
            Divider(
              height: 2.0,
              thickness: 1.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left:15.0),
              child: ListTile(
                title: Text('International', style: TextStyle(
                  color: childDropDown == ChildDropDown.InternationalScholarShips ? Colors.lightBlue : Colors.black
                )),
                onTap: () {
                  Navigator.pushNamed(context, ScholarShipInterNationalScreen.routeName);
                },
              ),
            )
          ],
        ),
        ExpansionTile(
          title: Text("Jobs"),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          expandedAlignment: Alignment.topLeft,
          initiallyExpanded: parentDropdown == ParentDropdown.Jobs,
          children: [
            Padding(
              padding: const EdgeInsets.only(left:15.0),
              child: ListTile(
                title: Text('Jobs With In Punjab', style: TextStyle(
                  color: childDropDown == ChildDropDown.JobsWithInPunjab ? Colors.lightBlue : Colors.black
                )),
                onTap: () {
                  Navigator.pushNamed(context, JobsWithInPunjabScreen.routeName);
                },
              ),
            ),
            Divider(
              height: 2.0,
              thickness: 1.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left:15.0),
              child: ListTile(
                title: Text('Jobs All Over Pakistan', style: TextStyle(
                  color: childDropDown == ChildDropDown.JobsAllOverPakistan ? Colors.lightBlue : Colors.black
                )),
                onTap: () {
                  Navigator.pushNamed(context, JobsAllOverPakistan.routeName);
                },
              ),
            )
          ],
        ),
        ListTile(
          title: Text("Short Courses", style: TextStyle(
            color: childDropDown == ChildDropDown.ShortCourses ? Colors.lightBlue : Colors.black
          )),
          onTap: () {
            Navigator.pushNamed(context, ShortCourses.routeName);
          },
        ),
        ListTile(
          title: Text("Internship Opportunities",style: TextStyle(
            color: childDropDown == ChildDropDown.InternshipOppurtunities ? Colors.lightBlue : Colors.black
          )),
          onTap: () {
            Navigator.pushNamed(context, InternshipScreen.routeName);
          },
        ),
        ListTile(
          title: Text("Training & Workshops", style: TextStyle(
            color: childDropDown == ChildDropDown.TrainingWorkshops ? Colors.lightBlue : Colors.black
          )),
          onTap: () {
            Navigator.pushNamed(context, TrainingWorkshops.routeName);
          },
        ),
        ExpansionTile(
          title: Text("Business Feasibilities"),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          expandedAlignment: Alignment.topLeft,
          initiallyExpanded: parentDropdown == ParentDropdown.BusinessFeasibilities,
          children: [
            Padding(
              padding: const EdgeInsets.only(left:15.0),
              child: ListTile(
                title: Text('Urban Businesses', style: TextStyle(
                  color: childDropDown == ChildDropDown.UrbanBusiness ? Colors.lightBlue : Colors.black
                )),
                onTap: () {
                  Navigator.pushNamed(context, UrbanBusinesses.routeName);
                },
              ),
            ),
            Divider(
              height: 2.0,
              thickness: 1.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left:15.0),
              child: ListTile(
                title: Text('Rural Businesses', style: TextStyle(
                  color: childDropDown == ChildDropDown.RuralBusiness ? Colors.lightBlue : Colors.black
                )),
                onTap: () {
                  Navigator.pushNamed(context, RuralBusinesses.routeName);
                },
              ),
            ),
            Divider(
              height: 2.0,
              thickness: 1.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left:15.0),
              child: ListTile(
                title: Text('Women Businesses', style: TextStyle(
                  color: childDropDown == ChildDropDown.WomenBusiness ? Colors.lightBlue : Colors.black
                )),
                onTap: () {
                  Navigator.pushNamed(context, WomenBusinesses.routeName);
                },
              ),
            )
          ],
        ),
        BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {

            if(state is SignOutSuccess) {
              Navigator.pushNamed(context, SignInScreen.routeName);
            }

          },
          child: ListTile(
            title: Text("Sign Out", style: TextStyle(
              color: Colors.black
            )),
            onTap: () {
              BlocProvider.of<AuthenticationBloc>(context).add(SignOutEvent());
              // Navigator.pushNamed(context, TrainingWorkshops.routeName);
            },
          ),
        ),
      ],
    ));
  }
}
