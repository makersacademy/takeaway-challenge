# # The Takeaway Challenge
## `Context
Weekend (ruby coding) Challenge for the second week of Makers Academy Course.

## Documents Organisation
* The Original README.md file containing the requirements of this challenge is renamed to Challenge_Instruction.md.  
*   Progess.md contains the snapshot of codes for each steps.
* Programme code in ./lib dictionary.  
* Unit test code in ./spec dictionary.

## Test Environment
* Feature tests : irb
* Unit test:  Rspec  

## How to Run.  

### Before  Start.
Create a telinfo.rb file in ./lib , put following code in and save the file.

```
module TelInfo
  TAKEAWAYTEL = '+44 ..(your Twilio Telephone NUMBER)'
  CUSTOMERTEL = '+44 (Customer Telephone number)'
  SID = 'AC5 ...(Your Twilio ACCOUNT SID)'
  TOKEN = ' 330 (Your Twilio TOKEN)'
end
```


### Basic Functions.  
In the terminal, navigate and enter the programme directory.

* Run the programme in the REPL,  irb is recommended.   
> ➜  takeaway-challenge git:(master) ✗ irb

* require the programme file.
>require ‘./lib/takeaway.rb’

* create instance of takeaway.  
> takeaway = Takeaway.new

* see the takeaway menu.   
> takeaway.menu  


* take an order    
Input: dishes, number of each dish, customer telephone number.
	* use the customer telephone number in TelInfo as default.    
	>  takeaway.order({spring_rolls: 2, won_tom: 1, ice_tea: 3,}).
	* order from different  customer (number)  
		* check the plane in apron.  
		> takeaway.order({spring_rolls: 2, won_tom: 1, ice_tea: 3,}, ‘+44…’).

* match the order .  
> takeaway.order_match?(num_of_dishes_received).

### Features
Please feel free to explore:  

* raise error if dish not available.
* customer will  receive a text after taking order successfully. 
