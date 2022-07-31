# Takeaway Challenge - Bernard Leanse

## Domain Model

I started by making a diagram on draw.io of how this program will be structured. 
I used draw.io to create an app interface object which was dependent on a menu class and a dish class
It was also dependent on a TwilioSender class which would send text confirmation.

# Coding it!

I started by test driving a dish class followed by a menu class. The functionality was simple 
but getting the tests written I found more difficult, trying to foucs on keeping the tests behavior oriented.

My first blocker was wanting the menu dish adder to create a dish object. Implementing this would have been easy,
but keeping the tests from initializing the dish class proved slightly too complex. I ended up having it take a dish object as
an argument.

Implementing twilio took a bit of time but managed to get it working! I learned more about environment variables and used them
to hide my twilio details.

Finally I made the main app object which I intended to have the user interface, it was dependent on a pre set up menu class loaded
up with dish objects. I test drove it with a twilio mock as well as dish and menu mocks. I initially planned to have the basket as a 
seperate class but I ran out of time unfortunately. 

# What I could improve

I definately need to practice test driving classes which rely on other classes as well as class extraction while keeping
tests isolated. I do understand the concepts but I do find it more challenging to actually have concise tests which do not rely on
the way the functionality was implemented. 

Would like to have found a way to have the order listed as "Dish x3" as opposed to "dish, dish, dish" but didn't managed to get that
done in the time, again, the blocker to progress is getting the propper TDD appraoch, this will improve with time and experience with
rspec. I decided to omit currency changes to avoid too much complexity in the time available. 

Would like to find away to keep prices to always show with two decimal places, no luck on couple google searches.
