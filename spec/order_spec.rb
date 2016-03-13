require 'order'

describe Order do
  let(:dish) {double(:dish, price: 5, name: :steak)}
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
      allow(menu).to receive(:place_order).and_return(dish)
      expect(order.place_order(dish,2)).to eq 10


    end

    xit '3. it should save multiple dishes' do
      allow(menu).to receive(:total)
      menu.create_dish(:fish, 4.56)
      menu.place_order(:fish, 2)
      menu.place_order(:steak,  3)
      expect(menu.order.size).to eq(2)
    end
  end

end
