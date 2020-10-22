import 'package:equatable/equatable.dart';

class NationalScholarShip extends Equatable{
  final String id;
  final String city;
  final String description;
  final String scholarShipType;
  final String awardingBody;
  final String lastDateApply;
  final String howToApply;
  final String contactDetails;

  NationalScholarShip({this.id, this.city, this.description, this.scholarShipType, this.awardingBody, this.lastDateApply, this.howToApply, this.contactDetails});

  @override
  List<Object> get props => [id, city, description, scholarShipType, awardingBody,lastDateApply, howToApply, contactDetails];
}


class InterNationalScholarShip extends Equatable{
  final String id;
  final String country;
  final String description;
  final String scholarShipType;
  final String awardingBody;
  final String lastDateApply;
  final String howToApply;

  InterNationalScholarShip({this.id, this.country, this.description, this.scholarShipType, this.awardingBody, this.lastDateApply, this.howToApply});

  @override
  List<Object> get props => [id, description, scholarShipType, awardingBody,lastDateApply, howToApply];
}
