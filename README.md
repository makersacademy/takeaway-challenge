Takeaway Challenge
==================
Description of Project
----------------------
This project implements the following user stories:

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

The functionality can be demonstrated by executing `ruby feature_test.rb`.

This program requires the following environment variables in order to run correctly:
- `MY_NUMBER` : a phone number capable of receiving SMS, with the country code and '+' prefix
- `TWILIO_NUMBER` : the number assigned when signing up for a free Twilio account
- `TWILIO_SID` : the account SID assigned by Twilio
- `TWILIO_AUTH_TOKEN` : the auth token assigned by Twilio

Testing and metrics
-------------------
Testing is via RSpec, coveralls support is integrated

Copyright notice
----------------
This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program.  If not, see <http://www.gnu.org/licenses/>.

Documentation instructions
--------------------------
- Specification consists of Rspec tests in ./spec/

Installation instructions
-------------------------
- clone from https://github.com/peteburch223/takeaway-challenge.git
- run `bundle` to ensure necessary gems are installed and available
- test with `coveralls report`

Project created in Ruby v2.2.3

Authors
-------
Initial coding: Pete BURCH - peteburch223@gmail.com
