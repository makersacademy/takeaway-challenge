Takeaway Challenge
==================
Introduction
---------

My work on the Takeaway Challenge for Makers Academy week 2

This program lets the user:
- look at the menus of different restaurants
- order food and drink items 
- see their current balance
- get texted with a delivery time

Approach
-------
1. I made four classes: TAKEAWAY, ORDER, MENU and MESSENGER.

2. After working on TAKEAWAY and ORDER, I decided to merge them into one class.  I know it is better to have them separate, but I found this easier.

3. I needed to add items in my hash: [Add item to hash ](https://stackoverflow.com/questions/9571768/how-to-add-new-item-to-hash)

4. Prices of items were coming out in very long decimals.  
```
3.0.2 :006 > t.add 'party pack'
* You added 1x party packs to the order *
* Your balance is £25.979999999999997 *
```
To solve this I used the .round(2) method.

5. On the Twilio class I masked my personal information using environment variables.  However Ruby was not accessing those variables, even though I could access them from my terminal.  I found that my .zshrc file was not updated with the information necessary:

```
export PATH="$PATH:$HOME/.rvm/bin"
```

6. Suppressed outputs in Rspec so that it wouldn't print out messages each time I ran a test.  
[Rspec: Suppress Console Output ](https://stackoverflow.com/questions/15430551/suppress-console-output-during-rspec-tests)

**Improvements that are possible**

* Allow ability to order from multiple restaurants
* Let customer subtract items from order
* Put order information into text 
* Implement the ability to place orders via text message
* Improve stubbing in tests
