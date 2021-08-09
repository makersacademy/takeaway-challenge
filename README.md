This is my attempt at the Takeaway weekend challange, it was quite challenging in trying to make sure that I created the right classes, and accessing them correctly. I started with drawing a domain model diagrams and then tried to implement them while utalising TDD. Sometimes I did wonder if the tests were testing what I thought they were.

I'm still having issues with trying to MOCK and STUB tests, I understand the principle but am struggling with the implementation.  This caused me to struggle with TDDing the confirmation/send_sms methods. I did spend a lot of time on google and stackoverflow, though some of it was definitely going over my head. Some of the things I came across involed making fakesms module, but that was on a rails related page, and using things like VCR or Webmock, and I didn't feel confident trying to use them considering I was still struggling with the basics of mocking. Implementation of the send_sms method involved me following the guide on "https://www.twilio.com/docs/sms/tutorials/how-to-send-sms-messages-in-ruby#". Saving the tokens and phonenumbers to environment variables and referencing them in the method was surprisingly painless.

The other things I struggled with were trying to get the time to display in the correct format, which I believe I have managed and then getting the price to display with 2 decimal places. The latter has risen an offence by rubocop, but my attempts to use annotated tokens caused things to stop working, and looking at the documentation cunfused me a fair bit and stackoverflow didnt help much either, I will need to spend more time trying to understand the examples and documentation. Finally rubocop seems to have an issue with line 44 message = @client.messages but as this is straight from the Twilio tutorial I have not changed it. Rspec says I have a total 95.35%, but my takeaway.rb file only has 85.71% coverage but the lines it is referencing are the send_sms method, which I didnt know how to test considering it was an external API call. 


How to use:                                                                                                                                                       
> takeaway = Takeaway.new                                                                                                                                         
> takeaway.show_menu                                                                                                                                             
{"Samosa"=>1.7, "Seekh Kebab"=>1.8, "Chicken Tikka"=>4.99, "Lamb Tikka"=>4.99, "Onion Bhaji"=>1.5}                                                               
> takeaway.add_item "Chicken Tikka"                                                                                                                               
1x Chicken Tikka added to your order.                                                                                                                             
> takeaway.add_item "Samosa", 2                                                                                                                                   
2x Samosa added to your order.                                                                                                                                   
> takeaway.summary                                                                                                                                               
1x Chicken Tikka £4.99 2x Samosa £3.40                                                                                                                           
> takeaway.total                                                                                                                                                 
8.39                                                                                                                                                             
> takeaway.confirmation                                                                                                                                           
                                                                                                                                                                 
RSPEC results                                                                                                                                                     
Dishes                                                                                                                                                           
  has dishes                                                                                                                                                     
                                                                                                                                                                 
Order                                                                                                                                                             
  allows items to be ordered                                                                                                                                     
  calculates how much the order is                                                                                                                               
  displays a summary of the current order                                                                                                                         
                                                                                                                                                                 
Takeaway                                                                                                                                                         
  has items in the menu                                                                                                                                           
{"Samosa"=>1.7, "Seekh Kebab"=>1.8, "Chicken Tikka"=>4.99, "Lamb Tikka"=>4.99, "Onion Bhaji"=>1.5}                                                               
  displays the menu                                                                                                                                               
 1x Samosa added to your order.                                                                                                                                   
  allows items to be ordered                                                                                                                                     
 1x Samosa added to your order.                                                                                                                                   
  shows the total                                                                                                                                                 
 2x Samosa added to your order.                                                                                                                                   
  displays a summary of the current order                                                                                                                         
  sends a confirmation sms                                                                                                                                       
                                                                                                                                                                
Finished in 0.03683 seconds (files took 0.5892 seconds to load)                                                                                                   
10 examples, 0 failures                                                                                                                                           
                                                                                                                                                                 
                                                                                                                                                                
COVERAGE:  95.35% -- 82/86 lines in 6 files                                                                                                                       
                                                                                                                                                                 
+----------+-----------------+-------+--------+---------+                                                                                                         
| coverage | file            | lines | missed | missing |                                                                                                         
+----------+-----------------+-------+--------+---------+                                                                                                         
|  85.71%  | lib/takeaway.rb | 28    | 4      | 41-44   |                                                                                                         
+----------+-----------------+-------+--------+---------+                                                                                                         
5 file(s) with 100% coverage not shown                                                                                                                           
                                                                                                                                                                 
Rubocop results                                                                                                                                                   
                                                                                                                                                                 
Inspecting 8 files                                                                                                                                               
..CW....                                                                                                                                                         
                                                                                                                                                                 
Offenses:                                                                                                                                                         
                                                                                                                                                                 
lib/order.rb:30:44: C: Style/FormatStringToken: Prefer annotated tokens (like %<foo>s) over unannotated tokens (like %s).                                         
      summary += "#{quantity}x #{item} £#{'%.2f' % (quantity * @menu[item])} "                                                                                   
                                           ^^^^                                                                                                                   
lib/takeaway.rb:26:15: C: Style/FormatStringToken: Prefer annotated tokens (like %<foo>s) over unannotated tokens (like %s).                                     
    puts "£#{'%.2f' % @order.total}"                                                                                                                             
              ^^^^                                                                                                                                               
lib/takeaway.rb:44:5: W: Lint/UselessAssignment: Useless assignment to variable - message.                                                                       
    message = @client.messages                                                                                                                                   
    ^^^^^^^                                                                                                                                                       
                                                                                                                                                                 
8 files inspected, 3 offenses detected 
