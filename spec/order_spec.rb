require 'order'

describe Order do
  let(:stew_dish) { double(:stew, name: :stew, price: 3) }
  let(:rice_dish) { double(:rice, name: :rice, price: 4) }
  let(:list_of_dishes) { double(:dish_list) }

  context 'argument errors' do
    it 'cannot have zero selections' do
      expect { Order.new(list_of_dishes, {}, 0) }.to raise_error(ArgumentError, 'order must not be empty')
    end
  end

  describe 'making orders' do
    let(:selections) { { stew: 2, rice: 1 } }
    let(:order_summary) { { stew: { quantity: 2, price: 3 }, rice: { quantity: 1, price: 4 } } }
    let(:text_handler) { double(:text_handler, send_confirmation_text: 'Text sent') }
    
    before do
      allow(list_of_dishes).to receive(:get_dish).with(:stew).and_return(stew_dish)
      allow(list_of_dishes).to receive(:get_dish).with(:rice).and_return(rice_dish)
    end

    it 'shows an order summary' do
      order = Order.new(list_of_dishes, selections, 10)
      expect(order.summary).to eq(order_summary)
    end

    it 'errors if the total given does not match the items ordered' do
      expect { Order.new(list_of_dishes, selections, 5) }
        .to raise_error(ArgumentError, "incorrect order total. Total given = #{5}. Actual = 10")
    end

    it 'sends a text with the expected delivery time when an order has been verified' do
      order = Order.new(list_of_dishes, selections, 10)
      expect(order.send_text(text_handler)).to eq('Text sent')
    end
  end
end
