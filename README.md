# takeaway-challenge

This program allows customers to view a restaurant's menu, select menu items and quantities, verify the total and receive a text message order confirmation.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.


## Installing

Clone the program to your local directory:

```
git clone https://github.com/ker-an/takeaway-challenge.git local_directory
cd local_directory
```

## How To Use

Create a new order and view a list of menu items with prices:

```
$ source .env
$ irb
2.4.0 :001 > require "./lib/order"
  => true
2.4.0 :002 > order = Order.new
  => #<Order:0x007fef73ac6f10 @order_list={}, @menu=#<Menu:0x007fef73ac6ee8 @menu_items={"Aloo Ghobi"=>5.5, "Mac and Cheese"=>6.0, "Chicken Tikka Masala"=>7.0, "Al Pastor Tacos"=>6.0, "Poutine"=>3.5, "Vegetable Gyozas"=>3.5, "Naan"=>2.0, "Caesar"=>5.5}>, @notification=#<Notification:0x007fef73ac6e98>>
```
Add menu items to the order and view total:

```
2.4.0 :003 > order.add("Poutine")
  => "1 Poutine(s) added to your order"
2.4.0 :004 > order.add("Vegetable Gyozas", 3)
  => "3 Vegetable Gyozas(s) added to your order"
2.4.0 :005 > order.total
  => 14.0
```

Send confirmation text to customer once order complete:

```
2.4.0 :006 > order.complete
  => <Twilio.Api.V2010.MessageInstance Sent from your Twilio trial account - Thank you! Your total is £14.00 and your order has been placed.>
```

## Built With

```
Ruby 2.4.0
Twilio API
```

## Author

[Keran Braich](https://github.com/ker-an)
