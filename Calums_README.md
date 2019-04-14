## APPROACH

For this challenge I knew I wanted to create a number of objects that would interact with each other: a menu, a basket and a main takeaway object that the user would interact with (and would send them a confirmation text).

Initially I was able to set up the Menu and Basket classes quite easily, and wrote a few simple methods for them. However, I soon got bogged down with unpassable RSpec tests. Any test for a method that contains a `.each do` method does not achieve the desired result. I currently do not know how to make these tests pass.

The final part of the challenge I was able to complete was enabling Twilio SMS functionality. I used the `dotenv` gem to allow my program to access environment variables, and added the .env file where they are stored to .gitignore, so that my phone number and Twilio information would be kept secure and not posted to GitHub.

Finally I installed the `twilio-ruby` gem and added it to the Gemfile (and required it in the spec_helper file) so that RSpec would interface properly with Twilio.
