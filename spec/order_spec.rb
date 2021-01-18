require 'order'
require 'dish'

describe Order do
    subject(:order) { described_class.new(:menu) }
    let(:dish1) { Dish.new(44, 'Ramen', 1.99) }
    let(:dish2) { Dish.new(53, 'Katsu', 2.49) }

    it 'accepts a dish and adds it to the order' do
        expect(order.add(:dish)).to eq :dish
    end

    it 'is initialized with a Menu ojbect as arugument' do
        expect(order.menu).to eq :menu
    end
    
    it 'allows the user to select a number of dishes from the menu' do
        order.add(dish1)
        expect(order.items[-1].name).to eq 'Ramen'
    end

end