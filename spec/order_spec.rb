require 'order'

describe Order do
  let(:dish) {double(:dish, price: 5, name: :steak)}
  let(:dish2) {double(:dish2, price: 3, name: :tuna)}
  let(:menu) {double(:menu)}
  subject(:order) {described_class.new(menu)}

  describe ' #initialize' do
    it ' 1. should initialize a menu' do
      expect(order.menu).to eq menu
    end
  end

  describe 'see_menu' do
    it ' 1. should access dishes of the menu' do
      expect(menu).to receive(:see_dishes)
      order.see_menu
    end
  end

  describe ' #place_order' do 

    it '1. saves a dish and its quantity' do
      allow(menu).to receive(:place_order).and_return(dish)
      order.place_order(dish, 5)
      expect(order.current_order).to include(dish => 5)
    end

    it '2. returns a subtotal of the dish' do
      allow(menu).to receive(:place_order)
      expect(order).to receive(:subtotal)
      order.place_order(dish,2)
    end
  end

  describe ' #subtotal' do
    
    it '1. returns a subtotal of the order' do
      allow(menu).to receive(:place_order).and_return(dish)
      expect(order.place_order(dish,2)).to eq 10
    end

    it '2. save the subtotal of each dish' do
      allow(menu).to receive(:place_order).and_return(dish)
      expect(order).to receive(:summarize)
      order.place_order(dish,2)
    end
  end

  describe ' #order_summary' do
    it ' should list dishes with their quantity & subtotal' do
      allow(menu).to receive(:place_order).and_return(dish)
      order.place_order(dish,2)
      expect(order.summary.last).to eq [dish, 2, 10]
    end
  end
end
