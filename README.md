Takeaway Challenge
==================
This is my second challenge at Makers Academy. The aim of the project is to implement 4 user stories in order to simulate a takeaway program which uses Twilio API.


Author
------
This code and README.md is prepared by Valentina Monetta at Makers Academy (January 2016).


Approach
--------
My program has 4 classes: takeaway, menu, messager and order class.
The takeaway is the public interface and handles user input. This input is then passed to the order class which adds the dish and the amount of each dish selected, making at the end a total. Dishes and prices are stored in menu class. The messager class is in charge to send a text to the user.


Instructions
------------
2.2.3 :002 > t = Takeaway.new(Menu.new, Messager.new)
 => #<Takeaway:0x007fad911df3d0 @menu=#<Menu:0x007fad911df448 @prices={"chicken"=>3, "rice"=>1, "pizza"=>6, "chips"=>2}>, @basket=#<Order:0x007fad911df358 @menu=#<Menu:0x007fad911df448 @prices={"chicken"=>3, "rice"=>1, "pizza"=>6, "chips"=>2}>, @basket=[]>, @messager=#<Messager:0x007fad911df3f8>>
2.2.3 :003 > t.select_dishes('rice',3)
 => [["rice", 3]]
2.2.3 :004 > t.select_dishes('chicken',1)
 => [["rice", 3], ["chicken", 1]]
2.2.3 :005 > t.check(15)
RuntimeError: Total does not match!
  from /Users/valentina/Documents/makersacademy/takeaway-challenge/lib/takeaway.rb:26:in `check'
  from (irb):5
  from /Users/valentina/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'
2.2.3 :006 > t.check(6)
 => true
2.2.3 :007 > t.complete_order
Sent message to Valentina
 => #<Order:0x007fad91105ef0 @menu=#<Menu:0x007fad911df448 @prices={"chicken"=>3, "rice"=>1, "pizza"=>6, "chips"=>2}>, @basket=[]>


Copyright and Licensing
-----------------------
The MIT License (MIT)
Copyright (c) [2016] [Valentina Monetta]
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



