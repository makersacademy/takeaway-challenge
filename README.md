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
## A takeaway program with the following user stories:

```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```
### Technologies Used:
* [dotenv](https://github.com/bkeepers/dotenv) - loads ENV variables
* [ngrok](https://ngrok.com/) - A secure tunnel to my localhost
* [Pry](http://pryrepl.org/) - An awesome REPL for Ruby
* [Ruby](https://www.ruby-lang.org/en/) - Programming Language
* [Sinatra](http://sinatrarb.com/) - Domain Specific Language for Web Apps
* [Twilio-Ruby](https://www.twilio.com/docs/libraries/ruby) - API that allows user to send and receive texts.
* [VCR](https://github.com/vcr/vcr) - Records HTTP interactions for tests

### Launch Program:
```zsh
$ pry -r './lib/takeaway.rb'
[1] pry(main)> russian = Menu.new
=> #<Menu:0x00007fde4d5c0a48
 @current_menu=
  {"pelmeni"=>6.99,
   "borscht"=>5.99,
   "tvarog"=>3.99,
   "olivier"=>4.99,
   "salat"=>1.99,
   "blinchiki"=>9.99}>
[2] pry(main)> shop = Takeaway.new
[3] pry(main)> shop.order("pelmeni", 2)
=> "2x - Pelmeni added to basket. Your current total is: £13.98"
[5] pry(main)> shop.order_confirmation
=> "Spacibo! You will receive a text soon confirming your order. Next time, try ordering over text message!"
```
#### Photo of text: 
![photo of text](https://i.imgur.com/kbnSzxZ.jpg?1)

**I was able to integrate the bonus challenge** into my program using ngrok and Sinatra, allowing you to order food by texting the number. 

Photos:

![placing order](https://i.imgur.com/P6ojEIp.png?1)![choosing food](https://i.imgur.com/vJtBmq0.png?4)![getting total](https://i.imgur.com/i1cqSZ1.png?1)![final confirm](https://i.imgur.com/RgC6B95.png?1)

### My Process

Following the user stories as stated above, I was able to create a program where a user can order food from a menu, receive the total amount, and then finally receive a text that confirms the order.

I used a test-driven approach when completing this application, and the greatest challenge was writing tests when sending a text message. 

At first I thought to stub out the *send_text* method in order for the tests to pass AND avoid sending me un-needed texts. However, even though it worked, I was unsatisfied with the test coverage and that I wasn't technically writing the test that did exactly that. Thankfully, with some research, I was able to use VCR, a gem that sent http requests but stored the results in a yml file. You can see it in the [fixtures](./fixtures/vcr_cassettes/twilio.yml) folder.

This helped me achieve one of my goals I set when starting this application which was to get 100% test coverage.

Speaking of goals, I had three personal goals set:

- [x] Get 100% Test Coverage (like in my Airplane Application)
- [x] Continue to debug effectively -- debugging 3rd party APIs
- [x] Get proof that I can learn anything on my own

I can happily report I achieved all three goals for this challenge, and I will share my code with more experienced folk who can provide feedback regarding my application. 

---

A blog post about [this project](https://kharouk.github.io).