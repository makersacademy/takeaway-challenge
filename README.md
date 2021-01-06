# Takeaway App
A command line Ruby application that enables a user to add and remove items from a menu to their basket and order a takeaway.

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

## Set up
1) Clone this repo
2) Install required dependencies:
```
bundle
```
3) Set up databases.

#### Database set up
- In your terminal load psql
```
$ psql
```
- Then create a database
``` 
admin=# CREATE DATABASE takeaways;
```
- Connect to your database
```
admin=# \c
```
- Create table as demonstrated in ./db/migrations/01_create_takeaways_table.sql

## App usage:
1) Load irb
```
$ irb
```
2) Require necessary files:
```
> require './lib/menu'
> require './lib/order'
> require './lib/confirmation_text.rb'
> require './lib/takeaway'
```
3) Create a new takeaway:
```
> takeaway = Takeaway.new
```
4) To read the menu (food and price):
```
> takeaway.read_menu
```
5) Add to basket (item, quantity):
```
> takeway.add_to_basket('Margherita', 1)
```
5) Remove from basket (item):
```
> takeaway.remove_from_basket('Margherita')
```
6) To view basket:
```
> takeaway.view_basket
```
7) To see total_price:
```
> takeaway.total_price
```
8) To confirm order:
```
> takeaway.confirm_order
```
9) To get a confirmation text:
```
> takeaway.confirmation_text
```
10) To see a list of previous takeaways:
```
> takeaway.list_previous_takeaways
```