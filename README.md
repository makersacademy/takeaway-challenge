Takeaway Challenge
==================
```
                            _________
              r==           |       |
           _  //            |  S.B. |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```

Introduction
-------
The following programme is a solution to the 'Takeaway Challenge', which requires a user to be able to order a number of available dishes. The user is able to view a menu and subsequently, add a number of dishes from it to the order. The order can then be reviewed, allowing a check on whether the total amount to be paid is correct.

If the user inputs an item number that doesn't correspond with one of that on the menu, an error is raised, informing them of their invalid selection.

Once users are satisfied with their selection, they are able to confirm it, upon which a text is sent out. The text message verifies that the order has been successfully placed and includes the estimated delivery time.

The programme should satisfy several pre specified user stories, which are detailed below:
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

Method
------------------
In order to solve this challenge, I followed the tenets of Test Driven Development (TDD) and the Behaviour-Driven Development (BDD) cycle.

This resulted in first creating a domain model for each user story, then writing feature tests for that story, followed by its constituent unit tests, and then practicing the red-green-refactor method.

To ensure that each aspect of the programme was thoroughly tested, the use of mocks and stubs were used throughout. This was especially useful when testing the SMS capability, as it prevented texts being sent out during testing.

Note: Both the user story tests and unit tests are contained within the 'spec' folder. These can be ran with the gem Rspec.

The SMS functionality was implemented using [Twilio API](https://twilio.com).

The menu was populated through the creation and referencing of a csv file ('Mann_Fang_Lowe_Menu.csv'). The ['smarter CSV'](https://github.com/tilo/smarter_csv) gem was utilised to help process and convert the csv file into an array of hashes, which was then equated to the 'dishes' instance variable initialized in the 'Menu' class. The first line of the csv file represents the keys of the hash. The remaining lines represent the values of those keys. Each line is an individual hash.

E.g. the csv file below would produce the array:

[{number: 1, dish: apple, price: .7}, {number: 2, dish: pear, price: 1.2}]
```
1. number, dish, price
2. 1, apple, .7
3. 2, pear, 1.2
```

How to run
------------------
Initial steps:

1. The software has been written in the language Ruby. Therefore, to successfully run this programme, Ruby must first be installed.

  In order to install the current stable version of Ruby, run the following in your command line or install [Homebrew](https://brew.sh/):

  ```
  $ wget -O ruby-install-0.6.1.tar.gz https://github.com/postmodern/ruby-install/archive/v0.6.1.tar.gz
  $ tar -xzvf ruby-install-0.6.1.tar.gz
  $ cd ruby-install-0.6.1/
  $ sudo make install
  ```
2. Fork and clone this project onto your machine.
3. In order to implement the SMS functionality, a [free twilio account](https://twilio.com) must be created, which will provide you with a 'host' number that sends texts to "verified" numbers. Once you have set up a Twilio account, an 'sms_config.rb' file should be created in the 'lib' directory and populated with the following:

  ```
  class Config

    def config
      @config = {
        account_sid: 'Enter your own Account SID',
        auth_token: 'Enter your own Auth Token',
        from: ['Enter the number that Twilio provides'],
        to: ['Enter the number that you have verified'],
        body: "Thank you, loyal customer! Your order has been successfully placed"
      }
    end

  end
  ```

4. In the command line, run 'bundle init' followed by 'bundle install' to install the programme's required gems, which are listed in the gem file.
5. Launch a REPL (Read Evaluate Print Loop), such as IRB, to allow you to run the programme.
6. Running it... Once your selected REPL is open, an extremely important first step is to require the takeaway.rb file. Once this is done you can then interact with the programme.

The code below demonstrates how to create and confirm an order containing a variety of dishes.

```
2.3.1 :001 > require './lib/takeaway.rb'
 => true

2.3.1 :002 > kfc = Takeaway.new
 => #<Takeaway:0x007fb6beaec488 @menu=#<Menu:0x007fb6beaec348

2.3.1 :003 > kfc.view_menu
=======================
   Mann Fang Lowe Co.
23 Creators St., London
=======================
Dish: Price
1. Chop Sooy, With White Mushrooms: £2.5
2. Plain Chop Sooy: £2.0
3. Guy Gang (Chicken Soup): £3.0
4. Vegetable Soup: £3.5
5. Guysue Mein (Noodle Soup With Chicken): £3.0
6. Yet Quo Mein (Noodle Soup With Pork): £2.0
7. One Hone (Boiled Chicken And Dumpling): £3.4
8. Chow Mein (Fried Noodle With Boneless Chicken) (L): £6.0
9. Chow Mein (Fried Noodle With Boneless Chicken) (S): £4.0
10. Bor Low Guy Pan (Boneless Chicken With Pineapple): £7.1
11. Lychee Guy Pan (Boneless Chicken With Lychee): £7.5
12. Guy Fou Yong Dun (Chicken Omelet): £8.0
13. Fou Yong Guy Pan (Chicken With Scrambled Eggs): £6.5
14. Jar Jee Guy (Boneless Chicken Fried In Crackerdust): £2.6
15. Mou Goo Guy Pan (Boneless Chicken With White Mushrooms): £7.0
16. Fou Yong Dun (Omelet With Ham): £5.5
17. Fou Yong Dun (Plain Omelet): £4.2
18. Fou Yong Ha (Omelet With Lobster): £7.7

2.3.1 :004 > kfc.place_order
Please input the menu number of the dish you would like:
16
How many portions of this dish would you like?
2
 => 2
2.3.1 :005 > kfc.place_order
Please input the menu number of the dish you would like:
5
How many portions of this dish would you like?
1
 => 1
2.3.1 :006 > kfc.place_order
Please input the menu number of the dish you would like:
8
How many portions of this dish would you like?
2
 => 2
2.3.1 :007 > kfc.review
=======================
Fou Yong Dun (Omelet With Ham): £5.5
Fou Yong Dun (Omelet With Ham): £5.5
Guysue Mein (Noodle Soup With Chicken): £3.0
Chow Mein (Fried Noodle With Boneless Chicken) (L): £6.0
Chow Mein (Fried Noodle With Boneless Chicken) (L): £6.0
=======================
Total: £26.0
=======================
2.3.1 :008 > kfc.confirm
 => <Twilio::REST::Message @path=/2010-04-01/Accounts/ACf19c3f9c599c7dde16aa88eb8e471d33/Messages/SMa181b75380e641b5a7a1204c1a05a501>
```
Below is an example of the text confirmation that is distributed.
![Imgur](http://i.imgur.com/HU6zjbO.jpg)
