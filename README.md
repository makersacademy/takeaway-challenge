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
=> <Twilio.Api.V2010.MessageInstance account_sid: AC95f23a31e4b43442665d0a8c65271ee5 api_version: 2010-04-01 body: Sent from yo
ur Twilio trial account - Thank you! Your order was placed and will be delivered before 19:39 date_created: 2018-10-14 17:39:20
 +0000 date_updated: 2018-10-14 17:39:20 +0000 date_sent:  direction: outbound-api error_code: 0 error_message:  from: +4411582
43978 messaging_service_sid:  num_media: 0 num_segments: 1 price: 0.0 price_unit: USD sid: SM86cca2f4e8e5499d9c0fe75db97b71bc s
tatus: queued subresource_uris: {"media"=>"/2010-04-01/Accounts/AC95f23a31e4b43442665d0a8c65271ee5/Messages/SM86cca2f4e8e5499d9
c0fe75db97b71bc/Media.json"} to: +447950290690 uri: /2010-04-01/Accounts/AC95f23a31e4b43442665d0a8c65271ee5/Messages/SM86cca2f4
e8e5499d9c0fe75db97b71bc.json>
[9] pry(main)>
```
