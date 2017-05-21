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

What is it?
-------

* Enables users to select dishes and the quantities of each dish from a set menu

How it works?
-----

* Sample code on Pry:

[1] pry(main)> require "./lib/order"
=> true
[2] pry(main)> order = Order.new
=> #<Order:0x007f8251953618
 @checkout=#<Checkout:0x007f8251953578>,
 @meal=[],
 @menu=#<Menu:0x007f82519535c8 @list_of_dishes={"chicken"=>4.99, "fish"=>5.5, "beef"=>4.99, "vegetarian"=>4.5}>>
[3] pry(main)> order.selection_of_dish("chicken", 2)
=> [{:dish=>"chicken", :price=>9.98}]
[4] pry(main)> order.selection_of_dish("beef", 1)
=> [{:dish=>"chicken", :price=>9.98}, {:dish=>"beef", :price=>4.99}]
[5] pry(main)> order.selection_of_dish("vegetarian", 4)
=> [{:dish=>"chicken", :price=>9.98}, {:dish=>"beef", :price=>4.99}, {:dish=>"vegetarian", :price=>18.0}]
[6] pry(main)> order.delete_order("beef")
=> [{:dish=>"chicken", :price=>9.98}, {:dish=>"vegetarian", :price=>18.0}]
[7] pry(main)> order.order_summary
You have selected 2 dishes: chicken at £9.98
vegetarian at £18.0
[nil, nil].This gives you a total price of £27.98=> nil

Language
-----
Ruby 2.4.0

Gem files
-----
gem 'capybara'
gem 'rake'
gem 'rspec'
gem 'rubocop'
gem 'simplecov', require: false, group: :test
gem 'simplecov-console', require: false, group: :test
gem 'twilio-ruby'


* Notes: Unfortunately i was unable to fully complete this, and currently have 2 failing tests and need have answered 3/4 user stories
