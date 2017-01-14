# Takeaway Challenge
### [Makers Academy] (http://www.makersacademy.com) - Week 2 Solo Weekend Project [![JavaScript Style Guide: Good Parts](https://camo.githubusercontent.com/c85bd9ed833f4beabdb09a95a6cc1de03fe2324a/68747470733a2f2f636f766572616c6c732e696f2f6275696c64732f393536363138302f6261646765)](https://github.com/adrianeyre/takeaway-challenge)
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
## Index
* [Gems Used] (#GEMS)
* [Installtion] (#Install)
* [User Stories] (#US)
* [Usage] (#Usage)
 
## <a name="GEMS">Gems Used</a>
```ruby
gem 'rake'
gem 'rspec'
gem 'coveralls', require: false
gem 'capybara'
gem 'twilio-ruby'
gem 'dotenv', '~> 2.1', '>= 2.1.1'
```

## <a name="Install">Installation</a>
The Takeaway Challenge is ran on Ruby version : 2.3.1

* To change Ruby versions
```shell
$ rvm 2.3.1
```
* To install Ruby 2.3.1
```shell
$ rvm install ruby-2.3.1
```
* To install Gems
```shell
$ gem install bundle
$ bundle
```

## <a name="US">User Stories</a>
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

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```

## <a name="Usage">Usage</a>

* Create a `.env` file in the applicaion root
```ruby
account_sid = <YOUR SID>
auth_token = <YOUR TOKEN>
from = <YOU FROM NUMBER>
to = <YOUR TO NUMBER>
```

* Test the applicaion in IRB
```shell
$ require "./lib/order.rb"
=> true

$ order = Order.new
=> #<Order:0x007fea9d992890 @menu=#<Menu:0x007fea9d992868 @output_menu=#<Output_Menu:0x007fea9d9927f0>, @menu=[{:item=>"Item 1", :price=>1.5}, {:item=>"Item 2", :price=>2.5}, {:item=>"Item 3", :price=>1.0}]>, @order=[], @total=0.0>

$ order.add_item({item: "Item 1", quantity: 1})
=> 1.5

$ order.check_order
=> [{:item=>"Item 1", :quantity=>1}]

$ order.total
=> 1.5

$ order.complete_order
```
