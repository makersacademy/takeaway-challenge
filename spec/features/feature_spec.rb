require 'TakeAway'

describe 'User Stories' do
  let(:takeaway) { TakeAway.new }

  # Unit Test 1
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  it 'so that the customer can order something it shows the ist of dishes with prices' do
    expect(takeaway.show_menu).to eq({ 'pizza' => 6.99, 'chips' => 1.50, 'burger' => 3.00 })
  end

  # Unit Test 2
  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes

  it 'allows customer to add an item to their order' do
    takeaway.add_to_order(pizza)
    expect(order.summary).to eq('1x pizza £6.99')
  end

  it 'allows a customer to add a quantitity of an item to their order' do
    takeaway.add_to_order(pizza, 2)
    expect(order.summary).to eq('2x pizza £13.98')
  end

  it 'allows customer to add multiple items in multiple quantities to their order' do
    takeaway.add_to_order(pizza, 2)
    expect(order.summary).to eq('2x pizza £13.98')
  end

  # Unit Test 3
  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order
  #
  # Unit Test 4
  # As a customer
  # So that I am reassured that my order will be delivered on time
  # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
end
