/* @author Fernando Quinonez
   +----------------------------------------------------------------------+
   |                           Dart Library                               |
   |                              randflat                                |
   +----------------------------------------------------------------------+
  
   Library defining methods for shooting flat random numbers, double or
   integers.
   It provides methods to fill with double flat values arrays of
   specified size, as well as methods for shooting sequences of 0,1 (bits).
   +----------------------------------------------------------------------+
   | JavaScript                                                           |
   +----------------------------------------------------------------------+
   F. Quinonez - Created 2015-10-30                  
               - Geant4 File
   +----------------------------------------------------------------------+
   | C++                                                                  |
   +----------------------------------------------------------------------+
   Gabriele Cosmo - Created: 5th September 1995
   Peter Urban    - ShootBit() and related stuff added: 5th Sep 1996
   Gabriele Cosmo - Added operator() and additional methods to fill
                    arrays specifying boundaries: 24th Jul 1997 
   J.Marraffino   - Added default arguments as attributes and
                    operator() with arguments: 16th Feb 1998
   M. Fischler    - Moved copy constructor to protected so that
  		    Rderived RandBit can get at it.
   M Fischler      - put and get to/from streams 12/10/04
*/
import 'dart:core';
import 'dart:async';
import 'dart:math';
import 'dart:io';
import 'package:bbt/random/randommzjcq.dart';
import 'package:bbt/random/heprandom.dart';
import 'package:bbt/random/heprandomengine.dart';


class randflat extends heprandom {

  double _xa, _xb, _width, _seed;
  heprandomengine _engine;

  randflat( { double xa: 0, 
              double xb: 1, 
              double width: null,
              int seed,  
              heprandomengine engine } ) {
    if ( width == null ) width = xb - xa;
    _xa = xa;
    _xb = xb;
    _width = width;


    if ( seed == null ) seed = 19780503;
    _seed = seed;
    if ( engine == null ) _engine = new randommzjcq( seed: _seed );
  } 

  double Fire() {
    return _width * _engine.Flat() + _xa;
  }

  void FireArray( int size, List<double> vect ){
    for ( int i = 0; i < size; ++i ){
      vect.add( Fire() );
    }
  }



}
