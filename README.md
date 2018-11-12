# Introduction

Program to takes an order for a takeaway delivery.

Order class has method that takes an argument (item and the quantity), which looks up a hash in a created dishes object and adds to a bill, whilst informing the customer what they have ordered. The bill amount can be viewed by the customer and when the order is complete, a send message object is created that sends and confirmation text to the customer, with an estimated time of arrival and bill amoumnt.

irb procedure below:  


2.5.0 :004 > order = Order.new
<<<<<<< HEAD
 => #<Order:0x00007f91621a26d8 @dishes=#<Dishes:0x00007f91621a26b0 @dishes={"curry"=>5.0, "rice"=>2.5, "spare ribs"=>4.5}>, @food_ordered=[]>
2.5.0 :005 > order.order_food("rice", 1)
 => "rice ordered x 1"
2.5.0 :006 > order.order_food("curry", 3)
 => "curry ordered x 3"
2.5.0 :007 > order.bill_amount
 => "17.50"
2.5.0 :008 > order.complete_order
 => <Twilio.Api.V2010.MessageInstance account_sid: AC38aa7338da4e0b2cf1eb0eaf926f6a61 api_version: 2010-04-01 body: Sent from your Twilio trial account - Your order will be with you shortly. The order total is £17.50 and will be with you by 13:57 date_created: 2018-11-12 12:57:46 +0000 date_updated: 2018-11-12 12:57:46 +0000 date_sent:  direction: outbound-api error_code: 0 error_message:  from: +441477652022 messaging_service_sid:  num_media: 0 num_segments: 1 price: 0.0 price_unit: USD sid: SMb9d7f1d515844512938e0f4269c78813 status: queued subresource_uris: {"media"=>"/2010-04-01/Accounts/AC38aa7338da4e0b2cf1eb0eaf926f6a61/Messages/SMb9d7f1d515844512938e0f4269c78813/Media.json"} to: +447887988288 uri: /2010-04-01/Accounts/AC38aa7338da4e0b2cf1eb0eaf926f6a61/Messages/SMb9d7f1d515844512938e0f4269c78813.json>
2.5.0 :009 >
=======
 => #<Order:0x00007f91621a26d8 @dishes=#<Dishes:0x00007f91621a26b0 @dishes={"curry"=>5.0, "rice"=>2.5, "spare ribs"=>4.5}>, @food_ordered=[]><br/> 
2.5.0 :005 > order.order_food("rice", 1)
 => "rice ordered x 1"<br/>
2.5.0 :006 > order.order_food("curry", 3)
 => "curry ordered x 3"<br/>
2.5.0 :007 > order.bill_amount
 => "17.50"<br/>
2.5.0 :008 > order.complete_order<br/>
 => <Twilio.Api.V2010.MessageInstance account_sid: AC38aa7338da4e0b2cf1eb0eaf926f6a61 api_version: 2010-04-01 body: Sent from your Twilio trial account - Your order will be with you shortly. The order total is £17.50 and will be with you by 13:57 date_created: 2018-11-12 12:57:46 +0000 date_updated: 2018-11-12 12:57:46 +0000 date_sent:  direction: outbound-api error_code: 0 error_message:  from: +441477652022 messaging_service_sid:  num_media: 0 num_segments: 1 price: 0.0 price_unit: USD sid: SMb9d7f1d515844512938e0f4269c78813 status: queued subresource_uris: {"media"=>"/2010-04-01/Accounts/AC38aa7338da4e0b2cf1eb0eaf926f6a61/Messages/SMb9d7f1d515844512938e0f4269c78813/Media.json"} to: +447887988288 uri: /2010-04-01/Accounts/AC38aa7338da4e0b2cf1eb0eaf926f6a61/Messages/SMb9d7f1d515844512938e0f4269c78813.json> 
2.5.0 :009 > 
>>>>>>> 762f6063a4816b7f5e5c5c5fb060af29c7ddcef9

# Things to be improved

Not 100% happy with having each element of order as a repeat of a method and want to investigate having the whole order dealt with at once. Also need to work on mocking and isolation of tests as it's not currently a strong point. Some dependancy injection to be introduced to in a future update.
