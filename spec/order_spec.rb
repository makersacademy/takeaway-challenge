require 'order'

describe Order do

    it 'recieves a order' do
        order = Order.new
        expect(order.choice(1)).to be_a(Integer)
    end
end
