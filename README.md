Takeaway Challenge
==================
```
                 _....._
              _.:`.--|--.`:._
            .: .'\o  | o /'. '.
          // '.  \ o|  /  o '.\
          //'._o'. \ |o/ o_.-'o\\
          || o '-.'.\|/.-' o   ||
          ||--o--o-->| 
          ---== MeRo Resto ==----
 ```

MeRo Resto 
-----

It's Friday. It's challenging. You need some food, but you're busy coding some ruby. 
Fire up MeRo Resto and follow the instruction below, you'll have imaginary food confirmed by text in no time!

To start
-----

* Clone this repo
* Run the command 'bundle' in the project directory to ensure you have all the gems

Usage
-----
* In the same directory you've cloned in, load up irb in your terminal
* Make sure you're requiring this file `require = './lib/order'`
* Make a new order `order = Order.new`
* Get yourself a menu to choose some food from `order.user_request`
* Follow the directions to order something (at the minute user input only works for one item/quantity pairing at a time)
* To add more items `order.add(item, quantity)`
* To get a total cost `order.total`
* Want to double check what's in the order? `order.order_list`
* When you're happy to place the order `order.complete`


Confirmation text
-----

This is a sample of the confirmation text

<img src="https://user-images.githubusercontent.com/16557524/58369129-29cb0d00-7eee-11e9-830d-d087672ecd08.jpg" width="320">


User stories covered
-----

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


Technologies used
-----

- Ruby! 
- Rspec
- Twilio gem
- dotenv gem

The last two of these I've never used for Ruby and it took a lot of messing around to get it working. You'll see my env file is listed in
`.gitignore` but I can see one or two security based things I'd like to fix. 


Thoughts
-----

Once I had everything working I wanted to add user input, to make it a little more like a user would actually be using the application. 
This meant my 96% test coverage went down to 90%, I'm going to try and sort that out now. I also decided I'd like some ascii art on my menu,
this probably added redudant code that wasn't needed, but it looks kinda cool. I'd also really like to do the order by text option, let's
see if I can get it working on a branch first. This was a more fun app to build, it's made me want to go back and try the Airport Challenge again.


Branch out
-----
I got a rather clunky solution to ordering via text implemented in a branch 
https://github.com/melanierogan/takeaway-challenge/tree/orderviatext
