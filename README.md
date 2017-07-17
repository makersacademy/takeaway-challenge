Takeaway Challenge
==================
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

# Setup
------
You will need the following gems to test this:  
gem 'capybara'  
gem 'rake'  
gem 'rspec'  
gem 'rubocop'  
gem 'simplecov', require: false, group: :test  
gem 'simplecov-console', require: false, group: :test  
gem 'twilio-ruby'  

# Process
------
Intended to delegate responsibility to other classes. Understand theory, but practice is more difficult!  
```
principles_learned = ["Single Responsibility", "Encapsulation", "Delegation", "Test-driven development"]
principles_violated << principles_learned * 10
time_to_code_review < 2
current_status = "screwed"
```

# Instructions (irb readout)
------
```
Congs-MacBook-Pro:takeaway-challenge cong$ irb
2.4.0 :001 > require './lib/takeaway'
 => true
2.4.0 :002 > t=Takeaway.new
 => #<Takeaway:0x007fb9f90e80e8 @menu={"Margherita"=>6, "Funghi"=>7, "Pollo"=>8, "Pescatore"=>9, "Vesuvio"=>8, "Quattro Formaggi"=>7, "Diavolo"=>8, "Capricciosa"=>8, "La Bella Vita"=>9, "Milanese"=>8}, @basket=[], @total=0>
2.4.0 :003 > t.display_menu
{"Margherita"=>6, "Funghi"=>7, "Pollo"=>8, "Pescatore"=>9, "Vesuvio"=>8, "Quattro Formaggi"=>7, "Diavolo"=>8, "Capricciosa"=>8, "La Bella Vita"=>9, "Milanese"=>8} => nil
2.4.0 :004 > t.order("Hawaiian")
RuntimeError: That's not on the menu!
	from /Users/cong/Projects/takeaway-challenge/lib/takeaway.rb:29:in `order'
	from (irb):4
	from /Users/cong/.rvm/rubies/ruby-2.4.0/bin/irb:11:in `<main>'
2.4.0 :005 > t.order("Pollo", 3)
3 Pollos added to basket. => 24
2.4.0 :006 > t.order("Margherita")
1 Margherita added to basket. => 30
2.4.0 :007 > t.order("Pescatore", 5)
5 Pescatores added to basket. => 75
2.4.0 :008 > t.display_basket
["Pollo", "Pollo", "Pollo", "Margherita", "Pescatore", "Pescatore", "Pescatore", "Pescatore", "Pescatore"] => nil
2.4.0 :009 > t.display_total
75 => nil
2.4.0 :010 > t.checkout
Order confirmed. You have been charged £75 => nil
2.4.0 :011 >
```

# User stories implemented
------
## Yes:  
```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order
```
## No:  
```
As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```
