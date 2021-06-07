Takeaway Challenge - Chuka Okoye
==================

Currently stuck on the second user story, for how to create a test for the inputs. Still researching but I want the next method to display a prompt for the user to "choose" from the previously stated menu, which would take the input and be transferred into the users empty basket array.

How to run in irb:

```
2.6.5 :001 > require './lib/takeaway.rb'
 => true 
2.6.5 :002 > t = Takeaway.new
 => #<Takeaway:0x00007febb40e8fd8 @food=nil, @basket=[]> 
2.6.5 :003 > t.food_prices
chips: £5.5
wings: £7.2
burger: £8.5
 => {"chips"=>5.5, "wings"=>7.2, "burger"=>8.5}
2.6.5 :005 > t.choose_menu
Choose food: 
chips
 => [5.5]
2.6.5 :006 > t.choose_menu
Choose food: 
wings
 => [5.5, 7.2] 
2.6.5 :007 > t
 => #<Takeaway:0x00007fa3048ba070 @food=nil, @basket=[5.5, 7.2]>
```
