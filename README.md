Takeaway Challenge
==================

This projects is still in a initial state, it tries to simulate an Takeaway restaurant. You can interact with it with irb in the command line. The coding is based on 4 user stories(docs/userstories.txt). 2 of them are implemented at this moment.

Author
------

This README.md and the code was made by Wim Hekkelman at Makers Academy (jan 2016 cohort).

Installation and requirements
-----------------------------

This Takeaway Challenge is forked and cloned locally from https://github.com/makersacademy/takeaway-challenge

After cloning only bundle was run.
```
bundle
```
Directories
-----------
- docs contains the domain model and userstories
- lib contains the program files and the menu files
- spec contains rspec tests

Instructions
------------
```
2.2.3 :001 > require './lib/take_away'
 => true
2.2.3 :002 > takeaway = TakeAway.new
 => #<TakeAway:0x007fcbd89810d8 @order={}, @dish_hash={}>
   2.2.3 :003 > takeaway.show_menu
                       MENU

              COMBINATIE MENU'S met rijst

 1  BABI PANGANG / Koe loe kai                     € 11,90
 2  BABI PANGANG / Tjap tjoy kip                   € 11,70
 3  BABI PANGANG / Foe yong hai kip                € 11,70
       etc
17  ZEEWIER SALADE                                 €  2,50
18  TONIJN SALADE                                  €  2,50
19  ZURE KOMKOMMER                                 €  2,50
=> #<File:lib/menu.txt (closed)>  
2.2.3 :004 > takeaway.enter_order
Enter the dish number and the quantity when ask
Enter a dish number or 99 to end ordering
2
Enter quantity
3
Enter a dish number or 99 to end ordering
18
Enter quantity
2
Enter a dish number or 99 to end ordering
99
 => nil
2.2.3 :005 > takeaway.order
 => {2=>3, 18=>2}
2.2.3 :007 > takeaway.create_dish_hash
 => #<File:lib/menu (closed)>
2.2.3 :008 > takeaway.dish_hash
 => {1=>["BABI PANGANG / Koe loe kai", 11.9], 2=>["BABI PANGANG
Tjap tjoy kip", 11.7], 3=>["BABI PANGANG / Foe yong hai kip", 11.7], 4=>["BABI PANGANG / Kip met Kerrie saus", 12.0],  2.5],
    etc
17=>["ZEEWIER SALADE", 2.5], 18=>["TONIJN SALADE", 2.5], 19=>["ZURE KOMKOMMER", 2.5]}
```

Copyright and Licensing
-----------------------
The MIT License (MIT)

Copyright (c) [2016] [Wim Hekkelman]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
