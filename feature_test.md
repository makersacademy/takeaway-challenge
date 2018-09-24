As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

MENU_LIST = [{name: 'Bolognese', price: 6}, {name: 'Kotbullar', price: 7.50}, {name: 'Beetroot tart', price: 11.20}]

in IRB
  load('./lib/takeaway.rb')
  takeaway = Takeaway.new
  takeaway.see_menu == [{name: 'Bolognese', price: 6}, {name: 'Kotbullar', price: 7.50}, {name: 'Beetroot tart', price: 11.20}]

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

in IRB
  load('./lib/takeaway.rb')
  takeaway = Takeaway.new
  takeaway.choose('Bolognese', 2)
  takeaway.order == [{name: 'Bolognese', price: 6, amount: 2}]

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

in IRB
  load('./lib/takeaway.rb')
  takeaway = Takeaway.new
  takeaway.choose('Bolognese', 2)
  takeaway.choose('Kotbullar', 1)
  takeaway.check_total
  ==> prints list of ordered dishes plus total


As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

in IRB
  load('./lib/takeaway.rb')
  takeaway = Takeaway.new
  takeaway.choose('Bolognese', 2)
  takeaway.place_order
  --> Do you want to? y
  --> Receive text with total
