require 'restaurant'

describe Restaurant do
  subject(:restaurant) { described_class.new }

  it 'responds to #menu' do
    expect(restaurant).to respond_to(:menu)
  end

  describe '#print_menu' do
    it 'prints a list of dishes and prices' do
      restaurant.menu= {Chicken: 2}
      expect { restaurant.print_menu }.to output("Chicken: £2\n").to_stdout
    end
  end

  describe '#place_order' do
    it 'the customer can order as many dishes as they like' do
      expect(restaurant).to respond_to(:place_order).with_unlimited_arguments
    end
    it 'an error is raised if an ordered item is not available' do
      restaurant.menu= {Chicken: 2}
      expect { restaurant.place_order("Beef") }.to raise_error "Beef is not on the menu"
    end
    it 'adds ordered dishes to an order array' do
      restaurant.menu= {Chicken: 2}
      restaurant.place_order("Chicken")
      expect(restaurant.order).to eq ["Chicken"]
    end
  end

  describe '#order_total' do
    it 'sums the order' do
      restaurant.menu= {Chicken: 2, Beef: 5}
      restaurant.place_order("Chicken", "Beef")
      expect(restaurant.order_total).to eq 7
    end
  end

  describe '#send_SMS' do
    it 'sends an order confirmation SMS' do
      allow(restaurant).to receive(:send_SMS).and_return "Message sent!"
      expect(restaurant.send_SMS).to eq "Message sent!"
    end
  end
end
