import 'package:BBT/Random/GENERATOR_MZJCQ.dart';

void main(){
  print('Hello World');
  var gen = new GENERATOR_MZJCQ( 234 );
  int n = 50;
  List<double> v = new List();
  gen.FlatArray( n, v );
  for( double i in v ) print( '$i' );  
}
