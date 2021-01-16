require 'order'

describe Order do
    subject(:order) { described_class.new(:menu) }

    it 'accepts a dish and adds it to the order' do
        expect(order.add(:dish)).to eq :dish
    end

    it 'is initialized with a Menu ojbect as arugument' do
        expect(order.menu).to eq :menu
    end

end