
require 'takeaway'

RSpec.describe 'Takeaway Challenge' do

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

  it 'allows me to see the menu' do
    menu = Menu.new.display
    expect(menu).to eq({ "steak" => 10, "ravioli" => 20, "augbergine salad" => 5 })
  end

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

  it 'lets me select several dishes' do
    user_input = UserInput.new
    allow(user_input).to receive(:ask).with("steak").and_return(true)
    allow(user_input).to receive(:quantity).and_return(1)
    allow(user_input).to receive(:ask).with("ravioli").and_return(false)
    allow(user_input).to receive(:ask).with("augbergine salad").and_return(false)
    takeaway = Takeaway.new(Menu.new, user_input)
    expect(takeaway.order_from_menu.order).to eq({ "steak" => { "quantity" => 1, "price" => 10 } })
  end

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order

# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive an sms confirming my order

  it 'lets me check that the bill matches the sum of the various dishes as per the menu' do
    user_input = UserInput.new
    message = Message.new
    allow(user_input).to receive(:ask).with("steak").and_return(true)
    allow(user_input).to receive(:quantity).and_return(1)
    allow(user_input).to receive(:ask).with("ravioli").and_return(false)
    allow(user_input).to receive(:ask).with("augbergine salad").and_return(false)
    allow(message).to receive(:send).and_return(true)
    takeaway = Takeaway.new(Menu.new, user_input, Order.new, message)
    takeaway.order_from_menu
    expect(takeaway.confirmation).to eq("The total to pay is 10. Confirmation sms arriving soon")
  end

end
