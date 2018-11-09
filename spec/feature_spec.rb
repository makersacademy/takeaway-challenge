require 'takeaway'

describe Takeaway do
    context 'User stories' do
    # As a customer
    # So that I can check if I want to order something
    # I would like to see a list of dishes with prices
    it 'shows list of dishes with prices' do
    takeaway = Takeaway.new
    expect{ takeaway.show_menu }.not_to raise_error
    end
    # As a customer
    # So that I can order the meal I want
    # I would like to be able to select some number of several available dishes
    it 'lets customer to place an order with dishes and their quantity' do
      takeaway = Takeaway.new
      takeaway.select_dish("Chicken Curry", 1)
      takeaway.select_dish("Lamb Curry", 2)
      expect{ takeaway.place_order }.not_to raise_error
    end
  end
end
