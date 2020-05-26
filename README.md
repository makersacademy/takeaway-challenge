Takeaway Challenge
==================

This program aims to allow a customer to order a takeaway and recieve an sms with confirmation and delivery time, these are the user stories:

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

Approach 
------------------

The domain diagram I used to structure my approach is found below:

www.diagram.codes/d/sequence/alias%20user%20%3D%20%22user%2FTA%20class%22%0Aalias%20menu%20%3D%20%22menu%20class%22%0Aalias%20order%20%3D%20%22order%20class%22%0Aalias%20sms%20%3D%20%22sms%22%0A%0A%0Amenu%20-%3E%20user%3A%20%22shows%20the%20user%20the%20dishes%20and%20prices%20options%22%0Auser%20-%3E%20order%3A%20%22selects%20the%20dishes%20w'%20prices%20they%20want%20to%20order%22%0Aorder%20-%3E%20user%3A%20%22calculate%20the%20price%20of%20the%20dishes%20selected%2C%20and%20return%20them%20to%20the%20user%22%0Auser%20-%3E%20sms%3A%20%22sends%20the%20current%20order%20to%20sms%20to%20use%20API%22%0Asms%20-%3E%20user%3A%20%22use%20API%20to%20send%20text%20to%20user%20thanking%20for%20order%20and%20delivery%20after%201%20hour%22%0A%0A%0A%0A%0A%0A%0A%0A%0A

Notes 
------------------

I tried to create this app without hard coding a menu into it, the plan being to run a script, from the bin folder into the command line, this is still unfinished, I would like to continue working on this this week.

I would also like to be able to create a version of this with a menu hard coded in for further testing purposes.

My menu class had the least test covereage of the classes, feedback on how to improve the RSpec tests would greatly be appriciated.
