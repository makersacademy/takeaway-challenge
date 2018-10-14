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
[4] pry(main)> client = TwilioClient.new('+44 115 824 3978', '+44 7950 290690')
=> #<TwilioClient:0x00007fa7bfa7db90
 @client=
  #<Twilio::REST::Client:0x00007fa7bfa7db18
   @account_sid="AC95f23a31e4b43442665d0a8c65271ee5",
   @accounts=nil,
   @api=nil,
   @auth=["AC95f23a31e4b43442665d0a8c65271ee5", "1aeed18dee8af028b1113e5b5f0d561b"],

   @auth_token="1aeed18dee8af028b1113e5b5f0d561b",
   @chat=nil,
   @fax=nil,
   @http_client=
    #<Twilio::HTTP::Client:0x00007fa7bfa7daf0
     @adapter=:net_http,
     @proxy_addr=nil,
     @proxy_pass=nil,
     @proxy_port=nil,
     @proxy_user=nil,
     @ssl_ca_file=nil,
     @timeout=nil>,
   @ip_messaging=nil,
   @lookups=nil,
   @messaging=nil,
   @monitor=nil,
   @notify=nil,
   @password="1aeed18dee8af028b1113e5b5f0d561b",
   @preview=nil,
   @pricing=nil,
   @proxy=nil,
   @region=nil,
   @studio=nil,
   @sync=nil,
   @taskrouter=nil,
   @trunking=nil,
   @username="AC95f23a31e4b43442665d0a8c65271ee5",
   @verify=nil,
   @video=nil,
   @voice=nil,
   @wireless=nil>,
 @from="+44 115 824 3978",
 @to="+44 7950 290690">
[5] pry(main)> menu = TokyoMenu.new
=> #<TokyoMenu:0x00007fa7c0a89c28>
[6] pry(main)> takeaway = Takeaway.new(menu, client)
=> #<Takeaway:0x00007fa7bfaec900
 @client=
  #<TwilioClient:0x00007fa7bfa7db90
   @client=
    #<Twilio::REST::Client:0x00007fa7bfa7db18
     @account_sid="AC95f23a31e4b43442665d0a8c65271ee5",
     @accounts=nil,

     @api=nil,
     @auth=["AC95f23a31e4b43442665d0a8c65271ee5", "1aeed18dee8af028b1113e5b5f0d561b"],
     @auth_token="1aeed18dee8af028b1113e5b5f0d561b",
     @chat=nil,
     @fax=nil,
     @http_client=
      #<Twilio::HTTP::Client:0x00007fa7bfa7daf0
       @adapter=:net_http,
       @proxy_addr=nil,
       @proxy_pass=nil,
       @proxy_port=nil,
       @proxy_user=nil,
       @ssl_ca_file=nil,
       @timeout=nil>,
     @ip_messaging=nil,
     @lookups=nil,
     @messaging=nil,
     @monitor=nil,
     @notify=nil,
     @password="1aeed18dee8af028b1113e5b5f0d561b",
     @preview=nil,
     @pricing=nil,
     @proxy=nil,
     @region=nil,
     @studio=nil,
     @sync=nil,
     @taskrouter=nil,
     @trunking=nil,
     @username="AC95f23a31e4b43442665d0a8c65271ee5",
     @verify=nil,
     @video=nil,
     @voice=nil,
     @wireless=nil>,
   @from="+44 115 824 3978",
   @to="+44 7950 290690">,
 @current_selection=nil,
 @menu=#<TokyoMenu:0x00007fa7c0a89c28>,
 @menu_array=
  [{:name=>"Miso Soup", :nickname=>:miso, :price=>1.5},
   {:name=>"Soba Noodles", :nickname=>:soba, :price=>4.5},
   {:name=>"Vegetable Tempura", :nickname=>:tempura, :price=>3.5},
   {:name=>"Avocado Maki", :nickname=>:maki, :price=>4.0},
   {:name=>"Teriyaki Tofu Don", :nickname=>:tofu, :price=>5.0},
   {:name=>"White Rice", :nickname=>:rice, :price=>1.0},
   {:name=>"Green Tea", :nickname=>:tea, :price=>1.0}]>
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
