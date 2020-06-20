require 'order'

describe Order do
  let(:order) { Order.new }

  describe '#initialize' do

    it 'is initialized with an empty basket' do
    expect(order.basket).to eq([])
    end

  end

end