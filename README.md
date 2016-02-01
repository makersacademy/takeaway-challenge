Takeaway Challenge
==================

Week 2 Weekend Challenge
-------

For the second weekend challenge, I had to create a program that allowed orders to be given to a takeaway, from a specific menu, and then would send out a confirmation text when the order was completed. First, I created a Menu class and then wrote code allowing the menu to be viewed and food to be ordered from the menu. Finally, I made it so that when the order was confirmed, a text would be sent out using the Twilio API.

On the command line, in IRB or PRY, the code worked like this:

    2.2.3 :009 > pizza = Menu.new
      => #<Menu:0x007fe49291ae00 @dishes={"margherita"=>4.5, "al funghi"=>5.5, "hot & spicy"=>6.0, "calzone"=>7.5, "hawaiian"=>6.5, "chicken supreme"=>9.5, "garlic bread"=>3.0}>
    2.2.3 :010 > takeaway = Takeaway.new(pizza)
      => #<Takeaway:0x007fe4930384d0 @menu=#<Menu:0x007fe49291ae00 @dishes={"margherita"=>4.5, "al funghi"=>5.5, "hot & spicy"=>6.0, "calzone"=>7.5, "hawaiian"=>6.5, "chicken supreme"=>9.5, "garlic bread"=>3.0}>, @basket={}, @cost=#<OrderCost:0x007fe4930382c8 @total=0>>
    2.2.3 :011 > takeaway.menu
      => {"margherita"=>4.5, "al funghi"=>5.5, "hot & spicy"=>6.0, "calzone"=>7.5, "hawaiian"=>6.5, "chicken supreme"=>9.5, "garlic bread"=>3.0}
    2.2.3 :012 > takeaway.order("calzone")
      => "You have just ordered 1x calzone!"
    2.2.3 :013 > takeaway.order("garlic bread", 2)
      => "You have just ordered 2x garlic bread!"
    2.2.3 :014 > takeaway.basket
      => {"calzone x1"=>7.5, "garlic bread x2"=>6.0}
    2.2.3 :015 > takeaway.total
      => "Total: £13.50"
    2.2.3 :016 > takeaway.complete_order
      => "Thank you for ordering!"

(And then I received a text!)

To use the code yourself, it is important to put in your own Twilio API credentials into the .env file, as described in the current file.

If I'd had more time over the weekend, which unfortunately, I didn't, I'd have implemented a way to modify the order so that you could add or remove food that you'd already ordered once. I would also have changed the menu class so that new items could be added and it wouldn't have to be the pizza menu that I specified in my current code.

---------
Author: [Rebecca Piper](https://github.com/RPiper93)