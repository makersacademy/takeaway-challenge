As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

- create a hash with a list of dishes, quantities available and prices (menu)
<!-- [ {Dish = pizza, price = 10} ] -->
{"dish" => 2, "dish" => 4}

Red Feature Test

Green Feature Test

Red Unit Test

Green Unit Test

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

- select several dishes from menu - dishes, quantities and total price (order)
- order = menu.to_a.sample(n).to_h (to get a random sample from a hash)

Red Feature Test

Green Feature Test

Red Unit Test

Green Unit Test

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

- check total price(order) is sum of all dishes
order_total = order.value.inject(:+)

Red Feature Test

Green Feature Test

Red Unit Test

Green Unit Test

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

- raise error if numbers don't match
- if they do match send text
time = Time.now
delivery_time = time + 1*00*00
fail "error" if customer_price != order_total
"Thank you! Your order was placed and will be delivered before #{delivery_time}"


Red Feature Test

Green Feature Test

Red Unit Test

Green Unit Test
