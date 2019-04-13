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
	spring_rolls: 4.55,
	grilled_dumpling: 4.9,
	chicken_fried_rice: 6.95,
	won_tom: 7.95,
	curry_breef_brisket: 7.95,
	coke: 1.2,
	ice_tea: 2.55
}




## User Story 2

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

Domain model :
select  => some number of several available dishes

Feature test plan;

require ‘./lib/takeaway.rb’
takeaway = Takeway.new

takeaway.order({
spring_rolls: 2,
won_tom: 1,
ice_tea: 3
})

takeaway.order
=> {
spring_rolls: 2,
won_tom: 1,
ice_tea: 3
}

takeaway.take_order({
spring_rolls: 2,
won_tom: 1,
beer: 2,
})

=>raise error:  “bear is not available”


takeaway.take_order({
spring_rolls: 2,
beef_steak: 1,
beer: 2,
})

=>raise error:  “ bear and beef_steak are not available”


User Story 3

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

domain model

number_givern <= match? => sum of the various dishes in my order


Feature test plan

require ‘./lib/takeaway.rb’
takeaway = Takeway.new

takeaway.order({
spring_rolls: 2,
won_tom: 1,
ice_tea: 3,
})


takeaway.order_match?(6)
=> true

takeaway.order_match?(4)
=> false
