# The Takeaway Challenge
## Context
Weekend (ruby coding) Challenge for the second week of Makers Academy Course.

## Documents Organisation
* The Original README.md file containing the requirements of this challenge is renamed to Challenge_Instruction.md.  
* Progess.md contains the 'user story - domain model - feature test plan' approach for each step.
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
	* take order {dish: quantity, ... } from default customer telephone number in TelInfo.    
	>  takeaway.order({spring_rolls: 2, won_tom: 1, ice_tea: 3,}).
	* order from different customer (telephone number)      
	> takeaway.order({spring_rolls: 2, won_tom: 1, ice_tea: 3,}, ‘+44…’).

* match the order .  
> takeaway.order_match?(num_of_dishes_received).

### Features
Please feel free to explore:  

* raise error if dish not available.
* customer will  receive a text after taking order successfully.
