require 'takeaway'

describe 'user stories' do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'customers can see a list of dishes with prices' do
    takeaway = Takeaway.new
    expect(takeaway.menu).to be_a(Hash)
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it 'customers can select several dishes' do
    takeaway = Takeaway.new
    takeaway.select("bread")
    takeaway.select("apples")
    expect(takeaway.current_order).to eq({bread: 1, apples: 1})
  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order
  it 'customers can see a list of their orders' do
    takeaway = Takeaway.new
    takeaway.select("bread")
    takeaway.select("apples")
    takeaway.select("apples")
    expect(takeaway.print_current_order)
    .to eq("bread: 1 apples: 2")
  end

end