require './lib/takeaway'
describe '#features' do
  it 'out puts a list with prices' do
    # As a customer
    # So that I can check if I want to order something
    # I would like to see a list of dishes with prices
    takeaway = Takeaway.new
    takeaway.read_menu
  end
  it 'enables the customer to select dishes' do
    # As a customer
    # So that I can order the meal I want
    # I would like to be able to select some number of several available dishes
    takeaway = Takeaway.new
    takeaway.read_menu
    takeaway.order 'Naan Bread', 2
  end
end
