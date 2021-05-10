Hints on functionality to implement:

Ensure you have a list of dishes with prices

The text should state that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".

The text sending functionality should be implemented using Twilio API. You'll need to register for it. It’s free.

Use the twilio-ruby gem to access the API

Use the Gemfile to manage your gems

Make sure that your Takeaway is thoroughly tested and that you use mocks and/or stubs, as necessary to not to send texts when your tests are run
However, if your Takeaway is loaded into IRB and the order is placed, the text should actually be sent.

:Note that you can only send texts in the same country as you have your account. I.e. if you have a UK account you can only send to UK numbers.

Advanced! (have a go if you're feeling adventurous):

Implement the ability to place orders via text message.
A free account on Twilio will only allow you to send texts to "verified" numbers. Use your mobile phone number, don't worry about the customer's mobile phone.

⚠️ WARNING: think twice before you push your mobile number or Twilio API Key to a public space like GitHub 👀

🔑 Now is a great time to think about security and how you can keep your private information secret. You might want to explore environment variables.

Finally submit a pull request before Monday at 9am with your solution or partial solution. However much or little amount of code you wrote please please please submit a pull request before Monday at 9am
In code review we'll be hoping to see:

All tests passing
High Test coverage (>95% is good)
The code is elegant: every class has a clear responsibility, methods are short etc.
