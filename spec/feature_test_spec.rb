
require 'order'
describe 'Feature Test' do
  # As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
  subject(:new_order) {Order.new}
  it 'passes the first feature test' do
    new_order.view_menu
    expect(new_order.view_menu).to eq ({"diet coke"=>0.99, "foie gras"=>18.5, "caviar"=>99.0, "oyster"=>0.99, "champagne"=>50.0})

  end
# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
  it 'passes the second feature test' do
    new_order.add_item_qty("caviar", 1)
    expect{new_order.add_item_qty("coke", 1)}.to raise_error
    new_order.add_item_qty("diet coke", 1)
    expect(new_order.basket_summary).to eq "caviar x1 = 99.0, diet coke x1 = 0.99"
  end




end