import 'package:bbt/random/RandFlat.dart';

void main(){
  print('Hello World');
  var pdf = new RandFlat( xa: 0, xb: 5 );
  int n = 50;
  List<double> v = new List();
  pdf.FireArray( n, v );
  for( double i in v ) print( '$i' );  
}
