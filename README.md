# Takeaway Challenge


This challenge was based upon building a console interactive Ruby application and using the Twilio API to send and receive SMS requests.

## User stories

```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices
```
```
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes
```
```
As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order
```
```
As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```

## How to run the application

### Initial set-up
* Open IRB in your console
* Enter the following line of code into the console:
```
require 'takeaway.rb'
```

The console should return "true" (if it returns false, don't worry, the programme should still run)

Next, enter:
```
 takeaway = Takeaway.new
```
The console should return something similar to:
```
=> #<Takeaway:0x000000011a2308 @order=[]> 
```

### To see the menu items of the takeaway
Enter the following line of code to see the menu:
``` 
takeaway.see_menu
```
The console should return this array of items with associated prices:

```
 => {"Coconut Rice"=>5.45, "Jollof Rice"=>3.89, "Pounded Yam"=>3.85, "Dumplings"=>2.14, "Jerk Chicken"=>3.45, "Pepper Soup"=>3.15} 
 ```

### To order something from the menu
Enter the following line of code to order from the menu (i.e. 1x Coconut Rice and 2x Jerk Chicken):
 ```
 takeaway.place_order("Coconut Rice", 1)
```
The console will return:
```
1x Coconut Rice added to your order!
 => [{"Coconut Rice x1"=>5.45}]
 ```
Next, enter the following:
```
takeaway.place_order("Jerk Chicken", 2)
```
The console should return:

```
2x Jerk Chicken added to your order!
 => [{"Coconut Rice x1"=>5.45}, {"Jerk Chicken x2"=>6.9}]
```

This verifies that your order has been taken!

### To view your order

Enter the following line of code:
```
takeaway.order
```
The console should return:
```
[{"Coconut Rice x1"=>5.45}, {"Jerk Chicken x2"=>6.9}] 
```
This verifies that your order of "1x Coconut Rice and 2x Jerk Chicken" has been stored!

## Technology

For this project, I used:
* **Ruby** for all logic
* Testing framework: **RSpec**

## Testing

To run tests in the console. 
<br><br>
Run this:
```
 "bundle install" 
 ```
This installs the relevant dependencies that should be locked in the Gemfile.

If this, doesn't work the following dependencies can be installed manually 
(capybara, rake, rspec, rubocop, simplecov, simplecov-console) by running:
```
gem install capybara
gem install rake
gem install rspec
gem install rubocop
gem install simplecov
gem install simplecov-console

```

# Reterospective 

#### Looking back on this project, there are a lot of things I'd have changed about my approach.

## 1. Initial planning

Taking time to initially away from the computer screen and take a pen and paper to write your thoughts down is invaluable to my coding process now.
<br>
Although it may not be blindingly obvious, I know in myself that it took me a while to begin writing this programme, 
the stand-out reason I would put this to be would be not doing the aforementioned - thinking about my programme in layman terms.
<br>
When you're freshly introduced to code, it's very easy to fall into the trap of writing out your thought process the way a machine would.
It's not just important, but esssential to remember that we are not machines and it's OK to make mistakes. 
The beauty of the mind lies in its ability to adapt to mistakes and not break down after an error or two. Use that to your advantage when planning!
Whether, it's mind-mappinp on paper or talking yourself through your process (trust me, you're not crazy, we all do it), it will almost always be beneficial.

## 2. Test-Driven Development (TDD)

I'd have TDD'd everything right from the get-go.
<br><br>
Are you someone who's just learning to code? Are you someone who codes regularly? Do you ever find from time to time you write a programme and think "I can't be bothered to test [insert feautre here]"? 
Well, buckle up fast buddy because it's **imperative** to getting into the habit great coding practices.
<br><br>
My personal problem was never really knowing what to test, it was giving myself the initiative to test everything. 
You need to make a conscious effort to test everything if it isn't an innate quality yet. Soon enough, it will be.

## 3. Gemfile

I even winced looking at my Gemfile knowing what I do now. It's messy. Very messy.
If you're looking at my Gemfile and thinking, **"Mine looks like that too? What's wrong with his??"**, let me help you out:
<br><br>
It's important to group your Ruby gems in a particular way.

```

gem 'nokogiri'
gem 'sinatra'

gem 'wirble', :group => :development

group :test do
  gem 'faker'
  gem 'rspec'
end

group :test, :development do
  gem 'capybara'
  gem 'rspec-rails'
end

gem 'cucumber', :group => [:cucumber, :test]

```

As seen here, by assigning the gems called faker and rspec to the group called test, 
the user would be able install gem dependencies with more control from the command line. 
That is to say that if the user wanted, they could install all their dependencies without the need for testing 
by entering this into the command line:
```
bundle install --without test 
```

