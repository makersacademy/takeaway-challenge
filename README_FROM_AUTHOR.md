INSTRUCTIONS:

Fork this repo, and clone to your local machine
	git clone <url>
Run the command: gem install bundle
When the installation completes, run: bundle
In the Gemfile, ensure ruby version is 2.2.3 in order to run RSpec tests (from project root directory)
Ensure you open irb, or pry from the project directory.

ABOUT:		

This is a project/challenge set by the coding bootcamp Makers Academy and then completed by the AUTHOR as a learning assignment.

Consequently, all scripts not included in the 'lib' or 'spec' directory are the work of the staff at Makers Academy.
This README therefore only relates to these two directories.

The challenge is to build a simple takeaway ordering program with a messaging system to update the customer on their order's progress.

MY APPROACH:

I approached my design with the intention of making it very easy to adapt. I separated out classes based, in part, on the areas that would be most likely to be enhanced in the future:

The inclusion of different menus and ability for the user navigate these seamlessly. Ie, breakfast vs dinner menus or different cuisines.

The separation of the customer's order from their menu selection.  

The development of Customer Relationship Management functions, such as including different ways to message customers and store information about the customer.




USER STORIES:

As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered


USAGE GUIDE:

** Behaviour of program
<!-- Only Airports are allowed to instruct Planes to land or take off
Remember to park newly created planes at your chosen airport before instructing them to take off
There is a 10% chance bad weather will prevent landing and taking off -->

CLASSES:

Airport

<!-- Instantiates with two arguments, a capacity and weather.
Capacity defaults to a constant DEFAULT_CAPACITY of 20.
Weather defaults to an injected instantiation of the Weather class. -->

	Methods:

	<!-- airport.land(plane)
		Will not allow a plane to land if the airport is full.
		Will not allow a plane to land if the weather is not sunny.
		Will not allow a plane to land if the plane has already landed and isn't flying.
		Otherwise, it will change the plane's status to 'landed' and put the plane in the holding bay. -->

	airport.take_off
		<!-- Will not allow a plane to take off if airport is empty.
		It will otherwise remove the plane from the holding bay in order to check it's status.  
		It will not allow a plane to take off if it is already flying or if the weather is not sunny and put it back in the holding bay.
		Otherwise it will then change the plane's status from Landed to Flying as it takes off. -->

	Private Methods:
<!--
	full?
		Will check if the holding bay is bigger than or equal to the airport's capacity.

	empty?
		Will check if the holding bay is empty. -->

	Att_reader:
	holding_bay
	capacity
	sunny


$ irb feature test
> require './lib/airport'
> airport1 = Airport.new
> aiport2 = Airport.new
> plane1 = Plane.new
> plane2 = Plane.new
> airport.land(plane1)
> heathrow.land(plane2)
> heathrow.take_off(plane1)
> heathrow.take_off(plane2)
> jfk.land(plane1)
> jfk.land(plane2)


LICENSE:	This project is licensed under the terms of the MIT license.
		see LICENSE.md

AUTHORS: 	Viola Crellin
CONTACT: 	viola.crellin@gmail.com

PROJECT CONTENTS:
      <!-- Gemfile
			Gemfile.lock
			Rakefile
			README.md - a description of the challenge set by MakersAcademy
			lib directory
				airport.rb
				plane.rb
				weather.rb
			spec directory
				airport_spec.rb
				plane_spec.rb
				weather_spec.rb -->
