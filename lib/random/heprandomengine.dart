import 'dart:async';
import 'dart:math';
import 'dart:io';

class heprandomengine {
  int theSeed;
  List<int> theSeeds;

  heprandomengine({int seed: 19780503}){

    void SetSeed( int seed ){}
    void SetSeeds( List<int> seeds ){}

  }

  int GetSeed() {
    return theSeed;
  }

  List<int> GetSeeds() {
    return theSeeds;
  }

  double Flat();
  void FlatArray( int size, List<double> vect );
  //void SaveStatus( const String filename = 'Config.conf' );
  //void RestoreStatus( const String filename = 'Config.conf' );
  //void ShowStatus() const;

}
