I styarted over the xmas break and made two attempts at this chalenge. The first was with the
'Menu1' and Shopping_Basket' files. 

For the purpose of this pull request i have commented these out so that they will not interfere with any testing, and to show the change in code.

 Requirements:

- Allow user to view menu with items and prices (stored in a hash?)
- Allow user to select multiple menu items
- Store choices in the Basket Class
- Display them in the basket Class along with quantities, individual item cost      and total cost.
- Finalise order then send confirmation text.


Classes:

Menu:
Store each menu item and price as K/V pair (hash), store hashs in an array
@menu (array of menu item hashes) 

Basket - Store choices (get from user, store in array)

@selection - array of selected item hashes
Method to show number of each

Calculate Bill ???
Print choices, costs and total to screen
Assign value to price values, return sum of all

Text
Sends confirmation text to user


Test for Menu more
Totals (running + final)
Implement the text


Following on from this first attempt i then found a video online showing a walkthrough of this challenge. I decided to use this as a learning tool and then follow it to see the approach of rspec and learn from it. 

https://www.youtube.com/watch?v=mgiJKdH9x8c