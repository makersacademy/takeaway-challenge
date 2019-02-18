## The Take Away Challenge
# Please note that this is not complete.
# The stubs and doubles have not been checked in because they are not yet working
# The code does not send a text when an order is successful
# It does fully carry out the user story apart from the texting


## User Stories
#As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

in irb
2.5.0 :001 > menu = Menu.new
 => #<Menu:0x00007f978899c9c0 @menu={"spring roll"=>0.99, "char sui bun"=>3.99, "pork dumpling"=>2.99, "peking duck"=>7.99, "fu-king fried rice"=>5.99}> 

2.5.0 :002 >  menu.display
"spring roll    £0.99"
"char sui bun    £3.99"
"pork dumpling    £2.99"
"peking duck    £7.99"
"fu-king fried rice    £5.99"

# As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

2.5.0 :001 > m = Menu.new
 => #<Menu:0x00007fdb34888aa8 @menu=[], @basket=[]> 
2.5.0 :002 > m.set_menu
 => {"spring roll"=>0.99, "char sui bun"=>3.99, "pork dumpling"=>2.99, "peking duck"=>7.99, "fu-king fried rice"=>5.99} 
2.5.0 :003 > m.order
"Please enter your order"
sushi
"sushi"
"Boo Hiss it is not on the menu"
"Please enter your order"
pork dumpling
"pork dumpling"
"Hurrah it is on the menu"
"Please enter your order"
pork dumpling
"pork dumpling"
"Hurrah it is on the menu"
"Please enter your order"
peking duck
"peking duck"
"Hurrah it is on the menu"
"Please enter your order"
quit
"quit"
"Boo Hiss it is not on the menu"
"Please enter your order"
Quit
"Quit"
["pork dumpling", "pork dumpling", "peking duck"]
 => ["pork dumpling", "pork dumpling", "peking duck"] 
2.5.0 :004 > 

# As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order
.5.0 :001 > m = Menu.new
 => #<Menu:0x00007ffa37848828 @menu={"spring roll"=>0.99, "char sui bun"=>3.99, "pork dumpling"=>2.99, "peking duck"=>7.99, "fu-king fried rice"=>5.99}, @basket=[], @total=0> 
2.5.0 :002 > m.order
"Please enter your order, type quit to end"
char sui bun
"char sui bun"
"Hurrah it is on the menu"
3.99
"Please enter your order, type quit to end"
char sui bun
"char sui bun"
3.99
"Hurrah it is on the menu"
3.99
"Please enter your order, type quit to end"
char sui bun
"char sui bun"
7.98
"Hurrah it is on the menu"
3.99
"Please enter your order, type quit to end"
quit
"quit"
11.97
["char sui bun", "char sui bun", "char sui bun"]
 => ["char sui bun", "char sui bun", "char sui bun"] 
2.5.0 :003 > 

# As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered 
before 18:52" after I have ordered

