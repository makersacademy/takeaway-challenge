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

This programme controls the a takeaway with wonderful cuisine available at all hours. The customer can view the menu, add items to basket, view their basket and receive a SMS text message upon checking out. 

I created this application for second weekend challenge at [Makers Academy](https://github.com/makersacademy).


## Instructions

#### Install ####

1. Fork this repo, and clone to your local machine
2. Run the command gem install bundle (if you don't have bundle already)
3. When the installation completes, run bundle

#### Run ####

```Shell
$ irb
> require './lib/takeaway.rb'
```

#### Create an takeaway ####

You can create a takeaway using the following command and with a result like this. Yes we have the paneer here, have no fear:

```Shell
> t = Takeaway.new # => <Takeaway:0x00007fbceb41cd78 @menu=#<Menu:0x00007fbceb41cd28 @dishes={:"Kolhapuri Murgi"=>5.6, :"Salmon Tikka Masala"=>8.8, :"Butter Chicken"=>6.1, :"Saag Paneer"=>3.0, :"Pilau rice"=>1.5, :"Coconut rice"=>1.8, :Poppadom=>0.5, :"Mango Chutney"=>0.3}>, @order={}, @sms_texter=#<SmsTexter:0x00007fbceb41ccb0>> 
```

#### Peruse the menu ####

To view the menu, use the show_menu method:

```Shell
> t.show_menu # => {:"Kolhapuri Murgi"=>5.6, :"Salmon Tikka Masala"=>8.8, :"Butter Chicken"=>6.1, :"Saag Paneer"=>3.0, :"Pilau rice"=>1.5, :"Coconut rice"=>1.8, :Poppadom=>0.5, :"Mango Chutney"=>0.3}
```

#### See something you like? add it to your basket ####

If you see something on the menu that takes your fancy, swipe it up quick with the add function. You by default you will add one to your basket but if you're feeling peckish then you can order multiple at a time by adding a quantity after the item you want to add.

```Shell
> t.add "Kolhapuri Murgi" # => {:"Kolhapuri Murgi"=>1}
> t.add "Coconut rice", 10 # => {:"Kolhapuri Murgi"=>1, :"Coconut rice"=>10} 
```
That's a lot of rice for one person... :|

## User requirements

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
