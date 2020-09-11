require 'order'

describe Order do

  let(:order) { Order.new }

  it 'initialises with a blank variable: dishes' do
    expect(order.dishes).to eq []
  end

  describe '#take_order' do
    it 'Asks for the order, adding to @dishes' do
      #expect { order.dish }.to change

    end
  end

  describe '#add_cost' do
    
  end

end
