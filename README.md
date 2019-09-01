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

Task
-----

* Forked this MakersAcademy/takeaway-challenge
* Ran the command 'bundle' in the project directory to ensure you have all the gems
* Wrote a Takeaway program with the following user stories (irb feature testing shown to demonstrate how to interact with this application):

```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

2.5.0 :001 > require './lib/takeaway.rb'
 => true
2.5.0 :002 > require 'twilio-ruby'
 => true
2.5.0 :003 > require './lib/order.rb'
 => true
2.5.0 :004 > t=Takeaway.new
 => #<Takeaway:0x00007f91c3020a38 @menu={"burger"=>2, "chips"=>1, "kebab"=>3}, @current_order=#<Order:0x00007f91c3020a10 @current_order=[], @total=0>, @account_sid="ACe6608e52a423ca7f1e73bcf6d34e2c53", @auth_token="fa63712f422de2119ef41c47ff47fd72", @client=#<Twilio
::REST::Client:0x00007f91c3020970 @username="ACe6608e52a423ca7f1e73bcf6d34e2c53", @password="fa63712f422de2119ef41c47ff47fd72", @region=nil, @account_sid="ACe6608e52a423ca7f1e73bcf6d34e2c53", @auth_token="fa63712f422de2119ef41c47ff47fd72", @auth=["ACe6608e52a423ca7f1e73bcf6d34e2c53", "fa63712f422de2119ef41c47ff47fd72"], @http_client=#<Twilio::HTTP::Client:0x00007f91c3020948 @proxy_addr=nil, @proxy_port=nil, @proxy_user=nil, @proxy_pass=nil, @ssl_ca_file=nil, @timeout=nil, @adapter=:net_http>, @accounts=nil, @api=nil, @authy=nil, @autopilot=nil, @chat=nil, @conversations=nil, @fax=nil, @flex_api=nil, @insights=nil, @ip_messaging=nil, @lookups=nil, @messaging
=nil, @monitor=nil, @notify=nil, @preview=nil, @pricing=nil, @proxy=nil, @serverless=nil, @studio=nil, @sync=nil, @taskrouter=nil, @trunking=nil, @verify=nil, @video=nil, @voice=nil, @wireless=nil>, @from="+441133205009", @to="+447826028826", @body="Thank you! Yourorder was placed and will be delivered\n    within 1 hour">
2.5.0 :005 > t.menu
 => {"burger"=>2, "chips"=>1, "kebab"=>3}


As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes


2.5.0 :006 >  t.order('burger', 3)
 => 6
2.5.0 :007 > t.order('chips')
 => 7

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

2.5.0 :009 > t.order_total
 => "Total = £7"

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

2.5.0 :010 > t.complete_order
 => <Twilio.Api.V2010.MessageInstance account_sid: ACe6608e52a423ca7f1e73bcf6d34e2c53 api_version: 2010-04-01 body: Sent from your Twilio trial account - Thank you! Your order was placed and will be delivered within 1 hour date_created: 2019-09-01 17:23:35 +0000 date_updated: 2019-09-01 17:23:35 +0000 date_sent:  direction: outbound-api
 error_code:  error_message:  from: +441133205009 messaging_service_sid:  num_media: 0 num_segments: 1 price:  price_unit: USD sid: SMd45a41248567452f8370343535b185a0 status: queued subresource_uris: {"media"=>"/2010-04-01/Accounts/ACe6608e52a423ca7f1e73bcf6d34e2c53
/Messages/SMd45a41248567452f8370343535b185a0/Media.json"} to: +447826028826 uri: /2010-04-01/Accounts/ACe6608e52a423ca7f1e73bcf6d34e2
c53/Messages/SMd45a41248567452f8370343535b185a0.json>
```
