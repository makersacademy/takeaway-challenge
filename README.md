**DELIVEROOBY** [![Build Status](https://travis-ci.org/makersacademy/takeaway-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/takeaway-challenge)
```
                            _________
              r==           |       |
           _  //            |       |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

```

Initialize a new takeaway outlet

  `takeaway = Takeaway.new`

Check the menu (all menus/orders are in hash format)

  `takeaway.menu` => {rice: 5, pea: 10}

Select items + quantities from the menu and receive a cost

  `takeaway.select_items({rice: 3, pea: 5})` => 65

Place order with a hash and payment - will raise error if payment is incorrect

  `takeaway.place_order({rice: 3, pea: 5}, 65)`

A text message will be sent confirming this order

<img src=/images/orderconf.jpg width=300/>

**Bonus attempt:**

I set up new branch to work on, and a Heroku account to deploy to.

After getting to know what a Procfile was for and what it should include, I added that to load my /lib/sms.rb file when deployed on the web.

Using Twilio's 'get' feature, I was able to analyse the incoming string from text messages sent to my Twilio number.

A crude workaround I came up with was to evaluate whether the text was a hash format and convert it to a Hash if so. It then runs through the format_message and delivery_time methods to respond:

<img src=/images/textconf.jpg width=300/>
