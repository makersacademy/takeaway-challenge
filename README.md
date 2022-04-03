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

Instructions
-------
This program will allow customers to do the following:

- View a takeaway menu.
- Add selected dishes to an order.
- View the sum of the order.
- Receive an order confirmation & delivery time after checkout completion.

Installation
-----

1. Fork this repository.
2. Clone your new forked repository using `git clone` followed by your fork URL.
3. Move into the repository by using `cd takeaway-challenge`.
4. Run the command `gem install bundler` (if you don't have bundler already).
5. When the installation completes, run `bundle`.


Program Usage
-----

Use ruby to run the example program from the main repository:

```zsh
ruby ./spec/feature_test.rb
```

Or use irb from the main repository, to make your own dishes, menus, and orders:

```zsh
irb -r './lib/order.rb'
```


Test Usage
-----

Use rspec to run the tests from the main repository:

```zsh
rspec
```

Feel free to check rubocop from the main repository:

```zsh
rubocop
```


User Stories
-----

The client requests are broken down as follows:

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


User Story Wireframe
-----

You can view my initial plan of the progam [here](https://wireframe.cc/3Klfur). This includes the user story dealing with the text, along with another class to manage the interface. Since I had less than an afternoon to complete this I decided to focus on the first three user stories.

In future I would be interested in adding these other functions.
