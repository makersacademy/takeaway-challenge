# Takeaway Challenge
_This is the challenge to create a takeaway application. It can be used to view the menu, make an order, view the amount of items ordered and the total. The app also sends out a confirmation text message. For security reasons, the last part is not in a complete working order._
[Source](https://github.com/makersacademy/takeaway-challenge)

### How to Install
1. Fork the repository
2. Git clone to your machine
3. Run `bundle`
4. Enjoy

### How to Run
1. `cd takeaway-challenge`
2. `irb -r './lib/takeaway.rb'`
3. `takeaway = TakeAway.new`
4. `takeaway.menu` to view the menu
5. `takeaway.order("Pizza")` to order Pizza. Or Pasta. Or whatever you like as many times you like
6. `takeaway.confirmation` to see the total of your order
7. `takeaway.confirmation_text` to receive a confirmation text. _For security reasons, this feature is out of order._

### How to Test
1. `cd takeaway-challenge`
2. Run `rspec`
