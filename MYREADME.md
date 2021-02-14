## Classes

|Ordering|
|--|
| @menu (class instance)|
| @cart (class instance)|
| @accounts (class instance)|
| @kitchen (class instance)|
|--|
|menu()|
|add_to_order(item_name)|
|view_cart()|
|checkout|

\#####
|Menu|
|--|
| @menu (list of hashes {item: , description: , price: , available: })|
| -- |
| print() |
| available?(item_name) --returns item hash or false|


|Cart|
|--|
| @items (list of hashes)|
| @open (bool, is the cart still open?)|
| @total (float) |
|--|
|show_cart() --returns a duplicate of @items|
|add_to_order(item_hash) --adds the item to @items|
|total() --returns just the total|
|invoice() --returns invoice in form {item_name: {number: , price: }, Total: }|
|open?|

|Kitchen|
|--|
|@current_orders|
|--|
|order(item_hash) --item_hash should be a hash of elements {item_name: number}|

## Sequence Diagram

  

open [playground.diagram sequence diagram](https://playground.diagram.codes/d/sequence) and paste:

    alias user="User Interface"
    alias ordering="Ordering"
    alias menu="Menu"
    alias cart="Shopping Cart"
    alias kitchen="Kitchen"
    alias account="Accounts"
    
    user=>ordering: "Request Menu"
    ordering->menu: "Request menu"
    menu-->user: "returns copy of Menu"
    
    user=>ordering: "start order"
    ordering->cart: "creates new order with unique order ID"
    user=>ordering: "select dish"
    ordering->menu: "checks dish is available"
    menu->ordering: "returns dish or false (i.e. confirms availability)"
    ordering->cart: "adds dish to order"
    
    user=>ordering: "view cart"
    ordering->cart: "request orders and prices, and total"
    cart-->user: "prints orders and prices, and totals"
    
    user=>ordering: "checkout"
    ordering->cart: "request orders and prices, and total"
    cart-->ordering: "prints orders and prices, and total"
    ordering->cart: "closes cart"
    cart->ordering: "returns self"
    ordering-->account: "sends copy of order to Accounts"
    ordering->account: "sends payment to Accounts"
    account->account: "increases @balance by payment"
    ordering-->kitchen: "sends order to kitchen"
    ordering-->user: "sends confirmation text to user"
