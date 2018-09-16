# Takeaway Challenge

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

## Set-up
In `irb` please enter `require './lib/takeaway'` to begin.

Then, create a new Takeaway object as follows:
`t = Takeaway.new`

## Viewing the menu
In order to view the menu use the method `view_menu`
```
2.5.0 :004 > t.view_menu
Fish and Chips £12.95
Roast Dinner   £14.95
Avocado Toast  £19.95
```

## Ordering an item
Ordering is done using the `add` method. It requires a string as its argument.
```
2.5.0 :005 > t.add("Fish and Chips")
 => [{:dish=>#<Dish:0x00007fca1f1f6d28 @name="Fish and Chips", @price=1295>, :qty=>1}]
 ```
The dish object is then saved to a hash with a quantity value.

An integer can be passed as a second argument, to specify quantity. (This defaults to 1 otherwise)
```
2.5.0 :006 > t.add("Fish and Chips", 3)
 => [{:dish=>#<Dish:0x00007fc65439b8c8 @name="Fish and Chips", @price=1295>, :qty=>4}]
 ```
 Note that when adding a dish that already exists on the order, the quantity is updated.

 When a new dish is added, another hash is created:
 ```
 2.5.0 :007 > t.add("Roast Dinner", 4)
 => [{:dish=>#<Dish:0x00007fc65439b8c8 @name="Fish and Chips", @price=1295>, :qty=>4}, {:dish=>#<Dish:0x00007fc65439b8a0 @name="Roast Dinner", @price=1495>, :qty=>4}]
 ```

 When a dish not present in the menu is passed as an argument, an error is raised.
 ```
 2.5.0 :010 > t.add("Chips")
Traceback (most recent call last):
        4: from /Users/andres/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        3: from (irb):10
        2: from /Users/andres/Projects/takeaway-challenge/lib/takeaway.rb:21:in `add'
        1: from /Users/andres/Projects/takeaway-challenge/lib/order.rb:12:in `add'
RuntimeError (Dish not in menu!)
```

## Viewing your order
Use `view_order` method in order to see a full summary of the order.
```
2.5.0 :008 > t.view_order
Fish and Chips £12.95	x4	£51.80
Roast Dinner   £14.95	x4	£59.80
Total:	£111.60
```

## Checking out
Use `checkout` in order to pay for the order. It requires a float which matches the total exactly.
```
2.5.0 :009 > t.checkout(100.00)
Traceback (most recent call last):
        3: from /Users/andres/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        2: from (irb):9
        1: from /Users/andres/Projects/takeaway-challenge/lib/takeaway.rb:29:in `checkout'
RuntimeError (Please enter exact amount!)
```

When successful, an SMS confirmation message is sent:
```
2.5.0 :011 > t.checkout(111.60)
 => <Twilio.Api.V2010.MessageInstance account_sid: ACd319a65e921b7f3a98db79f2f6a2af51 api_version: 2010-04-01 body: Sent from your Twilio trial account - Thank you! Your order was placed and will be delivered before 22:30 date_created: 2018-09-16 20:30:23 +0000 date_updated: 2018-09-16 20:30:23 +0000 date_sent:  direction: outbound-api error_code: 0 error_message:  from: +447533039151 messaging_service_sid:  num_media: 0 num_segments: 1 price: 0.0 price_unit: USD sid: SM46e0057e5b36415491d5e7d654826c69 status: queued subresource_uris: {"media"=>"/2010-04-01/Accounts/ACd319a65e921b7f3a98db79f2f6a2af51/Messages/SM46e0057e5b36415491d5e7d654826c69/Media.json"} to: +447951136210 uri: /2010-04-01/Accounts/ACd319a65e921b7f3a98db79f2f6a2af51/Messages/SM46e0057e5b36415491d5e7d654826c69.json>
 ```
