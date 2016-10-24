import 'package:bbt/random/hepjamesrandom.dart';
import 'package:bbt/random/generator_mzjcq.dart';

void main(){
  print('Hello World');
  var gen = new hepjamesrandom( 234 );
  int n = 50;
  List<double> v = new List();
  gen.FlatArray( n, v );
  for( double i in v ) print( '$i' );  
}