This isn't just useful for the pioneer of the project but useful for anyone who'd ever want to view or edit their code.


## 4. Single Responsibility Principle (SRP)

In my project, I had the Takeaway class handling a lot of logic that I could've handed to the other classes to performas class methods before I injected them into the Takeaway class. 
An example of this would be the place_order method. This method was handling logic such as the puts statement and the string being assigned to the order variable. 
All of this was unnecessary in the Takeaway method and should've been extracted into the Order class and converted to separate class methods.

At an ever lower-level, instead of hard-coding the array of items into the Menu class. An Item class could've been created so that new instances of Item can be added to the Menu class (for use by the Takeaway owners, of course). 
I could've then used the array as a default parameter for the Menu class that's instantiated when the takeaway object was created.

I also notice that I could've made more use of interpolation in my methods so as to incorporate possible additional features. 
For example, if a user wanted to remove an item from their selection. 
To tackle this, I'd have thought about what my code actually states.
I have an array set up and effectively, I want the user to be able to call a method that drops an item from that array when passed a parameter - 
instantly, a hash and key set-up springs to mind.

I can't describe how I'd tackle this issue with the code I currently have as my entire set-up would be different.
If I were to get to that point again, my process would be as follows:

* Extract logic into Item, Menu, Order and Takeaway classes

Class | Responsibility | Possible initialize method in class |
------|----------------|-----------------|
Item |  Have a name property | ``` def initialize(name); @name = name, end ``` |
Menu | Contain an array of items | ``` def initialize(item = Item.new); @current_menu = [predefined array of items]; @working_menu = []; end  ``` |
Order | Acts as intermediary between Menu and Takeaway class methods | ``` def initialize(); @current_order = []; end  ```|
Takeaway | Acts as the controller and displays text to user (what methods are called upon in console) | ``` def initialize(); @order = Order.new; end ``` |


* Start building class methods within each class so that each class communicates only with the class it's supposed to

In my example:
-------------

Class | Communicates with: |
------|--------------------|
Item | Menu|
Menu | Item, Order |
Order | Menu, Takeaway |
Takeaway | Order |

I believe the logic handling interaction with the Twilio API would also be in the Order class but can only verify upon amending this project.
<br><br>
When I talk with colleagues, SRP is so widely used that it's become a running joke to even forget about using it. 
On a more serious note, not following SRP is one of the most common reasons why programmes you write can become too complex, verbose or just plain difficult to keep writing.
<br><br>
Single Responsibility Principle is defined as [a computer programming principle that states that every module or class should have responsibility over a single part of the functionality provided by the software, and that responsibility should be entirely encapsulated by the class.](https://en.wikipedia.org/wiki/Single_responsibility_principle)
But if, like me, you like to be able to succintly describe things, SRP really just means every method should be responsible for one action and every Class should be responsible for a particular group of methods relating to the function of the class.
<br><br>
At all times, it's important to remember that you're in control of what the Class and its methods should denote. 
<br><br>
Take an example of a class we could create that we'll call "Dog":
```
class Dog

end
```

Now, we want to be able to say that any instance of the class Dog should be able do bark:

```
class Dog

  def bark
    return "woof woof"
  end

end
```

By inputting this method in the class Dog we are saying that only the Dog class has "single responsibility" of the method called "bark".
<br><br>
Now if we were to introduce another class called Cat:
```
# Dog Class #
class Dog

  def bark
    return "woof woof"
  end

end

# Cat Class #
class Cat
  
end
```
Would it make sense to add a bark method here? Maybe in an alternate timeline in Rick and Morty, but sadly no, not here. 
Therefore, we're adhering to SRP, perfectly. 
<br><br>
If we wanted we could add a different method specific to the nature of our cat class:

```
# Dog Class #
class Dog

  def bark
    return "woof woof"
  end

end

# Cat Class #
class Cat

  def meow
    return "meeeeeoooow"
  end
  
end
```

Robert C. Martin (a.k.a. world-renowned software engineer, Uncle Bob) states that a Class should 'only have one reason to change' and this perfectly sums up the meaning of responsibility in SRP.
<br><br>
If the Class is fulfilling its responsbility and adding a method means it won't do that any more, change the method, remove the method or rethink your Class' responsbility.

## 5. Dependency Injection




# **Conclusion**

I will revisit this project to reach my fourth user story and experiment with the Twilio API.

**Thanks for reading this far!** :smile:

## Author

[Etienne Mustow](https://github.com/etiennemustow)





