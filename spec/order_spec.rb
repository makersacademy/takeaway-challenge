require 'order'

describe Order do
    it 'gets dish input' do
        order = Order.new
        allow(order.input).to receive(:gets).and_return(:name)
    end
    it 'checks input' do
        order = Order.new
        expect(order.input).to eq (1..4)
    end
end