require 'order'

describe Order do
  let(:stew_dish) { double(:stew, name: :stew, price: 2) }
  let(:rice_dish) { double(:rice, name: :rice, price: 1) }
  let(:list_of_dishes) { double(:dish_list) }
  let(:selections) { { stew: 2, rice: 1 } }

  before do
    allow(list_of_dishes).to receive(:get_dish).with(:stew).and_return(stew_dish)
    allow(list_of_dishes).to receive(:get_dish).with(:rice).and_return(rice_dish)
  end

  context 'functionality' do
    it 'shows an order summary' do
      order = Order.new(list_of_dishes, selections, 5)
      expect(order.summary).to eq({ stew: { quantity: 2, price: 2 }, rice: { quantity: 1, price: 1 } })
    end

    it 'sends a text with the expected delivery time when an order has been verified' do
      text_handler = double(:text_handler, send_confirmation_text: 'Text sent')
      order = Order.new(list_of_dishes, selections, 5)
      expect(order.send_text(text_handler)).to eq('Text sent')
    end
  end

  context 'errors' do
    it 'cannot have zero selections' do
      expect { Order.new(list_of_dishes, {}, 0) }.to raise_error(ArgumentError, 'order must not be empty')
    end

    it 'errors if the total given does not match the items ordered' do
      expect { Order.new(list_of_dishes, selections, 6) }
        .to raise_error(ArgumentError, "incorrect order total. Total given = 6. Actual = 5")
    end

    it 'errors if the order contains a dish not on the menu' do
      allow(list_of_dishes).to receive(:get_dish).with(:broth).and_return(nil)
      expect { Order.new(list_of_dishes, { broth: 3 }, 9.66) }.to raise_error(ArgumentError, 'ordered dish not on menu')
    end 

    it 'errors if the order contains an invalid dish quantity' do
      expect { Order.new(list_of_dishes, { stew: 0 }, 2) }.to raise_error(ArgumentError, 'dish quantity must be > 0')
    end 
  end
end
