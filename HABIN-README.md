Takeaway Challenge (Weekend 2 challenge)
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
Instructions for use:

- $ gem install bundle
- $ bundle install

RVM and gems included:

- ruby '2.5.0'

- gem 'capybara'
- gem 'rake'
- gem 'rspec'
- gem 'rubocop'
- gem 'simplecov', require: false, group: :test
- gem 'simplecov-console', require: false, group: :test

Process:

I have gone through the user stories and step by step concluded the following main steps that need to be implemented:

  - See list of dishes with prices (read_menu)
  - Select some no. of dishes (order)
  - Summary of order, showing items and quantities (basket_summary)
  - Total price (total)
  - Checkout with final price (checkout)

I have created a Takeaway class that takes all the forefront actions of the menu and taking the order, then everything will be recorded and totals will be calculated in the Order class, delegating responsibilities to this class.
