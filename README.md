#Takeaway Challenge#
Elizabeth Venner

###How to use###

Fork and clone this repo.

Ensure you have Ruby and IRB installed on your computer.

Open the command line and irb and follow the instructions below.
In order to get a text message confirming your delivery time, you will need to pass your telephone number as an argument to confirm_order, in the format exampled below on line 008.

```
2.3.1 :001 > require './lib/takeaway'
 => true
2.3.1 :002 > t = Takeaway.new
 => #<Takeaway:0x007fa6d38d3188 @menu_file="./lib/menu.csv", @menu=#<Menu:0x007fa6d38d3020 @dishes={:pasta=>"10.00", :pizza=>"9.00", :salad=>"4.00", :chips=>"3.00", :icecream=>"4.00"}>>
2.3.1 :003 > t.print_menu
 => {:pasta=>"10.00", :pizza=>"9.00", :salad=>"4.00", :chips=>"3.00", :icecream=>"4.00"}
2.3.1 :004 > t.please_may_i_order
 => "Sure, go right ahead!"
2.3.1 :005 > t.add_item(:pasta, 3)
{:pasta=>3}
 => "3 x pasta added to your basket"
2.3.1 :006 > t.add_item(:salad, 2)
{:pasta=>3, :salad=>2}
 => "2 x salad added to your basket"
2.3.1 :007 > puts t.print_order
3 x pasta = £30.00, 2 x salad = £8.00
Total: £38.00
 => nil
2.3.1 :008 > t.confirm_order(+441234554321)
 => "Thank you for placing your order."
 ```
