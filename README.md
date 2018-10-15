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


(updated: 14 Oct 2018 - COVERAGE:  84.17% -- 101/120 lines in 6 files)

Installation
-------

1. Fork this repo, and clone to your local machine
1. When the installation completes, run `bundle`


Usage
---------

Here's how you might explore the application using something like pry:

```
$ pry
[1] pry(main)> load './lib/takeaway.rb'
=> true
[2] pry(main)> load './lib/tokyo_menu.rb'
=> true
[3] pry(main)> load './lib/twilio_client.rb'
=> true
[4] pry(main)> client = TwilioClient.new
=> #<TwilioClient:0x00007fa7bfa7db90
 @client=
  #<Twilio::REST::Client:0x00007fa7bfa7db18
  # ...
  # ...
[5] pry(main)> menu = TokyoMenu.new
=> #<TokyoMenu:0x00007fa7c0a89c28>
[6] pry(main)> takeaway = Takeaway.new(menu, client)
=> #<Takeaway:0x00007fa7bfaec900
 # ...
 # ...
[7] pry(main)> selection = {
[7] pry(main)*   dishes: [{ nickname: :miso, quantity: 1 }, { nickname: :tempura, quantity: 1 }, { nickname: :rice, quantity: 1
 }],
[7] pry(main)*   total: 6.00
[7] pry(main)* }
=> {:dishes=>[{:nickname=>:miso, :quantity=>1}, {:nickname=>:tempura, :quantity=>1}, {:nickname=>:rice, :quantity=>1}],
    :total=>6.0}
[8] pry(main)> takeaway.order(selection)
=> <Twilio.Api.V2010.MessageInstance account_sid:
# ...
# ...
[9] pry(main)>
```
