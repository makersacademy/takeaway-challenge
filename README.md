# Takeaway Challenge

```
                            _________
              r==           |       |
           _  //            |  X.L. |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

```

## Instructions

- Feel free to use google, your notes, books, etc. but work on your own
- If you refer to the solution of another coach or student, please put a link to that in your README
- If you have a partial solution, **still check in a partial solution**
- You must submit a pull request to this repo with your code by 9am Monday morning

## Task

- Fork this repo
- Run the command 'bundle' in the project directory to ensure you have all the gems
- Write a Takeaway program with the following user stories:

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

## Project To Do List

### User Stories

- [x] Customers can check a list of dishes with prices
- [x] Customers can select the meal they want by selecting some number of several available dishes
- [x] Customers can verify their order is correct by checking that the total they have been given matches the sum of the various dishes in their order
- [ ] Customer can receive a text stating that the order was placed successfully and that it will be delivered 1 hour from now such as _"Thank you! Your order was placed and will be delivered before 18:52"_ after order is placed

### Project Miscellaneous

- [x] Plan & draw a diagram of my domain model
- [ ] Use the twilio-ruby gem to access the API
- [ ] Use the Gemfile to manage your gems
- [ ] Make sure that your Takeaway is thoroughly tested and that you use mocks and/or stubs, as necessary to not to send texts when your tests are run
- [ ] However, if your Takeaway is loaded into IRB and the order is placed, the text should actually be sent
- [ ] All tests passing
- [ ] > 95% Test Coverage
- [ ] Make the code elegant: every class has a clear responsibility, methods are short etc.
- [ ] (Advanced) Implement the ability to place orders via text message.
- [ ] Ensure private information such as **mobile number** or **Twilio API Key** is kept secret: e.g. use environment variables
- [ ] Submit pull request

## Domain Model Planning

![Takeaway Diagram](https://lucid.app/publicSegments/view/9031337c-71ab-401d-8859-b81a85d0cf8b/image.png)
