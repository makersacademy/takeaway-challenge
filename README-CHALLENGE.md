# Description of the challenge:
Write a Takeaway program with the following user stories

## User Stories
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
# Setting up the project:

1. git fork
2. Make new directory in your projects folder
3. Pull all the information from the fork 
4. Run bundle

# User stories plan
## User story 1 - completed
![user story 11](https://user-images.githubusercontent.com/80968551/135779220-f611abfd-08d2-474f-bd6a-2b91f2035d67.jpg)
## User story 2 - completed
![user story 22](https://user-images.githubusercontent.com/80968551/135779225-f3dfbd2f-4e65-4f8c-90b7-2e68117cc655.jpg)
## User story 3 - completed
![User story 33](https://user-images.githubusercontent.com/80968551/135779226-cbab2979-40ed-4e62-8085-343b803e7daa.jpg)
## User story 4 - incomplete
![user story 4](https://user-images.githubusercontent.com/80968551/135779230-20c98e76-2485-4ddb-83c0-4fda13d9eed5.JPG)
I have followed these steps for twilio:
1. Signed up 
2. Gem install twilio-ruby
3. Added gem 'twilio-ruby' in the gemfile
4. Ran bundle install 
5. Ran brew tap twilio/brew && brew install twilio
6. Logged into twilio in the terminal
7. Ran twilio autocomplete zsh
8. Made a sms.rb file that would send the message
9. Made an .env file in which I added the identification details for twilio
10. I installed the dotenv gem
11. Added gem "dotenv" to my gemfile
12. Ran bundle
13. made a .gitignore file in which I put the .env file as well as the sms.rb file


When I ran sms.rb with the authentication details inside the file, it worked, however when it came to using the .env file, it did not work. Based on the error message, I tried to figure out what was the issue, I found a stackoverflow question, and the answer mentioned not having the right Account SID. I tried various ways of writing the information in the .env file, to no avail.
The text class and test has been made, I just need to continue my research and fix the issue with my sms.rb file. Once I do that, I will write the tests for the send_text method by using a double for sms.rb. I will then write the code to pass the tests.

Links:
- https://www.twilio.com/blog/2016/09/how-to-send-an-sms-with-ruby-using-twilio.html 
- https://www.twilio.com/docs/sms/quickstart/ruby
- https://www.thoughtco.com/using-environment-variables-2908194 
- https://www.twilio.com/blog/simple-notification-system-inform-about-changes
- https://www.twilio.com/docs/usage/secure-credentials
- https://www.youtube.com/watch?v=tqWDiu8a4gc&t=117s
- https://www.twilio.com/blog/2017/01/how-to-set-environment-variables.html?utm_source=youtube&utm_medium=video&utm_campaign=twilio_tip_3
- https://dev.to/eprenzlin/env-gitignore-and-protecting-api-keys-2b9l
- https://www.youtube.com/watch?v=17UVejOw3zA
- https://www.youtube.com/watch?v=8SLdV8dn7_I
- https://stackoverflow.com/questions/45802757/how-can-i-fix-the-twiliorestresterror
- https://www.twilio.com/docs/twilio-cli/quickstart
- https://www.twilio.com/blog/send-sms-30-seconds-ruby
- https://www.twilio.com/docs/lookup/api

# Class diagram
![class diagram 1](https://user-images.githubusercontent.com/80968551/135779216-353ef1af-f9c0-45a5-ba79-ff5f872f8921.JPG)
