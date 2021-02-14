## Classes

|Ordering|
|--|
| @menu (class instance)|
| @cart (class instance)|
| @accounts (class instance)|
| @kitchen (class instance)|
|--|
|menu()|
|add_to_order(item_hash)|
|view_cart()|
|checkout(payment)|

\#####
|Menu|
|--|
| @menu (list of hashes {item: , description: , price: , available: })|
| -- |
| print() |
| available?(item) --returns item hash or false|


|Cart|
|--|
| @items (list of hashes)|
|--|
|show_cart() --returns a duplicate of @items|
|add_item(item_hash) --adds the item to @items|
|

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
    
    user=>ordering: "go to cart"
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
