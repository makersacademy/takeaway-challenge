# Progress_Takeaway Challenge
## User Story 1
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices


Domain model:
See <= a list of dishes with prices

Feature test plan;

require ‘./lib/takeaway.rb’
takeaway = Takeway.new
takeway.menu

=> {
	spring_rolls: 4.55
	grilled_dumpling: 4.9
	chicken_fried_rice: 6.95
	won_tom: 7.95
	curry_breef_brisket: 7.95
	coke: 1.2
	ice_tea: 2.55
}
