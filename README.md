## My Solution to the Takeaway Challenge ##

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
User Story Reps: https://docs.google.com/document/d/1LHx6bmWXUBvGipXck90RCA8EkIy-tiVpFwvod7s_SsY/edit

Sequence Diagram: https://playground.diagram.codes/d/sequence

## How far did I get? What did I learn? ##

## Great! What was my process? ##

## Challenges // Blockers ##

## Code ##

## How to Use && Feature Tests ##

alias cust = "Customer"
alias menu = "Menu"
alias basket = "basket"
alias order = "Order"

cust->order: "new_order"
cust->menu: "see_menu"
cust->menu: "select_dish(num)"
menu->basket: "add_dish_to_basket(num)"
cust->basket: "basket_summary"
cust->basket: "remove_dish(num)"
cust->basket: "total"
cust->basket: "total_equals_basket_summary?"
cust->order: "checkout"
order->cust: "text message: delivery in 1 hour"
