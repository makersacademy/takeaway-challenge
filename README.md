Takeaway Challenge
==================

‘’’
irb
:001 > require './lib/takeaway'
:002 > takeaway = Takeaway.new
 => #<Takeaway:0x007fd390885390 @menu=#<Menu:0x007fd390885318 @the_menu={"Charsui pork"=>5, "Choisum"=>3, "Drink"=>1}>, @order=#<Order:0x007fd3908852a0 @current_order={}>, @text=#<Text:0x007fd390885228 @client=<Twilio::REST::Client @account_sid=ACd1e035e18219b4a2e47ed7c7e7e69deb>>, @total=0>
:003 > takeaway.show_menu
1: Charsui pork -- £5
2: Choisum -- £3
3: Drink -- £1
 => {"Charsui pork"=>5, "Choisum"=>3, "Drink"=>1}
:004 > takeaway.choose_dish("Choisum", 2)
:005 > takeaway.choose_dish("Charsui pork", 2)
:006 > takeaway.choose_dish("Drink", 3)
:007 > takeaway.order
 => #<Order:0x007fd3908852a0 @current_order={"Choisum"=>2, "Charsui pork"=>2, "Drink"=>3}>
:008 > takeaway.calculate_total
:009 > takeaway.place_order(19)
Confirmation text message has been sent.
‘’’
