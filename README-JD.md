#Takeaway-challenge: my plan

##User story

###First block: displaying menu

As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

We need to create a menu object (Class) whose responsibilities/functionalities could be as follows:
-have a (default) list of dishes: a hash is an appropriate structure to store dishes with name as key and price as value
-allow to display menu in a well formatted manner
-allow to `#add_dish` to the list by providing name and price
-allow to `#remove_dish` from the list by providing name

{"Tomatoes mozzarella" => 8,
            "Proscieto" => 12,
            "White beans with balsamic dressing" => 7,
            "Scalopine milanese" => 12,
            "Bolognese spaghetti" => 15,
            "Pizza Calzone" => 13,
            "Tiramisu" => 6,
            "Chocolate cake" => 6,
            "Ice cream selection" => 5}

##Second and third block: placing an order

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

We need to create an order object (Class) whose responsibilities/functionalities could be as follows:
-allow to `#select` dishes from the menu by providing dish name and quantity: order could be stored in a hash and a message indicating price to pay could appear
-`#place_order` by indicating payment amount: if such amount does not match sum, an error message should appear  
-`#send_message` to confirm the order

##Fourth block: sending a message

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

We need to create a message object

describe '#dish_available?' do

  let(:menu) { double(:menu, dishes: {"Pizza" => 12,"Pasta" => 13})}

  subject.select_dish("Pizza",2)
  subject.select_dish("Cod",2)

  it 'indicates dish is available when it is part of the menu' do
    expect(subject.dish_available?("Pizza")).to eq true
    expect(subject.dish_available?("Code")).to eq false
  end
end

, dishes: {"Pizza" => 12,"Pasta" => 13}
