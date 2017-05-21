# README

## Takeaway Challenge

[![Build Status](https://travis-ci.org/charlottebrf/takeaway-challenge.svg?branch=master)](https://travis-ci.org/charlottebrf/airport_challenge)

- **Menu**: menu began as a hash in the initialize method, however it became clear that it needed to be it's own class. For future refactors this menu data could also have been stored in a json file, which could make more sense than a class.
- **Menu**: further comments can be seen in my code that show that if I had more time I would extract more methods from Takeaway class to Menu as Takeaway has too much responsibility & carries out a lot of methods that would better fit in Menu. For example: #extracts_starters #extracts_main_course #extracts_dessert.
- **Takeaway**: takeaway has too much responsibility at present, again see TODO comments in the code, as with Menu, I have noted where methods could at a future stage be extracted into the Display class so that Takeaway is not responsible for printing output to the user. This said there is a lot of positive encapsulation in methods & some delegation to other classes to try to stick as far as possible to SOLID principles.
- **Takeaway**: much of the functionality of how users could place an order for User story 2 was modelled on the Pre-course Student Directory: #interactive_menu, #print_menu, #process_menu, #place_orders, #print_orders. For future refactors it would be interesting to explore other approaches.
- **Takeaway**: given that many of the methods for User story 3 involved calculations, e.g. #calculates_order_cost #prints_order_total #gives_orders_prices for future refactors a separate Calculator class could be another way to lessen Takeaway's responsibility.
- **Display**: display was created in order to be able to create double & mocks to test for STDIN. See #place_orders & #interactive_menu specs. As mentioned for future refactors I would give display all responsibility for displaying user output.
- **Test Provider**: I ran out of time to complete the Text Provider class & properly implement Twilio notifications. I have commented out my files & added some TODO comments in Takeaway.
- **Tests**: Tests coverage is 96%.
- **Rubocop**: Implemented throughout: total of 4 offences which are due to need to refactor out Takeaway class further.
