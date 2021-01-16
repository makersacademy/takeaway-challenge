require 'order'

describe Order do
    subject(:order) { described_class.new }

    it 'accepts a dish and adds it to the order' do
        expect(order.add(:dish)).to eq :dish
    end

end