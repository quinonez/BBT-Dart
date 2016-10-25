/* @author: Fernando Quinonez
   +----------------------------------------------------------------------+
   |                           Dart Library                               |
   |                          HepJamesRandom                              |
   +----------------------------------------------------------------------+
  
   This algorithm implements the original universal random number generator
   as proposed by Marsaglia & Zaman in report FSU-SCRI-87-50,
   described in "F. James, Comp. Phys. Comm. 60 (1990) 329" and coded
   in FORTRAN77 by Fred James as the RANMAR generator, part of the MATHLIB
   HEP library. This algorithm was incorporated to the Geant4 simulation
   toolkit by G. Cosmo (1995) and coded in JavaScript by F. Quinonez (2015). 

   - Geant4 Class: HepJamesRandom. 

   +----------------------------------------------------------------------+
   | Dart                                                                 |
   +----------------------------------------------------------------------+
   F. Quinonez - Created 2016-10-19                  
   +----------------------------------------------------------------------+
   | JavaScript                                                           |
   +----------------------------------------------------------------------+
   F. Quinonez - Created 2015-10-19                  
   https://github.com/quinonez/jamesrandom

   +----------------------------------------------------------------------+
   | C++                                                                  |
   +----------------------------------------------------------------------+
   Gabriele Cosmo - Created: 5th September 1995
                  - Fixed a bug in setSeed(): 26th February 1996
                  - Minor corrections: 31st October 1996
                  - Added methods for engine status: 19th November 1996
                  - Fixed bug in setSeeds(): 15th September 1997
   J.Marraffino   - Added stream operators and related constructor.
                    Added automatic seed selection from seed table and
                    engine counter: 16th Feb 1998
   Ken Smith      - Added conversion operators:  6th Aug 1998
   J. Marraffino  - Remove dependence on hepString class  13 May 1999
   V. Innocente   - changed pointers to indices     3 may 2000
   M. Fischler    - In restore, checkFile for file not found  03 Dec 2004
   M. Fischler    - Methods for distrib. instacne save/restore  12/8/04    
   M. Fischler    - split get() into tag validation and 
                    getState() for anonymous restores 12/27/04    
   M. Fischler    - Enforcement that seeds be non-negative
  		    (lest the sequence be non-random) 2/14/05    
   M. Fischler    - put/get for vectors of ulongs	3/14/05
   M. Fischler    - State-saving using only ints, for portability 4/12/05
*/

import 'dart:async';
import 'dart:math';
import 'dart:io';
import 'package:bbt/random/HepRandomEngine.dart';


class RandomMZJCQ extends HepRandomEngine{ 
  List<double> _u = new List();
  double _c, _cd, _cm;
  int _i97, _j97;

  int gSeed;
  List<int> gSeeds;

  RandomMZJCQ( { int seed: DateTime.millisecondsSinceEpoch(), List<int> seeds } ){
    gSeed = seed;
    gSeeds = seeds;
    SetSeed( gSeed );
    //SetSeeds( theSeeds );
  }

  void SetSeed( int seed ){
    // The input value for "seed" should be within the range [0,900000000]
    //
    // Negative seeds result in serious flaws in the randomness;
    // seeds above 900000000 are OK because of the %177 in the expression for i,
    // but may have the same effect as other seeds below 900000000.

    int m, n, mm; // integers
    double s, t;

    if( seed < 0 ){
      var msg = "Seed for HepJamesRandom must be non-negative. Seed value supplied was" + seed + ". Using its absolute value instead.";
      console.log( msg );
      seed = -seed;
    }

    int ij = seed / 30082;
    int kl = seed - ( 30082 * ij );
    int i = ( ( ij / 177 ) % 177 ) + 2;
    int j = ( ij % 177 ) + 2;
    int k = ( ( kl / 169 ) % 178 ) + 1;
    int l = kl % 169;
    
    super.theSeed = seed;

    for ( n = 1 ; n < 98; n++ ) {
      s = 0.0;
      t = 0.5;
      for ( m = 1 ; m < 25; m++ ) {
        mm = ( ( (i*j) % 179 ) * k ) % 179;
        i = j;
        j = k;
        k = mm;
        l = ( 53 * l + 1 ) % 169;
        if ( (l*mm % 64 ) >= 32 )
          s += t;
        t *= 0.5;
      }
      _u.add( s );
    }
    _c = 362436.0 / 16777216.0;
    _cd = 7654321.0 / 16777216.0;
    _cm = 16777213.0 / 16777216.0;
    
    _i97 = 96;
    _j97 = 32;

  }


  void SetSeeds( List<int> seeds ){
    super.theSeeds = seeds;
  };

  double Flat(){

    double uni;

    do {
       uni = _u[ _i97 ] - _u[ _j97 ];
       if ( uni < 0.0 ) uni++;
       _u[ _i97 ] = uni;
       
       if ( _i97 == 0 ) _i97 = 96;
       else _i97--;
       
       if ( _j97 == 0 ) _j97 = 96;
       else _j97--;
         
       _c -= _cd;
       if ( _c < 0.0 ) _c += _cm;
       
       uni -= _c;
       if ( uni < 0.0 ) uni += 1.0;
    } while ( uni <= 0.0 || uni >= 1.0 );
      
    return uni;

  }

  void FlatArray( int size, List<double> vect ){
    for ( int i = 0; i < size; ++i ){
      vect.add( Flat() );
    }   
  }

}
