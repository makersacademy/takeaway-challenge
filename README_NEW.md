# takeaway challenge 20th June 2020 #

WIP: Couldn't get the text message to send, not sure why at the moment.

## How it works ##
``` irb -r './lib/takeaway.rb'
2.6.5 :001 > ta = Takeaway.new
# confirmation of new takeaway object
2.6.5 :002 > ta.see_menu
# prints menu and prices
2.6.5 :003 > ta.place_order('Potato', 2)
2.6.5 :004 > ta.place_order('Hummus', 4)
2.6.5 :005 > ta.place_order('Cheeze', 3)
# adds the specified quantity of food to the order
2.6.5 :006 > ta.check_total
# checks the current total of the order in £
2.6.5 :007 >ta.complete_order({'Potato'=>2, 'Hummus'=>4, 'Cheeze'=>3}, 16)
# gives the order in a hash and the total, to be checked before sending SMS
# sending of SMS not currently working, but would happen here
```