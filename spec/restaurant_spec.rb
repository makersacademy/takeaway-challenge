require 'restaurant'
require 'order'

describe Restaurant do
  describe '#list_dishes' do
    it 'responds to restaurant' do
      expect(subject).to respond_to :list_dishes
    end
    it 'returns a hash of dishes' do
      expect { subject.list_dishes }.to output.to_stdout
    end
  end
  describe '#place_order' do
    it 'allows the customer to place an order' do
      order_double = double(:order, gets: "MexiCali Beef Burger")
      allow(order_double).to receive(:select_dishes).and_return("MexiCali Beef Burger")
      new_restaurant = Restaurant.new(order_double)
      expect(new_restaurant.place_order).to eq "MexiCali Beef Burger"
    end
  end
  describe '#bill' do
    it 'returns a list of menu items with the total at the bottom' do
      order_double = double(:order, gets: "MexiCali Beef Burger")
      allow(order_double).to receive(:summarised_bill).and_return(["MexiCali Beef Burger ---> 12", 12])
      new_restaurant = Restaurant.new(order_double)
      expect(new_restaurant.bill).to eq ["MexiCali Beef Burger ---> 12", 12]
    end
  end
end
