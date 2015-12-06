require 'menu'
require 'order'

describe Menu do

  let(:dish_name) { "Beef" }
  let(:dish) { [{name: "Beef", price: 7, quantity: 3}] }
  let(:order) { double(:order, add: dish) }
  let(:order_klass) { double(:order_klass, new: order) }
  subject(:menu) { described_class.new(order_klass) }

  describe '#view' do
    it 'should return a full list of dishes with prices' do
      expect(menu.view).to start_with("THE MENU")
    end

    xit 'should return a list of appetisers with prices' do
      expect(menu.view(appetisers)).not_to eq nil
    end
  end

  describe '#choose' do
    it 'should return the choosen dish with its price and quantity' do
      menu.choose(dish_name, 3)
      expect(menu.choose(dish_name, 3)).to eq dish
    end
  end
end
