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

Menu class understands the menu itself, its contents and prices.

Takeaway class understands the full order process.

Text class understands text confirmation using the Twilio API.

**Sample user journey (irb code snippet):**

```bash

2.3.1 :001 > require './lib/takeaway.rb'
 => true
2.3.1 :002 > t = Takeaway.new
 => #<Takeaway:0x007fed131ee760 @menu=#<Menu:0x007fed131ee738 @items={"nasty noodles"=>8.95, "philthy pho"=>10.95, "rancid rice"=>3.95, "springy roll"=>4.95, "dirty duck"=>6.95, "caustic cake"=>5.95}>, @basket={}, @subtotal=[], @text_class=Text>
2.3.1 :003 > t.order("rancid rice",3)
3 rancid rice ordered.
 => [[3, "rancid rice", 11.85]]
2.3.1 :004 > t.order("nasty noodles",4)
4 nasty noodles ordered.
 => [[3, "rancid rice", 11.85], [4, "nasty noodles", 35.8]]
2.3.1 :005 > t.itemise
You have ordered 3 rancid rice for a total £11.85
You have ordered 4 nasty noodles for a total £35.8
Your total bill is £47.65.
 => nil
2.3.1 :006 > t.complete_order
Your account has been debited £47.65.
Delivery confirmation will now be sent to you via SMS.

```
