# BBT-Dart
## USAGE
```bash
./RUNME.sh
```



### lib/random/HepRandomEngine.dart
Super class for pseudo-random number generator algorithms.
### lib/random/HepRandom.dart
Super class for probability distribution functions calculations.
### lib/random/HepJamesRandom.dart
Same as RandomMZJCQ.dart
### lib/random/RandomMZJCQ.dart
This algorithm implements the original universal random number generator
as proposed by Marsaglia & Zaman in report FSU-SCRI-87-50,
described in "F. James, Comp. Phys. Comm. 60 (1990) 329" and coded
in FORTRAN77 by Fred James as the RANMAR generator, part of the MATHLIB
HEP library. This algorithm was incorporated to the Geant4 simulation
toolkit by G. Cosmo (1995) and coded in JavaScript by F. Quinonez (2015). 

Pseudo-random numbers generator Marzaglia-Zaman-James-Cosmo-Quinonez
Known in the High Energy Physics community as the HepJamesRandom generator.
### lib/random/RandFlat.dart
Probability Distribution Function PDF Uniform.


# Librería: random
## Clases:
Generador de números pseudo-aleatorios Marzaglia-Zaman-James-Cosmo-Quiñonez.
Conocido en la comunidad de Física de Altas Energías, como el generador HepJamesRandom.

