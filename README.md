Takeaway Challenge
==================
```
                            _________
              r==           |       |
           _  //            |  M.A. |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```

[![Build Status](https://travis-ci.org/rkclark/takeaway-challenge.svg?branch=master)](https://travis-ci.org/rkclark/takeaway-challenge)
[![Coverage Status](https://coveralls.io/repos/github/rkclark/takeaway-challenge/badge.svg?branch=master)](https://coveralls.io/github/rkclark/takeaway-challenge?branch=master)

Task
-----

* Fork this repo
* Run the command 'bundle' in the project directory to ensure you have all the gems
* Write a Takeaway program with the following user stories:

```
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
```

Approach
-----

I approached the challenge by creating the follow domain objects:
- `Takeaway`
- `Order`
- `Dish`
- `ArrayPrinter`
- `OrderTotalChecker`
- `SMSMessager`
- `TwilioClient`
- `SMSReceiver`

Which operate within this domain model:


The `Takeaway`

I initially understood the challenge to only require one airport. For that reason, I created Weather such that no instances of it are required, it is a class module only. Since weather is generated randomly, and is not saved, it didn't think it was necessary to have it based on creating instances. Once I understood the challenge required multiple airports I did consider changing this, but even if weather instances were used, it would still be generated randomly and the functionality would be the same. However, it would be good for the system to be able to report the weather at a given location (i.e. as a future user story).

All of the modules were written using TDD, and a spec file exists for each one. I've used verified doubles extensively as well as stubbed methods. The project reports 99.6% test coverage with Coveralls.

Problems
-----

There is significant repeated code in the spec files, in particular `plane_spec.rb`. This tends to be where instance doubles are being used. While I was able to create a method `set_sunny` to provide my `Weather` class double to my tests, I was not able to achieve a similar solution for instance doubles. Whenever I tried to lift an instance double outside an `it` statement I received errors.

As a priority learning objective I would like to understand this better, as I am sure there will be a way to implement this in a DRY fashion.

*Note: there are some comments in `plane_spec.rb` that point to where I was having this problem.*

Usage
-----

The project contains a .pryrc file that will require the relevant files, create five instances of `Plane` and three instances of `Airport` for easier feature testing.

Where `plane` is an instance of `Plane` and `airport` is an instance of `Airport`, the following commands can be used:
- `plane.land(airport)` (instruct plane to land at airport)
- `plane.take_off(airport)` (instruct plane to take off from airport)
- `plane.airborne` (see if plane is airborne)
- `airport.capacity` (see airport capacity)
- `airport.planes` (see planes docked at airport)
- `airport.full?` (see if airport is full)
- `Weather.sunny?` (see randomly generated weather - true is sunny, false is stormy)

Here is an example pry session showing program usage:

```
17:32:04  rickclark@Ricks-MBP  ~/Doc…nts/Makers/airport_challenge   master ●  pry                                                  2.2.3
You have 5 planes: plane_1, plane_2, plane_3, plane_4, plane_5
and 3 airports: paris (capacity 3), london (capacity 1), frankfurt (capacity 3)
[1] pry(main)> plane_1.land(london)
=> "Plane has landed in sunny weather at London"
[2] pry(main)> london.full?
=> true
[3] pry(main)> london.planes
=> [#<Plane:0x007fefedc9d698 @airborne=false>]
[4] pry(main)> london.capacity
=> 1
[5] pry(main)> plane_2.land(london)
RuntimeError: Cannot land - airport is full!
from /Users/rickclark/Documents/Makers/airport_challenge/lib/plane.rb:11:in `land'
[6] pry(main)> plane_1.take_off(london)
=> "Plane has taken off from London"
[7] pry(main)> plane_2.land(frankfurt)
RuntimeError: Cannot land - weather is stormy!
from /Users/rickclark/Documents/Makers/airport_challenge/lib/plane.rb:10:in `land'
[8] pry(main)> plane_2.land(frankfurt)
=> "Plane has landed in sunny weather at Frankfurt"
[9] pry(main)> plane_3.land(frankfurt)
RuntimeError: Cannot land - weather is stormy!
from /Users/rickclark/Documents/Makers/airport_challenge/lib/plane.rb:10:in `land'
[10] pry(main)> plane_3.land(frankfurt)
=> "Plane has landed in sunny weather at Frankfurt"
[11] pry(main)> plane_4.land(frankfurt)
RuntimeError: Cannot land - weather is stormy!
from /Users/rickclark/Documents/Makers/airport_challenge/lib/plane.rb:10:in `land'
[12] pry(main)> plane_4.land(frankfurt)
=> "Plane has landed in sunny weather at Frankfurt"
[13] pry(main)> plane_4.take_off(london)
RuntimeError: Cannot take off - am not landed at London!
from /Users/rickclark/Documents/Makers/airport_challenge/lib/plane.rb:18:in `take_off'
[14] pry(main)> plane_4.take_off(frankfurt)
=> "Plane has taken off from Frankfurt"
