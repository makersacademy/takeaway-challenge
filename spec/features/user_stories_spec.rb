describe 'User Stories' do

  let(:menu)  { Menu.new  }
  let(:order) { Order.new(menu.options) }

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'customers can see a list of items with prices' do
    expect(menu.options).to eq({'katsu wrap' => 4.50, 'tikki masala' => 5.00})
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it 'allows users to add any amount of dishes to their orders' do
    menu.my_order.choose('katsu wrap', 2)
    expect(menu.my_order.current).to eq({"katsu wrap"=>2})
  end

  it 'does not allow customers to order things that are not on the menu' do
    expect{ menu.my_order.choose('something', 3) }.to raise_error'Sorry mate- something is not on the menu!'
  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order
  it 'initialize order with total of 0' do
    expect(order.total).to eq "total: 0"
  end

  it 'adds up price of each selection and stores it in the @total attribute of order' do
    menu.my_order.choose('katsu wrap', 2)
    expect(menu.my_order.total).to eq "total: 9.0"
  end

  # Place the order by giving the list of dishes,
  # their quantities and a number that should be the exact total.
  # If the number doesn't equal the total- raise error
  it 'allow customers to place order by passing list of dishes/quantities and expected total' do
    menu.my_order.choose('tikki masala', 3)
    expect{ menu.my_order.place_order(menu.my_order.current, 14) }.to raise_error"Sorry mate- but your total is actually 15.0"
  end
end
