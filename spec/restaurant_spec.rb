require 'restaurant'

describe Restaurant do
  subject(:restaurant) { described_class.new }

  it 'responds to #menu' do
    expect(restaurant).to respond_to(:menu)
  end

  describe '#menu' do
    it 'prints a list of dishes and prices' do
      restaurant.menu= {Chicken: 2}
      expect { restaurant.menu }.to output("Chicken: £2\n").to_stdout
    end
  end

  describe '#order' do
    it 'the customer can order as many dishes as they like' do
      expect(restaurant).to respond_to(:order).with_unlimited_arguments
    end
    it 'an error is raised if an ordered item is not available' do
      restaurant.menu= {Chicken: 2}
      expect { restaurant.order("Beef") }.to raise_error "Beef is not on the menu"
    end
    it 'adds ordered dishes to an order array' do
      restaurant.menu= {Chicken: 2}
      expect(restaurant.order("Chicken")).to eq ["Chicken"]
    end
  end


end
