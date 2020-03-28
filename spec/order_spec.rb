require 'order'

describe Order do
  let(:stew_price) { 2.99 }
  let(:rice_price) { 3.22 }
  let(:stew_dish) { double(:stew, name: :stew, price: stew_price) }
  let(:rice_dish) { double(:rice, name: :rice, price: rice_price) }
  let(:list_of_dishes) { double(:dish_list) }

  it 'cannot have zero selections' do
    expect { Order.new(list_of_dishes, {}, 0) }.to raise_error(ArgumentError, 'order must not be empty')
  end

  context 'making orders' do
    let(:number_of_rice_dishes) { 1 }
    let(:number_of_stew_dishes) { 2 } 
    let(:selections) { { stew: number_of_stew_dishes, rice: number_of_rice_dishes } }
    let(:correct_total) { ((stew_price * number_of_stew_dishes) + (rice_price * number_of_rice_dishes)).round(2) }
    let(:incorrect_total) { 5 }

    it 'shows an order summary' do
      allow(list_of_dishes).to receive(:get_dish).with(:stew).and_return(stew_dish)
      allow(list_of_dishes).to receive(:get_dish).with(:rice).and_return(rice_dish)
      order = Order.new(list_of_dishes, selections, correct_total)

      expect(order.summary).to eq({ stew: { quantity: number_of_stew_dishes, price: stew_price }, 
                                    rice: { quantity: number_of_rice_dishes, price: rice_price } })
    end

    it 'errors if the total given does not match the items ordered' do
      allow(list_of_dishes).to receive(:get_dish).with(:stew).and_return(stew_dish)
      allow(list_of_dishes).to receive(:get_dish).with(:rice).and_return(rice_dish)

      expect { Order.new(list_of_dishes, selections, incorrect_total) }
        .to raise_error(ArgumentError, "incorrect order total. Total given = #{incorrect_total}. Actual = #{correct_total}")
    end

    it 'sends a text with the expected delivery time when an order has been verified' do
      allow(list_of_dishes).to receive(:get_dish).with(:stew).and_return(stew_dish)
      allow(list_of_dishes).to receive(:get_dish).with(:rice).and_return(rice_dish)
      text_handler = double(:text_handler, send_confirmation_text: 'Text sent')
      order = Order.new(list_of_dishes, selections, correct_total)

      expect(order.send_text(text_handler)).to eq('Text sent')
    end
  end
end
