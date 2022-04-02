require 'order'

describe Order do
    order = Order.new
    it 'order be an array' do
        expect(order.order).to be_an_instance_of(Array)
    end

end