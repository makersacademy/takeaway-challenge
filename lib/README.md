TAKEAWAY Challenge
------------------

```
2.2.3 :001 > require './spec/feature_test.rb'
 => true
2.2.3 :002 > takeaway = TakeAway.new
 => #<TakeAway:0x007f9644209950 @dish_class=Dish, @order_confirmation_class=#<OrderConfirmation:0x007f9644209928>, @basket=[]>
2.2.3 :003 > takeaway.list_menu
 => {"Bratwurst in a bun"=>2.49, "Bockwurst in a bun"=>2.49, "Käsekrainer in a bun"=>2.79, "Veggie sausage in a bun"=>2.29, "Sauerkraut"=>1.19, "Crispy onions"=>0.29, "Mustard"=>0.29, "Ketchup"=>0.29, "Sidesalad"=>0.75, "Orange juice"=>1.49, "Weißbier"=>2.99, "Schwarzbier"=>2.99}
2.2.3 :004 > takeaway.add_to_basket("Bratwurst in a bun",1)
 => [#<Dish:0x007f96441f0f68 @dish="Bratwurst in a bun", @price=2.49, @quantity=1>]
2.2.3 :005 > takeaway.add_to_basket("Käsekrainer in a bun",2)
 => [#<Dish:0x007f96441f0f68 @dish="Bratwurst in a bun", @price=2.49, @quantity=1>, #<Dish:0x007f96441e06e0 @dish="Käsekrainer in a bun", @price=2.79, @quantity=2>]
2.2.3 :006 > takeaway.basket
 => [#<Dish:0x007f96441f0f68 @dish="Bratwurst in a bun", @price=2.49, @quantity=1>, #<Dish:0x007f96441e06e0 @dish="Käsekrainer in a bun", @price=2.79, @quantity=2>]
2.2.3 :007 > takeaway.total
 => 5.58
2.2.3 :008 > takeaway.order(5.58)
 => <Twilio::REST::Message @path=/2010-04-01/Accounts/ACa5350c2363a8c015c087427640b4ecd0/Messages/SMb10f9a6f8bf449e5ba597127ed401fff>
2.2.3 :009 > takeaway.order(5.00)
RuntimeError: Total received doesn't match total price
```
