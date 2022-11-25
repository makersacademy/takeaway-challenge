# Solo Project

Here is a project to test your golden square skills overall:

> As a customer  
> So that I can check if I want to order something  
> I would like to see a list of dishes with prices.
> 
> As a customer  
> So that I can order the meal I want  
> I would like to be able to select some number of several available dishes.
> 
> As a customer  
> So that I can verify that my order is correct  
> I would like to see an itemised receipt with a grand total.

Use the `twilio-ruby` gem to implement this next one. You will need to use
doubles too.

> As a customer  
> So that I am reassured that my order will be delivered on time  
> I would like to receive a text such as "Thank you! Your order was placed and
> will be delivered before 18:52" after I have ordered.

Fair warning: if you push your Twilio API Key to a public Github repository,
anyone will be able to see and use it. What are the security implications of
that? How will you keep that information out of your repository?

A: I plan on storing the private key in twilio.env and adding twilio.env to the .gitignore file - I should be able to access the key in the application files with something like private_key = ENV['TWILIO_KEY']     
Here is a good [article](https://medium.com/coffee-and-codes/the-simplest-and-powerful-ruby-gem-dotenv-74d64cbc5d5d) on the gem dotenv

## Getting started

`git clone https://github.com/jillwones/Golden-Square-Challenges.git`       
`bundle install`       
`add a twilio.env file to the root of 04_solo_project and inside it write:`      
`export TWILIO_ACCOUNT_SID=xxxxxxxxxxxxxxxxxxxxxxxxxxxx`      
`export TWILIO_AUTH_TOKEN=xxxxxxxxxxxxxxxxxxxxxxxxxxxx`

If you want the confirmation text to go to your phone number and not mine please change the default number in the send_text method in FinishMyOrder class to your phone number.

## Usage

`ruby lib/run_on_terminal.rb` 

## Running tests

`rspec`
