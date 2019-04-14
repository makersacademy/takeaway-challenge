Takeaway Challenge
> This was our week two challenge at makers academy.

# Knowleged Needed To solve This Challenge
- Encapsulation.
- RSpec doubles.
- Abstraction
- Dependency Injection.
- Working with API (Twilio API)

How To Use This Application.
-------
- Fork this repo.
- clone it on your local computer `` git clone.``
- cd into the directory.
- Run bundle intall to install all the dependencies or the application.
- In terminal ``type irb ``
- ``require './lib/take_away ``
- Create a new menu object ``menu = Menu.new() ``|| ``Note: menu can takes one optional argument ``
- Create a new take way object ``take_away = TakeAway.new(menu)``

# Takeaway-Challenge In IRB
> How the application works currently.
<img width="187" alt="Screen Shot 2019-04-14 at 23 30 15" src="https://user-images.githubusercontent.com/37377831/56100318-1ef48400-5f0f-11e9-86f5-2de90018e2b6.png">
<img width="159" alt="Screen Shot 2019-04-14 at 23 31 15" src="https://user-images.githubusercontent.com/37377831/56100287-bb6a5680-5f0e-11e9-9875-04299eb15bd9.png">
<img width="753" alt="Screen Shot 2019-04-14 at 23 31 38" src="https://user-images.githubusercontent.com/37377831/56100331-3fbcd980-5f0f-11e9-8e0d-b90e2e04be30.png">
<img width="1074" alt="Screen Shot 2019-04-14 at 23 32 40" src="https://user-images.githubusercontent.com/37377831/56100397-1f414f00-5f10-11e9-8d87-6674b369a93a.png">
<img width="583" alt="Screen Shot 2019-04-14 at 23 34 23" src="https://user-images.githubusercontent.com/37377831/56100405-3d0eb400-5f10-11e9-9a7a-7d8d49aa29ec.png">
<img width="336" alt="Screen Shot 2019-04-14 at 23 37 11" src="https://user-images.githubusercontent.com/37377831/56100418-60d1fa00-5f10-11e9-9b55-2df745a04e06.png">
<img width="321" alt="Screen Shot 2019-04-14 at 23 37 56" src="https://user-images.githubusercontent.com/37377831/56100431-7e06c880-5f10-11e9-86c7-e214c1c4a3c6.png">

| object   | subjects |
|----------|----------|
|  Menu    |list_dish |
|TakeAway  |show_menu / select_dish|
|Order     |user_choice / total_order|


* Hints on functionality to implement:
  * Ensure you have a list of dishes with prices
  * Place the order by giving the list of dishes, their quantities and a number that should be the exact total. If the sum is not correct the method should raise an error, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".
  * The text sending functionality should be implemented using Twilio API. You'll need to register for it. It’s free.
  * Use the twilio-ruby gem to access the API
  * Use the Gemfile to manage your gems
  * Make sure that your Takeaway is thoroughly tested and that you use mocks and/or stubs, as necessary to not to send texts when your tests are run
  * However, if your Takeaway is loaded into IRB and the order is placed, the text should actually be sent
  * Note that you can only send texts in the same country as you have your account. I.e. if you have a UK account you can only send to UK numbers.

* Advanced! (have a go if you're feeling adventurous):
  * Implement the ability to place orders via text message.

* A free account on Twilio will only allow you to send texts to "verified" numbers. Use your mobile phone number, don't worry about the customer's mobile phone.

* **WARNING** think twice before you push your mobile number or any private details to a public space like Github. Now is a great time to think about security and how you can keep your private information secret. You might want to explore environment variables.

* Finally submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am


In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance will make the challenge somewhat easier.  You should be the judge of how much challenge you want this weekend.

Notes on Test Coverage
------------------

You can see your [test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) when you run your tests.
