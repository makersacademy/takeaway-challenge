require 'order'
require 'menu'

describe Order do
  let(:order) { Order.new }

  it 'initializes with a an empty array' do
    expect(order.full_order).to eq([])
  end

  it 'initializes with a menu from the Menu class' do
    expect(order.menu).to eq(Menu::MENU)
  end

  it 'initializes with bill variable == 0' do
    expect(order.bill).to eq(Order::BILL)
  end


  describe 'Adding a dish to an order' do
    it 'responds to #add' do
      expect(order).to respond_to(:add).with(2).arguments
    end

    it 'raises an error if the dish is not on the menu' do
      expect { order.add("pickles") }.to raise_error("This item is not on the menu")
    end

    it 'adds the name of the dish to @full_order' do
      expect { order.add("Burrata") }.to change { order.full_order }.from([]).to(["Burrata"])
    end

    it 'add the cost of the dish to @bill' do
      burrata_cost = 5
      expect { order.add("Burrata") }.to change{order.bill}.from(Order::BILL).to(burrata_cost)
    end

    it 'adds multiple dishes to full_order' do
      expect { order.add("Burrata", 3) }.to change { order.full_order }.from([]).to(["Burrata", "Burrata", "Burrata"])
    end
  end

  describe '#total_correct?' do
    it 'provides the correct total without user input' do
      order.add("Burrata", 2)
      expect(order.total_correct?).to eq true
    end
  end
end
