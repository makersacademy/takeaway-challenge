require_relative '../lib/order'

describe Order do
  let (:order) { Order.new }

  context 'when creating a current order' do

    it 'an empty array is created' do
      expect(order.current_order).to be_empty
    end
  end

  context 'when adding to the current order' do

    before do
      @fake_dish = double('fake dish', name: 'pasta', price: 10)
      order.add_to_order(@fake_dish)
    end

    it 'the dish is added to the array' do
      expect(order.current_order).to_not be_empty
    end

    it 'the list of dishes added can be viewed' do
      expect do
        order.view_order_summary
      end.to output(a_string_including("pasta, £10")).to_stdout
    end

    it 'the list of dishes added can be calculated' do
      @another_fake_dish = double('another fake dish', name: 'pizza', price: 10)
      order.add_to_order(@another_fake_dish)
      expect do
        order.view_order_summary
      end.to output(a_string_including("Your total: £20")).to_stdout
    end
  end
end
