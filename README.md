Write a Takeaway program with the following user stories:
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


I initially approached this project with the idea that I would have an interactive UX which would allow me take user input and run a method based on that, but I didn't take into account the fact that I don't know how to test for user input. So I started over again with a clean repo.

I was able to get up to the point where I created a new takeaway, read the menu, added to my order and displayed my basket, but I could not get further than this.

Here is the feature test in pry

```[1] pry(main)> require './lib/takeaway.rb'
=> true
[2] pry(main)> t = Takeaway.new
=> #<Takeaway:0x007fb2f292fbd8 @basket=[], @menu=#<Menu:0x007fb2f292fbb0>>
[3] pry(main)> t.read_menu
tacos : £5
burrito : £4
enchiladas : £5
margarita : £6
=> {:tacos=>5, :burrito=>4, :enchiladas=>5, :margarita=>6}
[4] pry(main)> t.add('tacos')
=> [{"tacos"=>1}]
[5] pry(main)> t.add('burrito', 3)
=> [{"tacos"=>1}, {"burrito"=>3}]
[6] pry(main)> t.show_basket
1 x tacos 3 x burrito => [{"tacos"=>1}, {"burrito"=>3}]```
