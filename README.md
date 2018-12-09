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

## Makers Academy - Weekend 2 Challenge

A piece of software that lets the user order some food from a takeaway and sends a delivery confimation text with an estimated delivery time.

Text messaging is handled by the `twilio-ruby` gem API and sensitive user authentication data is hidden with use of the `dotenv` gem.

Feature tests for each user story are included and demonstrated below.

## Getting started

1. Clone this repo `git clone git@github.com:Sindex42/takeaway-challenge.git`
2. Change directory `cd takeaway-challenge`
3. Run bundle to install dependencies `bundle install`

## Usage

Use pry or a similar REPL to interact with the program eg.:

Getting started

```


```

Viewing the menu

```


```

Ordering and verifying the total amount

```


```

Completing an order  

```


```

## Approach

I started by creating a Dish class that would be able to create dishes and add them to a Menu class. After making an Order class to deal with selecting dishes, I realised this was more tedious than I originally thought and scrapped both of them in favour of a simple ruby file containg a hash of available dishes.

I separated the Takeaway class from the Order class early on, to preserve SRP. Figuring out how to integrate the Twilio messaging function was hard and could ben improved on. Testing the Message class needs further work as the only tests I could figure out turned out to be completely vacuous. 
