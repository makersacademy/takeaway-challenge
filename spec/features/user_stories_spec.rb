describe 'User Stories' do

  let(:menu)  { Menu.new  }
  let(:order) { Order.new(menu.options) }

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'customers can see a list of items with prices' do
    expect(menu.options).to eq({"beef-chuck brisket sub"=>4.5, "pastrami salami sub"=>5.0})
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it 'allows users to add any amount of dishes to their orders' do
    menu.my_order.choose('beef-chuck brisket sub', 2)
    expect(menu.my_order.current).to eq({"beef-chuck brisket sub"=>2})
  end

  it 'does not allow customers to order things that are not on the menu' do
    expect{ menu.my_order.choose('something', 3) }.to raise_error'Sorry mate- something is not on the menu!'
  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order
  it 'initialize order with total of 0' do
    expect(order.total).to eq "Your total is: £0.00."
  end

  it 'adds up price of each selection and stores it in the @total attribute of order' do
    menu.my_order.choose('beef-chuck brisket sub', 2)
    expect(menu.my_order.total).to eq "2 beef-chuck brisket subs at £4.50 each.\nYour total is: £9.00."
  end

  # Place the order by giving the list of dishes,
  # their quantities and a number that should be the exact total.
  # If the number doesn't equal the total- raise error
  it 'allow customers to place order by passing list of dishes/quantities and expected total' do
    menu.my_order.choose('pastrami salami sub', 3)
    expect{ menu.my_order.place_order(menu.my_order.current, 14) }.to raise_error"Sorry mate- but your total is actually 15.0"
  end
end
