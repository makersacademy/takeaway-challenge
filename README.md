# Airport

Week 2 Weekend Challenge at Makers. This was conducted in my own time to reinforce the weeks learning obectives. The objectives of the week were to learn to test drive an object orientated program in Ruby, with SRP, and Encapsulation principals.

Although simple in design this app taught me a great deal about OOD, Injection Dependancy and Encapsulation. I have left this as it was at the time to show how far I have come in my programming journey.

The functionality of the app:

A user can order food from the takeaway style app with full interactive menu. A User can:

- Instantiate a new Menu
- Order from a selection of 5 dishes
- Order multiple versions of the same dish
- Can see a running total of the bill
- Can finalise the order to confirm booking

---

## How to Run

Clone this repo, and from the command line navigate to the [_Airport Challenge_](airport_challenge). In the command line type:

```
irb
```

This will start the Ruby REPL. Then type the following:

```
require './lib/menu'
```

This will require the files you need to instantiate a new Menu object. Then type in:

```
menu = Menu.new
```

This will return a Hexadecimal number, indicating the creation of the new object. You can then type in the following in the command line to action the object accordingly:

```
menu.interactive_menu

```

This will display a full interactive menu where the user can choose from 5 dishes, by pressing 1-5, or checkout their order by pressing 6. This will give induvidual costs, quantity of dishes and the total order cost.

To run the test suite (RSpec), in the command line type:

```
rspec
```

This will display 13 passing tests with 86% coverage.
