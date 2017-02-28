## Weekend 2 - Takeaway Challenge

I started with the first user case, converted it to functional representation as shown below, followed by a diagram showing methods and what the methods will do. This time I also was aware of not to test state but just the behaviour.

| Object         | Messages          |
| ---------------|:-----------------:|
| Customer       |                   |
| Order          |                   |
| List(of dishes)| view/see          | |                                         

```
Menu <-- view_dishes --> shows a list of dishes and prices
```
It didn't sense that a customer will ask a Menu to show its list of entries. Glanced at other user stories and thought I should have a central class (Resturant) that would send this message on behalf of customer to a Menu object. I thought of making a Dish class which would have name and price as attributes, but decided against it as that class will have only state and no behaviour. In future if client decides to include allergy information like `contains_nuts?`, `gluten_free?`, etc then I could extract a Dish class with behaviour. Should I have used `Struct` instead of a Hash to store dishes?

I was more aware of encapsulation this time. Did not even write tests to check state like last time. The other user stories led me to make other class :

Order class calculates the bill because it stores the whole customer order. This class is injected into the Resturant class but an order will only be created when customer adds a dish to cart.

Printer class will display the bill which includes order detials and the total. In case of discrepency, customer is encouraged to view the bill. This class is injected into the Resturant class.

MessengerService class uses Twilio to send an SMS to the customer which states that the order will be ready in an hours time(24 hour formate)

I included gaurd conditions so that customer selects dishes before confirming the order, raises an error if items selected is not in the menu, and a #print_bill that customer can use to check order and total.

I also changed the methods and tests to see them fail intentionally.

## Contributor
- Ashwini Mani

## Bahavior's practised
- [BDD](https://github.com/makersacademy/course/blob/master/pills/bdd_cycle.md)
- [Pair-Programing](https://github.com/makersacademy/course/blob/master/pills/pairing.md)

- OOP

## Technologies Used
- Rspec
- Ruby
