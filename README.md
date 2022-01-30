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

### Instructions


## To make an order via text

Run
```
bundle exec ruby lib/inbound.rb
```
In one terminal.

Run
```
ngrok http 4567
```
In another terminal.

Update "a message comes in" url in Twilio monitor with the ngrok forwarding url.

## To make an order in the terminal and have it confirmed via text
Run

```
bundle exec ruby outbound.rb
```


# You will have to add your own account_sid and auth_token, in outbound.rb in order for any of this to work. :)
