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

Technologies
-------

#### Install

* Bundle install Gemfile dependencies

```
$ gem install bundle
$ bundle

```

Task
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

My approach
-------

* Created two classes **Menu** and **Takeaway**
* Menu stores the list of dishes with prices
* Takeaway can order and print menu options
* Functionality still to be completed:
    - Ordering several items of the same dish
    - Totalling order prices
    - Text message implementation
* Challenges with design which I wrote about in a blog post [here](https://medium.com/@alexscotttonge/code-is-when-design-meets-the-harsh-light-of-dawn-53505d4e967)
