# README.md

## Demo:

```
➜  takeaway-challenge git:(main) ✗ irb -r './lib/takeaway.rb'
3.0.2 :001 > mcdonalds = Takeaway.new('mcdonalds')
 => 
#<Takeaway:0x00007fb586c4d428
... 
3.0.2 :002 > mcdonalds.show_menu
 => "hamburger - 2, cheeseburger - 3, chicken nuggets - 5" 
3.0.2 :003 > my_order = mcdonalds.make_order
 => 
#<Order:0x00007fb586b66be0
...
3.0.2 :004 > my_order.add('hamburger', 3)
 => [{#<Dish:0x00007fb586c4d0b8 @name="hamburger", @price=2>=>3}] 
3.0.2 :005 > my_order.add('chicken nuggets')
 => [{#<Dish:0x00007fb586c4d0b8 @name="hamburger", @price=2>=>3}, {#<Dish:0x00007fb586c4ce88 @name="chicken nuggets", @price=5>=>1}] 
3.0.2 :006 > my_order.add('pasta')
/Users/mateuszdiak/Documents/Projects/takeaway-challenge/lib/order.rb:52:in `find_dish': Not on the menu. (RuntimeError)
        from /Users/mateuszdiak/Documents/Projects/takeaway-challenge/lib/order.rb:13:in `add'
        from (irb):6:in `<main>'
        from /Users/mateuszdiak/.rvm/rubies/ruby-3.0.2/lib/ruby/gems/3.0.0/gems/irb-1.3.5/exe/irb:11:in `<top (required)>'
        from /Users/mateuszdiak/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `load'
        from /Users/mateuszdiak/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `<main>'
3.0.2 :007 > my_order.total
 => 11 
3.0.2 :008 > my_order.summary
 => "hamburger: 2 x 3 = 6\nchicken nuggets: 5 x 1 = 5" 
3.0.2 :009 > my_order.finish
 => <Twilio.Api.V2010.MessageInstance body: Sent from your Twilio trial account - Thank you. Your order was placed and will arrive before 18:49 num_segments: 1 direction: outbound-api from: +19284517223 to: +447424242488 date_updated: 2022-01-03 17:50:26 +0000 price:  error_message:  uri: /2010-04-01/Accounts/AC15fccacb29bf760c7b890ca216ebe237/Messages/SMa37d0d01786a43f58f67d4b787bd1100.json account_sid: AC15fccacb29bf760c7b890ca216ebe237 num_media: 0 status: queued messaging_service_sid:  sid: SMa37d0d01786a43f58f67d4b787bd1100 date_sent:  date_created: 2022-01-03 17:50:26 +0000 error_code:  price_unit: USD api_version: 2010-04-01 subresource_uris: {"media"=>"/2010-04-01/Accounts/AC15fccacb29bf760c7b890ca216ebe237/Messages/SMa37d0d01786a43f58f67d4b787bd1100/Media.json"}> 
```

User stories:

```ruby
As a customer
So that I can check if I want to order something
I would like to see a **list** of **dishes** with **prices**

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available **dishes**

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```


# Domain model:
![Domain Model Image](/assets/domain_model.jpg)

