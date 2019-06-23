# onePersonChess
finding the solution to onePersonChess using swift language

![alt text](https://raw.githubusercontent.com/maysam/onePersonChess/master/onepersonchess.gif)

There is only one solution to this game but i can have two final ending due to the nature of the game

```
42U23R35D43L63L15R45L37D57L51U54D56D75L13R43L14R34U37D25R45R73U75L55D31U23R44D52U64L41U43U46D
```

On MacBook Pro (Retina, 13-inch, Early 2015) it took about 4 hours and 10 minutes to run

Here is the output of the program, showing how it iterated through 31 iterations:


```
turned 4 to 1 with 3 weights
581803004.576367: step 1 took 0.0009800195693969727 seconds with 1 boards
turned 3 to 2 with 7 weights
581803004.576487: step 2 took 0.00010192394256591797 seconds with 2 boards
turned 10 to 8 with 31 weights
581803004.576923: step 3 took 0.0004279613494873047 seconds with 8 boards
turned 50 to 38 with 146 weights
581803004.577815: step 4 took 0.0008800029754638672 seconds with 38 boards
turned 282 to 165 with 652 weights
581803004.582705: step 5 took 0.004878997802734375 seconds with 165 boards
turned 1380 to 691 with 2739 weights
581803004.614791: step 6 took 0.03207707405090332 seconds with 691 boards
turned 6212 to 2668 with 10618 weights
581803004.686509: step 7 took 0.07169806957244873 seconds with 2668 boards
turned 25286 to 9545 with 38073 weights
581803005.023941: step 8 took 0.33739709854125977 seconds with 9545 boards
turned 93317 to 31062 with 124054 weights
581803006.233245: step 9 took 1.2092750072479248 seconds with 31062 boards
turned 306095 to 90105 with 360058 weights
581803009.98187: step 10 took 3.7485910654067993 seconds with 90105 boards
turned 880825 to 231524 with 925528 weights
581803020.838633: step 11 took 10.856729984283447 seconds with 231524 boards
turned 2219704 to 523873 with 2094571 weights
581803047.126588: step 12 took 26.287917017936707 seconds with 523873 boards
turned 4873781 to 1036301 with 4143747 weights
581803110.142155: step 13 took 63.01552402973175 seconds with 1036301 boards
turned 9252528 to 1783223 with 7130966 weights
581803239.719251: step 14 took 129.57705998420715 seconds with 1783223 boards
turned 15130725 to 2661949 with 10645173 weights
581803514.285187: step 15 took 274.5658960342407 seconds with 2661949 boards
turned 21275098 to 3443183 with 13769609 weights
581804165.139343: step 16 took 650.8540550470352 seconds with 3443183 boards
turned 25679839 to 3857423 with 15426093 weights
581805302.505976: step 17 took 1137.3665030002594 seconds with 3857423 boards
turned 26575953 to 3743143 with 14968871 weights
581807415.974403: step 18 took 2113.468204021454 seconds with 3743143 boards
turned 23570065 to 3148442 with 12590009 weights
581812453.439516: step 19 took 5037.463379979134 seconds with 3148442 boards
turned 17908758 to 2296110 with 9181189 weights
581816588.702896: step 20 took 4135.260522007942 seconds with 2296110 boards
turned 11644123 to 1451015 with 5801372 weights
581817490.425519: step 21 took 901.7212419509888 seconds with 1451015 boards
turned 6458599 to 792672 with 3168674 weights
581817777.785642: step 22 took 287.35926604270935 seconds with 792672 boards
turned 3037127 to 372099 with 1487042 weights
581817819.316724: step 23 took 41.53097999095917 seconds with 372099 boards
turned 1198304 to 148994 with 595083 weights
581817835.689761: step 24 took 16.372997045516968 seconds with 148994 boards
turned 392862 to 50529 with 201586 weights
581817841.358181: step 25 took 5.668383002281189 seconds with 50529 boards
turned 105611 to 14323 with 57027 weights
581817843.141532: step 26 took 1.783308982849121 seconds with 14323 boards
turned 22412 to 3275 with 12970 weights
581817843.71279: step 27 took 0.5712189674377441 seconds with 3275 boards
turned 3507 to 593 with 2306 weights
581817843.907715: step 28 took 0.19488894939422607 seconds with 593 boards
turned 428 to 85 with 321 weights
581817843.953872: step 29 took 0.04612100124359131 seconds with 85 boards
turned 24 to 9 with 30 weights
581817843.966139: step 30 took 0.012228012084960938 seconds with 9 boards
turned 2 to 2 with 4 weights
581817843.96744: step 31 took 0.0012630224227905273 seconds with 2 boards
Printing 2 boards:

Path: 42U23R35D43L63L15R45L37D57L51U54D56D75L13R43L14R34U37D25R45R73U75L55D31U23R44D52U64L41U43U45U
🏜🏜⌨️⌨️⌨️🏜🏜
🏜🏜⌨️⌨️⌨️🏜🏜
⌨️⌨️⌨️⌨️⌨️⌨️⌨️
⌨️⌨️⌨️⌨️⌨️⌨️⌨️
⌨️⌨️⌨️⌨️⌨️⌨️⌨️
🏜🏜⌨️⌨️⌨️🏜🏜
🏜🏜⌨️🏠⌨️🏜🏜


Path: 42U23R35D43L63L15R45L37D57L51U54D56D75L13R43L14R34U37D25R45R73U75L55D31U23R44D52U64L41U43U46D
🏜🏜⌨️⌨️⌨️🏜🏜
🏜🏜⌨️⌨️⌨️🏜🏜
⌨️⌨️⌨️⌨️⌨️⌨️⌨️
⌨️⌨️⌨️🏠⌨️⌨️⌨️
⌨️⌨️⌨️⌨️⌨️⌨️⌨️
🏜🏜⌨️⌨️⌨️🏜🏜
🏜🏜⌨️⌨️⌨️🏜🏜


2  boards printed


Totally took 14839.402358055115 seconds with 2 boards
Program ended with exit code: 0
```
