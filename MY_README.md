# Takeaway Challenge

Takeaway program based on:

**User Stories**

_As a customer  
So that I can check if I want to order something
I would like to **see** a **list of dishes** with **prices**_

_As a customer  
So that I can order the meal I want  
I would like to be able to **select** some number of several **available dishes**_

_As a customer  
So that I can verify that my order is correct  
I would like to **check that the total** I have been given matches the sum of the various **dishes in my order**_

_As a customer  
So that I am reassured that my order will be delivered on time  
I would like to **receive a text** such as **"Thank you! Your order was placed and will be delivered before 18:52"** after I have ordered_

---
# Initialial Plan

3 classes = class Menu(Takeaway), class Dish, class Order
1 to 2 methods per class

![Initial Domain Modelling](images/domain_model.png)

The result is not so different from initial plan. I also moved Twilio and sent_text method into its own class.

![Result](images/domain_result.png)

---
Unfortunatly I wasn't feeling well most of the weekend so I couldn't add more tests..

---
```
rikytraveller@Rikys-Air takeaway-challenge % irb -r ./lib/takeaway.rb -r ./lib/order.rb -r ./lib/dishes.rb -r ./lib/twilio_provider.rb
3.0.2 :001 > new_order = Takeaway.new
 => 
#<Takeaway:0x0000000128c509a8
... 
3.0.2 :002 > new_order.print_available_dishes
1.Mushroom Risotto: £8
2.Pepperoni Pizza: £4
3.Cheeseburger: £5
4.Prawn Noodles: £8
5.Fries: £3
6.Onion Rings: £3
7.Coca-Cola: £2
8.Ice-cream: £2
```
Each dish has an id. And that's used to order. You select the number of what you want and amount.
```
3.0.2 :003 > new_order.select_dish(2,1)
 => 1 
3.0.2 :004 > new_order.select_dish(5,1)
 => 1 
3.0.2 :005 > new_order.select_dish(7,1)
 => 1 
```
If you want to see your order
```
3.0.2 :007 > my_order = Order.new(new_order)
 => #<Order:0x0000000105016430 @confirm_order=false, @order=[{"Pepperoni Pizza"=>4}, {"Fries"=>3}, {"Coca-Cola"=>2}]> 
3.0.2 :008 > my_order.total_charge
 => 9 
3.0.2 :009 > my_order.print_order
Pepperoni Pizza    £4
Fries              £3
Coca-Cola          £2
----------------------
Total:             £9
 => nil 
3.0.2 :010 > my_order.confirm_order?("yes")
 => true 
```
To send a confirmation text
```
.0.2 :011 > new_order.send_confirmation_text
 => <Twilio.Api.V2010.MessageInstance body: Sent from your Twilio trial account - Thank you! Your order was placed and will be delivered before 2021-11-29 09:38:06 +0000 num_segments: 1 direction: outbound-api from: +xxxxxxxxxxxx to: +xxxxxxxxxxx date_updated: 2021-11-29 08:38:07 +0000 price:  error_message:  uri: /2010-04-01/Accounts/AC16c8d563fe6c7f5bedfd1ea6a57b04e1/Messages/SM1fa9b2680d0346c6ad405f562440b534.json account_sid: AC16c8d563fe6c7f5bedfd1ea6a57b04e1 num_media: 0 status: queued messaging_service_sid:  sid: SM1fa9b2680d0346c6ad405f562440b534 date_sent:  date_created: 2021-11-29 08:38:07 +0000 error_code:  price_unit: USD api_version: 2010-04-01 subresource_uris: {"media"=>"/2010-04-01/Accounts/AC16c8d563fe6c7f5bedfd1ea6a57b04e1/Messages/SM1fa9b2680d0346c6ad405f562440b534/Media.json"}> 
```
If you don't add a number as argument it sends it directly to my number (default for testing). The customer number needs to be passed as an argument.
```
3.0.2 :012 > new_order.send_confirmation_text("+441234567890")
```